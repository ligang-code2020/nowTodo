import { HMRouterMgr } from '@hadss/hmrouter'
import { ResponseResult } from './axios'
import { LoginApi } from './login'
import { LoginInfo } from '../pages/LoginPage';
import { promptAction } from '@kit.ArkUI';


/**
 * @description 获取长token
 */
export const getRefreshToken = () => AppStorage.get<string>('REFRESH_TOKEN')

/**
 * @description 获取短token
 */
export const getAccessToken = () => AppStorage.get<string>('ACCESS_TOKEN')

/**
 * @param accessToken
 * @description 存储短token
 */
export const setAccessToken =
  (accessToken: string) => AppStorage.setOrCreate<string>('ACCESS_TOKEN', accessToken)

/**
 * @param refreshToken
 * @description 存储长token
 */
export const setRefreshToken =
  (refreshToken: string) => AppStorage.setOrCreate<string>('REFRESH_TOKEN', refreshToken)


/**
 * @description 删除短token
 */
export const removeAccessToken = () => AppStorage.setOrCreate<string>('ACCESS_TOKEN', '')


/**
 * @description 删除长token
 */
export const removeRefreshToken = () => AppStorage.setOrCreate<string>('REFRESH_TOKEN', '')


// let subsequent: Promise<ResponseResult> [] = []
let subsequent: ESObject[] = []
let flag = false // 设置开关，保证一次只能请求一次短token，防止客户多此操作，多次请求


/*把过期请求添加在数组中*/
export const addRequest = (request: () => ESObject) => {
  subsequent.push(request)
}


/*调用过期请求*/
export const retryRequest = () => {
  console.log('AxiosRequest', '重新请求上次中断的数据')
  subsequent.forEach((request: () => ESObject) => {
    request()
  })
  subsequent = []
}

/*短token过期，携带token去重新请求token*/
export const refreshToken = () => {
  if (!flag) {
    flag = true;
    let refreshToken = getRefreshToken() // 获取长token
    if (refreshToken) {
      LoginApi.refreshToken().then((res) => {
        // 存储新的 token
        setAccessToken(res.data.access_token)
        setRefreshToken(res.data.refresh_token)
        flag = false
        // 重新请求数据
        retryRequest()

      }).catch((e: ResponseResult) => {
        flag = false
        // 删除 token
        removeRefreshToken()
        // 退出登录
        promptAction.showToast({
          duration: 3000,
          message: '用户信息失效，请重新登录',
          alignment: Alignment.Top,
          offset: {
            dx: '50%',
            dy: 80
          }
        })
        HMRouterMgr.replace({
          pageUrl: 'LoginPage',
          skipAllInterceptor: true
        })
      })
    }
  }
}

