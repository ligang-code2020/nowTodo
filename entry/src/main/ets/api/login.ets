import { httpGet, httpPost, ResponseResult } from './axios'


interface Login {
  username: string
  password: string
}

interface FindUser {
  username: string
}


export class LoginApi {
  // 登录接口
  static login(loginParams: Login): Promise<ResponseResult> {
    return httpPost('xxx', false, loginParams)
  }

  // 查找用户
  static findUser(findUserParams: FindUser): Promise<ResponseResult> {
    return httpPost('/api/user/findUser', false, findUserParams)
  }
}