@Component
@Preview
export struct TaskCard {
  build() {
    Column() {
      Line()
        .startPoint([0, 35])
        .strokeWidth(2)
        .strokeLineCap(LineCapStyle.Round)
        .stroke(Color.Red)
        .position({ top: 22, left: 15 })
      Image($r('app.media.more'))
        .width(14)
        .aspectRatio(1)
        .position({ top: 22, right: 15 })

      Column() {
        Text('xxxx').fontColor('#2C406E').fontSize(16).fontWeight(600).height(26)
        Text('08:00-09:00').fontSize(14).fontColor('#9AA8C7').height(23)
      }
      .alignItems(HorizontalAlign.Start)
      .margin({ top: 15, left: 25 })

      // tag
      Row() {
        ForEach(['必做', '重要'], (tag: string, index) => {
          Column() {
            Text(tag)
              .height(20)
              .fontSize(10)
              .fontWeight(600)
              .fontColor('#8F99EB')
          }
          .backgroundColor('#338f99eb')
          .borderRadius(3)
          .margin({ right: 6 })
          .padding({
            left: 7,
            right: 7,
            top: 2,
            bottom: 2
          })
        })
      }
      .margin({ top: 15 })
      .padding({ left: 25 })
      .width('100%')
    }
    .padding({ bottom: 15 })
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .borderRadius(15)
    .backgroundColor('#F9FAFD')
  }
}