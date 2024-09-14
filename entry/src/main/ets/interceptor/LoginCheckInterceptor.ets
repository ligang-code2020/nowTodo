import { HMInterceptor, HMInterceptorAction, HMInterceptorInfo, HMRouterMgr, IHMInterceptor } from '@hadss/hmrouter';
import { promptAction } from '@kit.ArkUI';

interface LoginInfo {
  userName: string
  accessToken: string
  refreshToken: string
}

@HMInterceptor({ interceptorName: 'LoginCheckInterceptor' })
export class LoginCheckInterceptor implements IHMInterceptor {
  handle(info: HMInterceptorInfo): HMInterceptorAction {
    let loginInfo = AppStorage.get<string>('ACCESS_TOKEN')
    console.log("xxxx", JSON.stringify(loginInfo))
    if (loginInfo !== '') {
      console.log("xxnologin")
      return HMInterceptorAction.DO_NEXT;
    } else {
      HMRouterMgr.replace({
        pageUrl: 'LoginPage',
        skipAllInterceptor: true
      })
      return HMInterceptorAction.DO_REJECT;
    }
  }
}

