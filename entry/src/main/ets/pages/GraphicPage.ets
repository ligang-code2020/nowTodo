import { FloatTabs } from '../component/FloatTabs'
import { CommonContainer } from '../style/common'
import { CircularDiagram } from '../component/CircularDiagram'
import { MCCharts } from '../component/MCCharts'
import { LineChartComponent } from '../component/MPChart'
import { CalendarComp } from '../component/CalendarComp'


@Entry
@Component
export struct GraphicPage {
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
            Column() {
              Row() {
                Column() {
                  Text('今日')
                    .fontSize(20)
                    .fontColor('#10275A')
                    .fontWeight(FontWeight.Bold)
                    .margin({ bottom: 15 })

                  Column({ space: 20 }) {
                    Row() {
                      Line()
                        .startPoint([0, 7])
                        .strokeWidth(2)
                        .strokeLineCap(LineCapStyle.Round)
                        .stroke('#FE3082')
                        .margin({ right: 5 })
                      Text() {
                        Span('6h 54min')
                        Span(' / 10h 20min').fontColor('#aaaaaa')
                      }
                      .fontSize(11)
                      .fontWeight(700)
                    }
                    .width('100%')

                    Row() {
                      Line()
                        .startPoint([0, 7])
                        .strokeWidth(2)
                        .strokeLineCap(LineCapStyle.Round)
                        .stroke('#3EDE00')
                        .margin({ right: 5 })
                      Text() {
                        Span('已完成 10')
                        Span(' / 20').fontColor('#aaaaaa')
                      }
                      .fontSize(11)
                      .fontWeight(700)
                    }
                    .width('100%')

                    Row() {
                      Line()
                        .startPoint([0, 7])
                        .strokeWidth(2)
                        .strokeLineCap(LineCapStyle.Round)
                        .stroke('#00BEE0')
                        .margin({ right: 5 })
                      Text() {
                        Span('进行中 4')
                        Span(' / 8').fontColor('#aaaaaa')
                      }
                      .fontSize(11)
                      .fontWeight(700)
                    }
                    .width('100%')
                  }
                  .width('100%')

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

              Column() {
                Text('本周')
                  .fontSize(20)
                  .fontColor('#10275A')
                  .fontWeight(FontWeight.Bold)
                  .margin({ left: 15, top: 15 })
                  .width('100%')

                MCCharts()
              }
              .width('100%')
              .margin({ top: 40 })
              .borderRadius(16)
              .backgroundColor('#F9FAFD')
              .alignItems(HorizontalAlign.Start)

              Column() {
                Text('本周')
                  .fontSize(20)
                  .fontColor('#10275A')
                  .fontWeight(FontWeight.Bold)
                  .margin({ left: 15, top: 15 })
                  .width('100%')

                CalendarComp()

              }
              .margin({ top: 40 })
              .borderRadius(16)
              .backgroundColor('#F9FAFD')
              .alignItems(HorizontalAlign.Start)

              Blank().height(220)


            }

          }
          .scrollBar(BarState.Off)
        }

      }
      .attributeModifier(this.commonContainerStyle)


      // 悬浮 tabs 栏
      FloatTabs().align(Alignment.Bottom)
    }
    .height('100%')
    .width('100%')
  }
}