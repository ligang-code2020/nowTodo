import InitPage from './InitPage'
import HomePage from  './HomePage'


@Component
@Entry
struct Index {
  build() {
    Column() {
      HomePage()
    }
    .width('100%')
  }
}