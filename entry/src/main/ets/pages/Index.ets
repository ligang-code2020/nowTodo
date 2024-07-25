import InitPage from './InitPage'
import HomePage from  './HomePage'
import TasksPage from './TasksPage'
import {TabsExample} from './test1'


@Component
@Entry
struct Index {
  build() {
    Column() {
      TabsExample()
    }
    .width('100%')
  }
}