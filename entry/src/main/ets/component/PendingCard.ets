@Component
export struct PendingCard {
  build() {
    Column() {
      Column() {
        Image($r('app.media.alarm')).width(28).aspectRatio(1).zIndex(8).margin({ top: 15, left: 15 })
        Row() {
          Image($r('app.media.vector2'))
            .width(39)
            .height(50)
            .position({ left: 55, top: 0 })
          Image($r('app.media.vector3'))
            .width(39)
            .height(50)
            .position({ left: 94, top: 0 })
          Image($r('app.media.arrow_right1'))
            .width(12)
            .height(12)
            .position({ left: 128, top: 15 })
            .zIndex(10)
        }

        Text('暂停中')
          .fontSize(16)
          .fontColor('#FFFFFF')
          .fontWeight(600)
          .margin({ left: 15, bottom: 8, top: 8 })
          .height(21)

        Text('10 个任务')
          .fontSize(14)
          .fontColor('#FFFFFF')
          .margin({ left: 15 })
          .height(21)
      }
      .alignItems(HorizontalAlign.Start)
      .borderRadius(14)
      .width('100%')
      .height(116)



    }
    .height(116)
    .width('100%')
    .borderRadius(14)
    .linearGradient({
      repeating: false,
      direction: GradientDirection.RightTop, // angle: 225
      colors: [['#7D88E7', 0], ['#bd7d88e7', 1]]
    })



  }
}