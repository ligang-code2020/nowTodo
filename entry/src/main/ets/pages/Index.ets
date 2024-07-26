import InitPage from './InitPage'
import HomePage from  './HomePage'
import TasksPage from './TasksPage'



@Component
@Entry
struct Index {
  build() {
    Column() {
      TasksPage()
    }
    .width('100%')
  }
}