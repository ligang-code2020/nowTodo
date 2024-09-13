import display from '@ohos.display';
import { Logger } from '../utils/Logger'
import { AttributeUpdater } from '@kit.ArkUI';
import { HMDefaultGlobalAnimator, HMNavigation, HMRouterMgr } from '@hadss/hmrouter'
import { WelcomeLifecycle } from '../lifecycle/WelcomeLifecycle';
import { PageDurationLifecycle } from '../lifecycle/PageDurationLifecycle'
import { JumpInfoInterceptor } from '../interceptor/JumpInfoInterceptor'
import { FloatTabs } from '../component/FloatTabs'
import { LoginCheckInterceptor } from '../interceptor/LoginCheckInterceptor'
import { HomePage } from './HomePage';


class MyNavModifier extends AttributeUpdater<NavigationAttribute> {
  initializeModifier(instance: NavigationAttribute): void {
    instance.mode(NavigationMode.Stack);
    instance.navBarWidth('100%');
    instance.hideTitleBar(true);
    // instance.hideToolBar(false);
    // instance.hideNavBar(true)
  }
}

@Builder
function customToolBar() {
  Row() {
    FloatTabs()
  }
  .alignItems(VerticalAlign.Center)
  .justifyContent(FlexAlign.Center)
  .width('100%')


}

// 瀑布流子组件WrappedBuilder对象
let flowItemWrapper: WrappedBuilder<ESObject> = wrapBuilder<ESObject>(customToolBar);


@Component
@Entry
struct Index {
  modifier: MyNavModifier = new MyNavModifier()
  @StorageLink('userLogin') userLogin: boolean = false;

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

  build() {
    Column() {
      HMNavigation({
        navigationId: 'myNavigation',
        // homePageUrl:'HomePage',
        options: {
          standardAnimator: HMDefaultGlobalAnimator.STANDARD_ANIMATOR,
          dialogAnimator: HMDefaultGlobalAnimator.DIALOG_ANIMATOR,
          modifier: this.modifier,
          toolbar: flowItemWrapper,
          toolbarOptions: {
            backgroundColor: Color.White
          }
        }
      }) {
        Row() {
          HomePage()
        }
        .height('100%')
        .width('100%')
      }
    }
    .width('100%')
    .height('100%')
  }
}

