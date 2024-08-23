import InitPage from './InitPage'
import { HomePage } from './HomePage'
import { TasksPage } from './TasksPage'
import { GraphicPage } from './GraphicPage'
import { CalendarComp } from '../component/CalendarComp'
import { AddTaskPage } from './AddTaskPage'
import { TaskSetPage } from './TaskSetPage'
import display from '@ohos.display';
import { Logger } from '../utils/Logger'
import { LoginApi } from '../api/login'


@Component
@Entry
struct Index {
  aboutToAppear(): void {
    console.log("屏幕", JSON.stringify(display.getDefaultDisplaySync()))
    console.log("xxxx", "二〇二四年六月廿七".slice(-2))
    LoginApi.findUser({
      username: "xxxx"
    })

  }

  build() {
    Column() {
      InitPage()
    }
    .width('100%')
  }
}