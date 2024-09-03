import InitPage from './InitPage'
import { HomePage } from './HomePage'
import { LoginPage } from './LoginPage'
import display from '@ohos.display';
import { Logger } from '../utils/Logger'
import { AttributeUpdater } from '@kit.ArkUI';
import { HMDefaultGlobalAnimator, HMNavigation, HMRouterMgr } from '@hadss/hmrouter'
import { WelcomeLifecycle } from '../lifecycle/WelcomeLifecycle';


class MyNavModifier extends AttributeUpdater<NavigationAttribute> {
  initializeModifier(instance: NavigationAttribute): void {
    instance.mode(NavigationMode.Stack);
    instance.navBarWidth('100%');
    instance.hideTitleBar(true);
    instance.hideToolBar(true);
  }
}

@Component
@Entry
struct Index {
  modifier: MyNavModifier = new MyNavModifier()
  // pathStack: NavPathStack = new NavPathStack()


  aboutToAppear(): void {
    HMRouterMgr.registerGlobalLifecycle({
      lifecycle: new WelcomeLifecycle,
      lifecycleName: 'WelcomeLifecycle',
      priority: 5,
    })

    // AppStorage.setOrCreate("PathStack", this.pathStack) // 定义全局页面栈
    console.log("屏幕", JSON.stringify(display.getDefaultDisplaySync()))
  }

  build() {
    Column() {
      HMNavigation({
        navigationId: 'myNavigation',
        options: {
          standardAnimator: HMDefaultGlobalAnimator.STANDARD_ANIMATOR,
          dialogAnimator: HMDefaultGlobalAnimator.DIALOG_ANIMATOR,
          modifier: this.modifier
        }
      }) {
        Column() {
          LoginPage()
        }
      }

    }
    .width('100%')
    .height('100%')
  }
}

