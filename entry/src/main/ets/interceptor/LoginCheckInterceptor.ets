import { HMInterceptor, HMInterceptorAction, HMInterceptorInfo, HMRouterMgr, IHMInterceptor } from '@hadss/hmrouter';
import { promptAction } from '@kit.ArkUI';

interface LoginInfo {
  userName: string
  accessToken: string
  refreshToken: string
}

const NOT_INTERCEPTOR_PAGE_LIST: string[] = [
  'PhoneLoginPage'
]

@HMInterceptor({ interceptorName: 'LoginCheckInterceptor' })
export class LoginCheckInterceptor implements IHMInterceptor {
  handle(info: HMInterceptorInfo): HMInterceptorAction {
    let loginInfo = AppStorage.get<string>('ACCESS_TOKEN')
    console.log("xxxx", JSON.stringify(loginInfo))
    console.log("xxxHMInterceptorInfo", JSON.stringify(info))
    if (info.type === 'pop' && NOT_INTERCEPTOR_PAGE_LIST.includes(info.targetName as string)) {
      return HMInterceptorAction.DO_NEXT;
    } else {
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
}

