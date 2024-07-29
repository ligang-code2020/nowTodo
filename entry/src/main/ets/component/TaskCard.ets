@Component
@Preview
export struct TaskCard {
  build() {
    Column() {
      Line()
        .startPoint([0, 38])
        .strokeWidth(2)
        .strokeLineCap(LineCapStyle.Round)
        .stroke(Color.Red)
        .position({ top: 22, left: 15 })
      Row() {
        Column() {
          Text('吃饭睡觉打游戏')
            .fontColor('#2C406E')
            .fontSize(16)
            .fontWeight(600)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .maxLines(1)
            .width('70%')
          Text('08:00-09:00').fontSize(14).fontColor('#9AA8C7').height(23).margin({ top: 5 })
        }
        .alignItems(HorizontalAlign.Start)
        .justifyContent(FlexAlign.SpaceBetween)
        .margin({ left: 25, right: 24 })

        Image($r('app.media.more'))
          .width(14)
          .aspectRatio(1)
          .margin({ right: 10 })
      }
      .margin({ top: 21 })
      .alignItems(VerticalAlign.Top)


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
    }
    .padding({ bottom: 15 })
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Start)
    .borderRadius(15)
    .backgroundColor('#F9FAFD')
  }
}