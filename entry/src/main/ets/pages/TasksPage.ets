import { CommonContainer } from '../style/common'
import { SearchBar } from '../component/SearchBar'
import { WeeklyTabs } from '../component/WeeklyTabs'
import { PeriodTaskList } from '../component/PeriodTaskList'

@Entry
@Component
export default struct TasksPage {
  @State commonContainerStyle: CommonContainer = new CommonContainer()

  build() {
    Stack() {
      Scroll() {
        Column() {
          // 搜索栏
          SearchBar()

          Row() {
            Text('任务').fontSize(24).fontWeight(FontWeight.Bold).fontColor('#10275A')
            Row() {
              Image($r('app.media.calendar')).width(14).aspectRatio(1).margin({ right: 5 })
              Text('2024年7月').fontSize(12).fontColor('#525F77')
            }
          }
          .margin({ top: 30 })
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)

          // 周内选择
          WeeklyTabs().margin({ top: 16 })

          Row() {
            Text('今天').fontSize(20).fontWeight(600).fontColor('#10275A')
            Text('9个小时45分钟').fontSize(14).fontWeight(FontWeight.Bold).fontColor('#10275A')
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          .margin({ top: 24, bottom: 30 })

          PeriodTaskList()
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