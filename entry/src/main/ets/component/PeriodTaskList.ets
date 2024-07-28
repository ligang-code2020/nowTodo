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
        Column() {
          Text('07:00')
            .fontColor('#2C406E')
            .fontSize(14)
            .fontWeight(600)
            .zIndex(10)
            .margin({ left: 11, top: 24, right: 21 })
        }


        Scroll() {
          Row({ space: 10 }) {
            TaskCard()
            TaskCard()
            TaskCard()
          }
          .margin({ left: 65, top: 15 })
          .padding({ right: 48 })
          // .border({ width: 1 })
          .height(100)
        }
        .scrollable(ScrollDirection.Horizontal)
        .scrollBar(BarState.Off)
      }

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