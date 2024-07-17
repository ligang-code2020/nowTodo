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
          .letterSpacing(1)
        Circle({ width: 6, height: 6 }).fill('#FD7694').margin({ left: 3 })
      }.margin({ top: 75 })

    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}