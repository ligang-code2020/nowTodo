@Component
export struct OnGoingCard {
  build() {
    Column() {
      Column() {
        Column() {
          Image($r('app.media.folder')).width(92).height(69).zIndex(8).margin({ top: 10, left: 14 })
          Image($r('app.media.arrow_right'))
            .width(12)
            .height(12)
            .position({ right: 18, top: 15 })
            .zIndex(10)
          Image($r('app.media.vector4'))
            .width(39)
            .height(50)
            .position({ right: 61, top: 0 })
          Image($r('app.media.vector5'))
            .width(39)
            .height(50)
            .position({ right: 22, top: 0 })


          Text('进行中')
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
      }
      .alignItems(HorizontalAlign.Start)
      .height(152)
      .borderRadius(14)
    }
    .height(152)
    .width('100%')
    .borderRadius(14)
    .margin({ top: 16 })
    .linearGradient({
      repeating: false,
      direction: GradientDirection.RightTop, // angle: 225
      colors: [['#81E89E', 0], ['#5981e89e', 1]]
    })
  }
}