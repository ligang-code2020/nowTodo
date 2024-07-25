import { CommonContainer } from '../style/common'
import { SearchBar } from '../component/SearchBar'

@Entry
@Component
struct TasksPage {
  @State commonContainerStyle: CommonContainer = new CommonContainer()

  build() {
    Stack() {
      Scroll() {
        Column() {
          // 搜索栏
          SearchBar()
        }
        .height('100%')
        .attributeModifier(this.commonContainerStyle)
      }
      .scrollBar(BarState.Off)
    }
    .height('100%')
    .width('100%')
  }
}