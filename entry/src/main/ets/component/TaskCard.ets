enum PriorityColor {
  '#8F99EB' = 1,
  '#E88B8C' = 2
}


@Component
export struct TaskCard {
  @Prop taskName: string
  @Prop time: string
  @Prop tag: string[]
  @Prop priority: number
  maxWidth: number | string = '70%' // 文本最大宽度，超出省略
  cardWidth: number | string = ''

  build() {
    Column() {
      Line()
        .startPoint([0, 38])
        .strokeWidth(2)
        .strokeLineCap(LineCapStyle.Round)
        .stroke(PriorityColor[this.priority])
        .position({ top: 22, left: 15 })
      Row() {
        Column() {
          Text(this.taskName)
            .fontColor('#2C406E')
            .fontSize(16)
            .fontWeight(600)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .maxLines(1)
            .constraintSize({
              maxWidth: this.maxWidth
            })
          Text(this.time).fontSize(14).fontColor('#9AA8C7').height(23).margin({ top: 5 })
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
      .justifyContent(FlexAlign.SpaceBetween)
      .width(this.cardWidth)


      // tag
      Row() {
        ForEach(this.tag, (tag: string, index) => {
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
    .width(this.cardWidth)
  }
}