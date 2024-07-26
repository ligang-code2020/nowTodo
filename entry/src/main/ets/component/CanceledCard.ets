@Component
export struct CancelCard {
  build() {
    Column() {
      Column() {
        Column() {
          Image($r('app.media.canceled')).width(28).aspectRatio(1).zIndex(8).margin({ top: 15, left: 17 })
          Image($r('app.media.arrow_right1'))
            .width(12)
            .height(12)
            .position({ right: 16, top: 15 })
            .zIndex(10)


            Image($r('app.media.vector6'))
              .width(39)
              .height(50)
              .position({ right: 61, top: 0 })
            Image($r('app.media.vector7'))
              .width(39)
              .height(50)
              .position({ right: 22, top: 0 })


          Text('已取消')
            .fontSize(16)
            .fontColor('#FFFFFF')
            .fontWeight(600)
            .margin({ left: 15, bottom: 8, top: 8 })
            .height(21)

          Text('15 个任务')
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
    }
    .alignItems(HorizontalAlign.Start)
    .height(116)
    .width('100%')
    .borderRadius(14)
    .margin({ top: 16 })
    .linearGradient({
      repeating: false,
      direction: GradientDirection.RightTop, // angle: 225
      colors: [['#E77D7D', 0], ['#b5e77d7d', 1]]
    })
  }
}