import { TaskCard } from '../component/TaskCard'

@Component
  // @Preview

export struct PeriodTaskList {
  build() {
    Column() {
      Line()// .width('100%')
        .startPoint([0, 0])
        .endPoint([300, 0])
        .stroke('#E3E8F1')
        .strokeWidth(1)

      // Column() {
      //
      // }
      // .height(1)
      // .width('100%')
      // .backgroundColor(Color.Red)

      Row() {
        Text('07:00')
          .fontColor('#2C406E')
          .fontSize(14)
          .fontWeight(600)
          .margin({ left: 15, top: 24, right: 21 })


        Scroll() {
          Row({ space: 10 }) {
            TaskCard()
            TaskCard()
            TaskCard()
          }
          .margin({ top: 16 })
          .padding({ right: 48 })
        }
        .scrollable(ScrollDirection.Horizontal)
        .scrollBar(BarState.Off)
      }
      .alignItems(VerticalAlign.Top)

      Line()// .width('100%')
        .startPoint([0, 0])
        .endPoint([300, 0])
        .stroke('#E3E8F1')
        .strokeWidth(1)
        .margin({ top: 20 })


    }
    .height(200)
  }
}