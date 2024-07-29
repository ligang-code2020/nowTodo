import { CommonContainer } from '../style/common'
import { SearchBar } from '../component/SearchBar'
import { WeeklyTabs } from '../component/WeeklyTabs'
import { PeriodTaskList } from '../component/PeriodTaskList'
import { FloatTabs } from '../component/FloatTabs'

@Entry
@Component
export struct TasksPage {
  @State commonContainerStyle: CommonContainer = new CommonContainer()

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        // 搜索栏
        SearchBar()
          .margin({ top: 45 })

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

        List({ space: 16 }) {
          ForEach(Array.from({ length: 6 }), () => {
            ListItem() {
              PeriodTaskList()
            }
          })

          // 底部留白
          ListItem() {
            Column() {
              Blank().height(100)
            }
          }
        }
        .edgeEffect(EdgeEffect.None)
        .scrollBar(BarState.Off)
        .layoutWeight(1)
        .width('100%')
      }
      .height('100%')
      .attributeModifier(this.commonContainerStyle)


      // 悬浮 tabs 栏
      FloatTabs().align(Alignment.Bottom)
    }
    .height('100%')
    .width('100%')
  }
}