import InitPage from './InitPage'
import { HomePage } from './HomePage'
import { PhoneVerifyPage } from './PhoneVerifyPage'
import { LoginPage } from './LoginPage'
import display from '@ohos.display';
import { Logger } from '../utils/Logger'
import { AttributeUpdater } from '@kit.ArkUI';
import { HMDefaultGlobalAnimator, HMNavigation, HMRouterMgr } from '@hadss/hmrouter'
import { WelcomeLifecycle } from '../lifecycle/WelcomeLifecycle';
import { PageDurationLifecycle } from '../lifecycle/PageDurationLifecycle'
import { JumpInfoInterceptor } from '../interceptor/JumpInfoInterceptor'
import { ExitAppLifecycle } from '../lifecycle/ExitAppLifecycle'
import { FloatTabs } from '../component/FloatTabs'


class MyNavModifier extends AttributeUpdater<NavigationAttribute> {
  initializeModifier(instance: NavigationAttribute): void {
    instance.mode(NavigationMode.Stack);
    instance.navBarWidth('100%');
    instance.hideTitleBar(true);
    // instance.hideToolBar(true);
    instance.hideNavBar(true)
  }
}

@Component
@Entry
struct Index {
  modifier: MyNavModifier = new MyNavModifier()
  @StorageLink('userLogin') userLogin: boolean = false;

  aboutToAppear(): void {
    console.log('xxxaboutToAppear')
    // 注册全局拦截器
    HMRouterMgr.registerGlobalInterceptor({
      interceptor: new JumpInfoInterceptor(),
      interceptorName: 'JumpInfo',
      priority: 5,
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

  onPageShow(): void {
    if (!this.userLogin) {
      HMRouterMgr.replace({
        pageUrl: 'LoginPage'
      })
    }
  }

  @Builder
  customToolBar() {
    FloatTabs()
  }

  build() {
    Column() {
      HMNavigation({
        navigationId: 'myNavigation',
        options: {
          standardAnimator: HMDefaultGlobalAnimator.STANDARD_ANIMATOR,
          dialogAnimator: HMDefaultGlobalAnimator.DIALOG_ANIMATOR,
          modifier: this.modifier,
          toolbar: this.customToolBar()
        }
      }) {
        Stack({ alignContent: Alignment.Bottom }) {
          HomePage()
        }

      }
    }
    .width('100%')
    .height('100%')
  }
}

