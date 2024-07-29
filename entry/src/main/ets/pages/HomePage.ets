import { FloatTabs } from '../component/FloatTabs'
import { CompletedCard } from '../component/CompletedCard'
import { CancelCard } from '../component/CanceledCard'
import { PendingCard } from '../component/PendingCard'
import { OnGoingCard } from '../component/OnGoingCard'
import { TaskList } from '../component/TaskList'

@Entry
@Component
export default struct HomePage {
  @State message: string = 'Hello World';

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Scroll() {
        Column() {
          // 头部
          Row() {
            Column() {
              Text('你好，橘猫')
                .fontSize(28)
                .fontColor('#12175E')
                .fontWeight(700)
                .lineHeight(31)
              Text('千里之行，始于足下。').fontSize(14).fontColor('#575757').margin({ top: 8 })

              Text('我的任务')
                .fontSize(24)
                .fontColor('#12175E')
                .fontWeight(700)
                .width('100%')
                .height(32)
                .margin({ top: 32 })

            }
            .alignItems(HorizontalAlign.Start)
            .layoutWeight(1)


            Column() {
              Image($r('app.media.userIcon')).width(36)
            }
            .width(39)
            .aspectRatio(1)
            .borderRadius(14)
            .shadow({
              radius: 13,
              color: '#F1F7FF',
              offsetX: -3,
              offsetY: 7
            })

          }
          .width('100%')
          .margin({ top: 45 })
          .justifyContent(FlexAlign.SpaceBetween)
          .alignItems(VerticalAlign.Top)


          // 任务概览卡片
          Row({ space: 16 }) {
            Column() {
              // 已完成卡片
              CompletedCard()
              // 已取消卡片
              CancelCard()
            }
            .layoutWeight(1)

            Column() {
              // 暂停中
              PendingCard()

              // 进行中
              OnGoingCard()
            }
            .layoutWeight(1)
          }
          .margin({ top: 16 })

          // 任务列表
          Column() {
            Row() {
              Text('今日任务').fontSize(24).fontWeight(FontWeight.Bold).fontColor('#12175E')
              Text('查看全部').fontSize(12).fontColor('#393F93')
            }
            .width('100%')
            .justifyContent(FlexAlign.SpaceBetween)
            .margin({ bottom: 24 })

            TaskList()
          }
          .margin({ top: 22 })

        }
        .justifyContent(FlexAlign.Start)
        .width('100%')
        .padding({ left: 24, right: 24})
      }
      .scrollBar(BarState.Off)

      // 悬浮 tabs 栏
      FloatTabs().align(Alignment.Bottom)

    }
    .height('100%')
    .width('100%')
  }
}