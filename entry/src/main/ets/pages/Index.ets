import InitPage from './InitPage'
import { HomePage } from './HomePage'
import { TasksPage } from './TasksPage'
import { GraphicPage } from './GraphicPage'
import { CalendarComp } from '../component/CalendarComp'
import { AddTaskPage } from './AddTaskPage'
import display from '@ohos.display';


@Component
@Entry
struct Index {
  aboutToAppear(): void {
    console.log("屏幕", JSON.stringify(display.getDefaultDisplaySync()))
    console.log("xxxx", "二〇二四年六月廿七".slice(-2))
  }

  build() {
    Column() {
      GraphicPage()
      // AddTaskPage()
    }
    .width('100%')
  }
}