import display from '@ohos.display';
import { Logger } from '../utils/Logger'
import app, { AppResponse } from '@system.app'
import { AttributeUpdater } from '@kit.ArkUI';
import { HMDefaultGlobalAnimator, HMNavigation, HMRouterMgr } from '@hadss/hmrouter'
import { WelcomeLifecycle } from '../lifecycle/WelcomeLifecycle';
import { PageDurationLifecycle } from '../lifecycle/PageDurationLifecycle'
import { JumpInfoInterceptor } from '../interceptor/JumpInfoInterceptor'
import { LoginCheckInterceptor } from '../interceptor/LoginCheckInterceptor'



class MyNavModifier extends AttributeUpdater<NavigationAttribute> {
  initializeModifier(instance: NavigationAttribute): void {
    instance.mode(NavigationMode.Stack);
    instance.navBarWidth('100%');
    instance.hideTitleBar(true);
    instance.hideToolBar(true);
    instance.hideNavBar(true)
  }
}


@Component
@Entry
struct Index {
  modifier: MyNavModifier = new MyNavModifier()
  @StorageProp('topRectHeight') topRectHeight: number = 0;

  aboutToAppear(): void {
    // 注册全局拦截器
    HMRouterMgr.registerGlobalInterceptor({
      interceptor: new JumpInfoInterceptor(),
      interceptorName: 'JumpInfo',
      priority: 5,
    })

    HMRouterMgr.registerGlobalInterceptor({
      interceptor: new LoginCheckInterceptor(),
      interceptorName: 'LoginCheck',
      priority: 1,
    })


    // 注册全局生命周期
    HMRouterMgr.registerGlobalLifecycle({
      lifecycle: new WelcomeLifecycle,
      lifecycleName: 'WelcomeLifecycle',
      priority: 5,
    })

    HMRouterMgr.registerGlobalLifecycle({
      lifecycle: new PageDurationLifecycle(),
      lifecycleName: 'PageDuration',
      priority: 5,
    })


  }

  build() {
    Column() {
      HMNavigation({
        navigationId: 'myNavigation',
        homePageUrl: 'HomePage',
        options: {
          standardAnimator: HMDefaultGlobalAnimator.STANDARD_ANIMATOR,
          dialogAnimator: HMDefaultGlobalAnimator.DIALOG_ANIMATOR,
          modifier: this.modifier,
        }
      })
    }
    .width('100%')
    .height('100%')
    .padding({ top: this.topRectHeight })
  }
}

