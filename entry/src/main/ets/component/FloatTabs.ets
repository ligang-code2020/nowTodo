@Component
export struct FloatTabs {
  build() {
    Column() {
      Row() {
        Row() {
          // 主页
          Column() {
            Column() {
              Image($r("app.media.selected_home"))
              Circle({ width: 4, height: 4 }).fill('#5B67CA').margin({ top: 3 })
            }
            .width(24)
            .aspectRatio(1)
          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Start)

          // 列表
          Column() {
            Column() {
              Image($r("app.media.list"))
            }
            .width(24)
            .aspectRatio(1)

          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Start)
        }
        .layoutWeight(1)
        .height('100%')


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
        .height('100%')

        Row() {
          // 图表
          Column() {
            Column() {
              Image($r("app.media.charts"))
            }
            .width(24)
            .aspectRatio(1)
          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.End)

          // 配置
          Column() {
            Column() {
              Image($r("app.media.profile"))
            }
            .width(24)
            .aspectRatio(1)

          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.End)
        }
        .layoutWeight(1)
        .height('100%')

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
    .backgroundColor('#FFF')
    .height(74)
    .width(316)
    .borderRadius(14)
    .shadow({
      radius: 13,
      color: '#F1F7FF',
      offsetX: -3,
      offsetY: 7
    })
    .margin({ bottom: 10 })

  }
}