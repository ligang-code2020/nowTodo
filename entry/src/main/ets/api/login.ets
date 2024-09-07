import CryptoJS from '@ohos/crypto-js'
import { httpGet, httpPost, ResponseResult } from './axios'
import { secret } from '../utils/Secret'
import { systemDateTime } from '@kit.BasicServicesKit'
import { defer, retry } from 'rxjs'
import axios from '@ohos/axios'
import { getRefreshToken } from './token'


interface Login {
  username: string
  password: string
}

interface FindUser {
  username: string
}

interface PhoneCode {
  phone: string,
  code: string
}

interface RefreshTokenParams {
  // refreshToken: string
}


export class LoginApi {
  // 登录接口
  static login(loginParams: Login): Promise<ResponseResult> {
    return httpPost('/api/user/login', false, loginParams)
  }

  // 刷新 refreshToken
  static refreshToken(): Promise<ResponseResult> {
    return httpGet('/api/user/refreshToken', null, {
      'R-Authorization': getRefreshToken()
    })
  }

  // 查找用户
  static findUser(findUserParams: FindUser): Promise<ResponseResult> {
    return httpPost('/api/user/findUser', false, findUserParams)
  }

  // 获取手机验证码
  static getPhoneCode(getPhoneCode: PhoneCode): Promise<ResponseResult> {
    const hex: string = CryptoJS.HmacSHA256('1724831029000' + '\n' + secret, secret).toString()
    let word: string = CryptoJS.enc.Hex.parse(hex)
    let signature: string = CryptoJS.enc.Base64.stringify(word)

    console.log("xxxx", signature)

    return httpPost('/api/user/getPhoneCode', false, getPhoneCode, {}, {
      timestamp: 1724831029000,
      signature
    })
  }
}