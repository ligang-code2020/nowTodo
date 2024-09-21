import { FloatTabs } from '../component/FloatTabs'
import { CommonContainer } from '../style/common'
import { CircularDiagram } from '../component/CircularDiagram'
import { MCCharts } from '../component/MCCharts'
import { CalendarComp } from '../component/CalendarComp'
import { HMRouter } from '@hadss/hmrouter'
import dayjs from 'dayjs'
import { circularDiagramData } from '../common/constants/circularDiagramData'

export interface CurrentDayData {
  totalTime: number
  consumeTime: number
  totalTasks: number
  completedTasks: number
  onGoingTasks: number
}

@HMRouter({
  pageUrl: 'GraphicPage',
  singleton: true
})
@Component
@Entry
export struct GraphicPage {
  @State commonContainerStyle: CommonContainer = new CommonContainer()
  @State @Watch('onCountUpdated') selectedDate: string = dayjs().format('YYYY-MM-DD')
  @State currentDayData: CurrentDayData = {
    totalTime: 0,
    consumeTime: 0,
    totalTasks: 0,
    completedTasks: 0,
    onGoingTasks: 0
  }

  aboutToAppear(): void {
    this.searchCurrentDayData(this.selectedDate)
  }

  onCountUpdated(changedPropertyName: string) {
    console.log("xxxparent", this.selectedDate)
    this.searchCurrentDayData(this.selectedDate)
  }

  searchCurrentDayData(date: string) {
    const data = circularDiagramData.find(item => item.date === date)
    console.log("xxxdata", JSON.stringify(data))
    if (data) {
      this.currentDayData.totalTime = data.totalTime
      this.currentDayData.consumeTime = data.consumeTime
      this.currentDayData.totalTasks = data.totalTasks
      this.currentDayData.completedTasks = data.completedTasks
      this.currentDayData.onGoingTasks = data.onGoingTasks
    }
  }

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
              // 日视图
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
                CircularDiagram({
                  currentDayData: this.currentDayData
                })
              }
              .width('100%')
              .alignItems(VerticalAlign.Top)
              .justifyContent(FlexAlign.SpaceBetween)
              .backgroundColor('#F9FAFD')
              .borderRadius(16)

              if (false) {
                // 周视图
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
              }


              // 月视图
              Column() {
                Text('本月')
                  .fontSize(20)
                  .fontColor('#10275A')
                  .fontWeight(FontWeight.Bold)
                  .margin({ left: 15, top: 15 })
                  .width('100%')

                CalendarComp({
                  selectedDate: $selectedDate
                })

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