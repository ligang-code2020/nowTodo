import InitPage from './InitPage'
import { HomePage } from './HomePage'
import { LoginPage } from './LoginPage'
import display from '@ohos.display';
import { Logger } from '../utils/Logger'




@Component
@Entry
struct Index {
  pathStack: NavPathStack = new NavPathStack()

  aboutToAppear(): void {
    AppStorage.setOrCreate("PathStack", this.pathStack) // 定义全局页面栈
    console.log("屏幕", JSON.stringify(display.getDefaultDisplaySync()))
  }

  build() {
    Navigation(this.pathStack) {
      Column() {
        LoginPage()
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
    .hideTitleBar(true)
    .mode(NavigationMode.Stack)

  }
}

