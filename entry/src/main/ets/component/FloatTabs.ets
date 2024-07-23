@Component
@Preview
@Entry
export struct FloatTabs {
  build() {
    Column() {
      Row() {
        Row() {
          // 主页
          Column() {
            Column() {
            }
            .width(24)
            .aspectRatio(1)
            .backgroundColor(Color.Black)
          }
          .layoutWeight(1)
          .border({ width: 1 })
          .alignItems(HorizontalAlign.Start)

          // 列表
          Column() {
            Column() {
            }
            .width(24)
            .aspectRatio(1)
            .backgroundColor(Color.Blue)

          }
          .layoutWeight(1)
          .border({ width: 1 })
          .alignItems(HorizontalAlign.Start)
        }
        .layoutWeight(1)
        .height('100%')
        .border({ width: 1 })


        // new task
        Column() {
          Button('+', { type: ButtonType.Circle, stateEffect: false })
            .backgroundColor('#5B67CA')
            .fontSize(28)
            .fontWeight(500)
            .width(50)
            .width('100%')
            .height('100%')
        }
        .backgroundColor(Color.Blue)
        .height('100%')


        Column() {
        }
        .layoutWeight(1)
        .height('100%')
        .border({ width: 1 })
        .justifyContent(FlexAlign.Center)

      }
      .width('100%')
      .height(50)
    }
    .padding({
      left: 20,
      right: 20,
      top: 12,
      bottom: 12
    })
    .backgroundColor('#FFFFFF')
    .height(74)
    .width('100%')
    .borderRadius(14)
    .justifyContent(FlexAlign.End)
    .shadow({
      radius: 13,
      color: '#F1F7FF',
      offsetX: -3,
      offsetY: 7
    })

  }
}