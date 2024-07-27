import InitPage from './InitPage'
import HomePage from './HomePage'
import TasksPage from './TasksPage'
import display from '@ohos.display';


@Component
@Entry
struct Index {
  aboutToAppear(): void {
    console.log("屏幕", JSON.stringify(display.getDefaultDisplaySync()))
  }

  build() {
    Column() {
      TasksPage()
    }
    .width('100%')
  }
}