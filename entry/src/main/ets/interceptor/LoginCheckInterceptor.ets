import { HMInterceptor, HMInterceptorAction, HMInterceptorInfo, HMRouterMgr, IHMInterceptor } from '@hadss/hmrouter';

interface LoginInfo {
  userName: string
  accessToken: string
  refreshToken: string
}

@HMInterceptor({ interceptorName: 'LoginCheckInterceptor' })
export class LoginCheckInterceptor implements IHMInterceptor {
  handle(info: HMInterceptorInfo): HMInterceptorAction {
    let loginInfo = AppStorage.get<LoginInfo>('LOGIN_INFO')
    console.log("xxxx",JSON.stringify(loginInfo))
    if (loginInfo?.accessToken) {
      console.log("xxnologin")
      return HMInterceptorAction.DO_NEXT;
    } else {
      console.log("xxlogin")
      HMRouterMgr.replace({
        pageUrl: 'LoginPage',
        skipAllInterceptor: true
      })
      return HMInterceptorAction.DO_REJECT;
    }
  }
}

