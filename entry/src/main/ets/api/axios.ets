/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import axios, { AxiosError, AxiosRequestConfig, AxiosResponse, InternalAxiosRequestConfig, Method } from '@ohos/axios';
import { Logger } from '../utils/Logger';
import { systemDateTime } from '@kit.BasicServicesKit';
import { HashMap } from '@kit.ArkTS';
// import Constant from '../common/Constant';
import { StringBuilder } from '../utils/StringBuilder';


export class ResponseResult {
  statusCode: number | string | undefined | null;
  success: boolean | null | undefined
  message: string | Resource | undefined | null;
  data?: string | Object | ArrayBuffer | undefined | null;

  constructor() {
    this.success = true;
    this.statusCode = 200;
    this.message = '';
    this.data = null;
  }
}


const TAG: string = "AxiosRequest"
const timeout = 20000 // 20s超时
const baseUrl = '30.128.56.202:3000'

export function httpDefaultSetting() {
  // default settings
  axios.defaults.baseURL = baseUrl;
  axios.defaults.timeout = timeout;

  // default headers
  axios.defaults.headers.common['Client-Type'] = 'xxx';
  axios.defaults.headers.common['Client-Version'] = '1.0.4';
  axios.defaults.headers.common['Os'] = 'hmos';
  axios.defaults.headers.common['Token'] = 'xxx';

  // for post
  axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded'

  // 添加请求拦截器
  axios.interceptors.request.use((config: InternalAxiosRequestConfig) => {
    return transRequest(config);
  }, (error: AxiosError) => {
    return Promise.reject(error);
  });

  // 添加响应拦截器
  axios.interceptors.response.use((response: AxiosResponse) => {
    return transResponse(response);
  }, (error: AxiosError) => {
    return Promise.reject(error);
  });
}

/**
 * 处理请求体的拦截器操作逻辑
 */
function transRequest(config: InternalAxiosRequestConfig): InternalAxiosRequestConfig {
  try {
    let millis = systemDateTime.getTime();
    // config.headers['t'] = millis - Constant.offsetTime; // 同步时间
    config.headers['Authorization'] = '' // 写入token

    // 增加验签逻辑
    // 验签可以仅在需要的请求中增加验签，通过增加特定的header属性来区分
  } finally {
    return config;
  }
}

/**
 * 处理请求结果的拦截器操作逻辑
 */

let lt = 0

function transResponse(response: AxiosResponse): AxiosResponse {
  try {
    let millis = systemDateTime.getTime();
    if (lt != 0 && millis - lt < 60000) {
      return response;
    } // 可选，性能优化 1分钟内避免重复处理
    lt = millis
    let headers: HashMap<string, ESObject> = JSON.parse(JSON.stringify(response.headers));
    let t: number = headers['servertimestamp'];
    // Constant.offsetTime = millis - t;
    return response;
  } catch (e) {
    console.error(e)
    return response;
  }
}


/**
 * Initiates an HTTP request to a given URL.
 *
 * @param url URL for initiating an HTTP request.
 * @param params Params for initiating an HTTP request.
 */
export function httpGet<D>(url: string, params?: ESObject, headers?: ESObject): Promise<D> {
  Logger.debug(TAG, "httpGet: ");
  return new Promise<D>((resolve: Function, reject: Function) => {
    let startTime = systemDateTime.getTime()
    axios.get<ResponseResult, AxiosResponse<ResponseResult>, null>(url, {
      headers: headers,
      // 指定请求超时的毫秒数(0 表示无超时时间)
      timeout: timeout, // 超时

      // `connectTimeout` 指定请求连接服务器超时的毫秒数(0 表示无超时时间)
      // 如果请求连接服务器超过 `connectTimeout` 的时间，请求将被中断
      // connectTimeout: 60000, // 文档和代码不一致，代码中无法设置连接超时时间
      params: params
    }).then((response: AxiosResponse<ResponseResult>) => {
      let duration = (systemDateTime.getTime() - startTime).toString()
      Logger.debug(TAG, "httpGet: Success. duration=" + duration);
      Logger.debug(TAG, "--------------------------------------");
      Logger.debug(TAG, "config=" + JSON.stringify(response.config));
      Logger.debug(TAG, "status=" + response.status);
      // logger.debug(TAG, "statusText=" + response.statusText); // always empty??
      Logger.debug(TAG, "headers=" + JSON.stringify(response.headers));
      Logger.debug(TAG, "data=" + JSON.stringify(response.data));
      Logger.debug(TAG, "--------------------------------------");
      if (isSuccess(response)) {
        if (isResultSuccess(response.data)) {
          resolve(response.data.data);
        } else {
          const e: Error = { name: `${response.data.statusCode}`, message: `${response.data.message}` }
          reject(e);
        }
      } else {
        const e: Error = { name: `${response.status}`, message: `${response.statusText}` }
        reject(e);
      }
    })
      .catch((reason: AxiosError) => {
        Logger.error(TAG, JSON.stringify(reason));
        reject(reason)
      })
  });
}


function getRequestFormData(data?: ESObject): string | undefined {
  if (data == undefined) {
    return undefined;
  }
  let stringBuilder = new StringBuilder();
  Object.keys(data).forEach((key: string) => {
    stringBuilder.append(`${encodeURIComponent(key)}=${encodeURIComponent(data[key])}`)
  })
  const formData = stringBuilder.build('&');
  Logger.debug(TAG, "getRequestFormData: formData=" + formData);
  return formData;
}

