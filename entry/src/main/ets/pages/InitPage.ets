@Component
@Entry
struct InitPage {
  build() {
    Column() {
      Image($r('app.media.cover')).width(291).margin({ top: 128 })
      Row() {
        Text('NowToDo')
          .fontSize(32)
          .fontWeight(FontWeight.Bold)
          .fontColor('#5B67CA')
          .margin({ top: 75 })
          .letterSpacing(1)
        Circle({ width: 6, height: 6 })
      }

    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}