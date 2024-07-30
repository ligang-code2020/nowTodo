import { FloatTabs } from '../component/FloatTabs'
import { CommonContainer } from '../style/common'
import { CircularDiagram } from '../component/CircularDiagram'

@Entry
@Component
struct GraphicPage {
  @State commonContainerStyle: CommonContainer = new CommonContainer()

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        Text('图表')
          .fontSize(18)
          .height(29)
          .fontColor('#10275A')
          .fontWeight(FontWeight.Bold)
          .margin({ top: 45, bottom: 30 })

        Column() {
          Scroll() {
            Row() {
              Column() {
                Text('今日')
                  .fontSize(20)
                  .fontColor('#8586A9')
                  .fontWeight(FontWeight.Bold)

                // Text('6个小时54min')
                // Text('已完成 10')
                // Text('进行中 2')
              }
              .padding({ left: 15, top: 15 })
              .alignItems(HorizontalAlign.Start)
              .layoutWeight(1)

              // 环形图
              CircularDiagram()
            }
            .width('100%')
            .alignItems(VerticalAlign.Top)
            .justifyContent(FlexAlign.SpaceBetween)
            .backgroundColor('#F9FAFD')
            .borderRadius(16)
          }
        }
        .height('100%')

      }
      .attributeModifier(this.commonContainerStyle)


      // 悬浮 tabs 栏
      FloatTabs().align(Alignment.Bottom)
    }
    .height('100%')
    .width('100%')
  }
}