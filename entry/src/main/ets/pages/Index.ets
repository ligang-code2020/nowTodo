import InitPage from './InitPage'
import { HomePage } from './HomePage'
import { TasksPage } from './TasksPage'
import {GraphicPage} from './GraphicPage'
import display from '@ohos.display';


@Component
@Entry
struct Index {
  aboutToAppear(): void {
    console.log("屏幕", JSON.stringify(display.getDefaultDisplaySync()))
  }

  build() {
    Column() {
      GraphicPage()
    }
    .width('100%')
  }
}