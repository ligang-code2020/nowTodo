@Component
export struct CompletedCard {
  build() {
    Column() {
      Column() {
        Image($r('app.media.computer')).width(92).height(69).zIndex(8).margin({ top: 10, left: 14 })
        Row() {
          Image($r('app.media.vector8'))
            .width(39)
            .height(50)
            .position({ left: 55, top: 0 })
          Image($r('app.media.vector9'))
            .width(39)
            .height(50)
            .position({ left: 94, top: 0 })
          Image($r('app.media.arrow_right'))
            .width(12)
            .height(12)
            .position({ left: 128, top: 15 })
            .zIndex(10)
        }

        Text('已完成')
          .fontSize(16)
          .fontColor('#12175E')
          .fontWeight(600)
          .margin({ left: 15, bottom: 8, top: 8 })
          .height(21)

        Text('86 个任务')
          .fontSize(14)
          .fontColor('#12175E')
          .margin({ left: 15 })
          .height(21)
      }
      .alignItems(HorizontalAlign.Start)
      .borderRadius(14)
      .width('100%')
      .height(116)


      // 阴影
      Column() {
        Image($r('app.media.blur')).width('100%').height('100%')
      }
      .borderRadius(14)
      .width(140)
      .height(93)
      .position({ right: -15, bottom: -15 })
      .zIndex(-1)

    }
    .alignItems(HorizontalAlign.Start)
    .height(152)
    .borderRadius(14)
    .linearGradient({
      repeating: false,
      direction: GradientDirection.RightTop, // angle: 225
      colors: [['#7DC8E7', 0], ['#b07dc8e7', 1]]
    })
  }
}