function buildPostRequestHeader(isFormUrlencoded: boolean,
  headers?: Record<ESObject, ESObject>): Record<ESObject, ESObject> {
  if (headers != null) {
    headers['Content-Type'] = isFormUrlencoded ? 'application/x-www-form-urlencoded' : 'application/json'
    return headers
  }
  return {
    'Content-Type': isFormUrlencoded ? 'application/x-www-form-urlencoded' : 'application/json',
  }
}

/**
 * Initiates an HTTP request to a given URL.
 *
 * @param url URL for initiating an HTTP request.
 * @param params Params for initiating an HTTP request.
 */
export function httpPost<D>(url: string, isFormUrlencoded: boolean = false, data?: ESObject, params?: ESObject,
  headers?: ESObject): Promise<D> {
  Logger.debug(TAG, "httpPost: ");
  return new Promise<D>((resolve: Function, reject: Function) => {
    let startTime = systemDateTime.getTime()
    axios.post(url, isFormUrlencoded ? getRequestFormData(data) : data, {
      headers: buildPostRequestHeader(isFormUrlencoded, headers),
      // 指定请求超时的毫秒数(0 表示无超时时间)
      timeout: timeout, // 超时
      // `connectTimeout` 指定请求连接服务器超时的毫秒数(0 表示无超时时间)
      // 如果请求连接服务器超过 `connectTimeout` 的时间，请求将被中断
      // connectTimeout: 60000, // 文档和代码不一致，代码中无法设置连接超时时间
      params: params,
    })
      .then((response: AxiosResponse<ResponseResult>) => {
        let duration = (systemDateTime.getTime() - startTime).toString()
        Logger.debug(TAG, "httpPost: Success. duration=" + duration);
        Logger.debug(TAG, "--------------------------------------");
        Logger.debug(TAG, "config=" + JSON.stringify(response.config));
        Logger.debug(TAG, "status=" + response.status);
        // logger.debug(TAG, "statusText=" + response.statusText); // always empty??
        Logger.debug(TAG, "headers=" + JSON.stringify(response.headers));
        Logger.debug(TAG, "data=" + JSON.stringify(response.data));
        Logger.debug(TAG, "--------------------------------------");
        if (isSuccess(response)) {
          if (isResultSuccess(response.data)) {
            resolve(response.data.data);
          } else {
            console.log("失败",'xxxxxx')
            const e: Error = { name: `${response.data.statusCode}`, message: `${response.data.message}` }
            reject(e);
          }
        } else {
          const e: Error = { name: `${response.status}`, message: `${response.statusText}` }
          reject(e);
        }
      })
      .catch((reason: AxiosError) => {
        Logger.error(TAG, JSON.stringify(reason));
        reject(reason)
      })
  });
}

/**
 * Initiates an HTTP request to a given URL.
 *
 * @param url URL for initiating an HTTP request.
 * @param params Params for initiating an HTTP request.
 */
export function httpRequest<D>(url: string, method?: Method | string, data?: D,
  config?: AxiosRequestConfig<D>): Promise<ResponseResult> {
  // logger.debug(TAG, "httpRequest: ");
  return new Promise<ResponseResult>((resolve: Function, reject: Function) => {
    let startTime = systemDateTime.getTime()
    axios.request<ResponseResult, AxiosResponse<ResponseResult>, D>({
      url: url,
      method: method,
      baseURL: baseUrl,
      headers: config?.headers,

      // 指定请求超时的毫秒数(0 表示无超时时间)
      timeout: timeout, // 超时

      // `connectTimeout` 指定请求连接服务器超时的毫秒数(0 表示无超时时间)
      // 如果请求连接服务器超过 `connectTimeout` 的时间，请求将被中断
      // connectTimeout: 60000, // 文档和代码不一致，代码中无法设置连接超时时间

      params: config?.params,
      data: data ?? config?.data
    })
      .then((response: AxiosResponse<ResponseResult>) => {
        let duration = (systemDateTime.getTime() - startTime).toString()
        Logger.debug(TAG, "httpRequest: Success. duration=" + duration);
        Logger.debug(TAG, "--------------------------------------");
        Logger.debug(TAG, "config=" + JSON.stringify(response.config));
        Logger.debug(TAG, "status=" + response.status);
        // logger.debug(TAG, "statusText=" + response.statusText); // always empty??
        Logger.debug(TAG, "headers=" + JSON.stringify(response.headers));
        Logger.debug(TAG, "data=" + JSON.stringify(response.data));
        Logger.debug(TAG, "--------------------------------------");
        if (isSuccess(response)) {
          if (isResultSuccess(response.data)) {
            resolve(response.data.data);
          } else {
            const e: Error = { name: `${response.data.statusCode}`, message: `${response.data.message}` }
            reject(e);
          }
        } else {
          const e: Error = { name: `${response.status}`, message: `${response.statusText}` }
          reject(e);
        }
      })
      .catch((reason: AxiosError) => {
        Logger.error(TAG, JSON.stringify(reason));
        reject(reason)
      })
  });
}

function isSuccess(response: AxiosResponse): boolean {
  return response.status >= 200 && response.status < 300
}

function isResultSuccess(result: ResponseResult): boolean {
  return result.success === true
}
