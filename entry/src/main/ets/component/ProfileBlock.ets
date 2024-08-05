@Component
@Preview
export struct ProfileBlock {
  backgroundColorValue: ResourceColor = '#40858fe9'
  iconBackgroundColor: ResourceColor = '#858FE9'
  title: string = ''
  taskCount?: number = 0
  icon: ResourceStr = $r('app.media.personal')

  build() {
    Column() {
      Column() {
        Image(this.icon).width(24).aspectRatio(1)
      }
      .width(48)
      .aspectRatio(1)
      .backgroundColor(this.iconBackgroundColor)
      .borderRadius(14)
      .justifyContent(FlexAlign.Center)
      .margin({ top: 21, right: 45, left: 45 })

      Text(this.title)
        .fontColor('#10275A')
        .fontSize(14)
        .fontWeight(600)
        .height(23)
        .margin({ top: 10 })

      if (this.title !== '创建面板') {
        Text(`${this.taskCount}个任务`)
          .fontColor('#393939')
          .fontSize(12)
          .fontWeight(600)
          .height(19)
          .margin({ top: 1, bottom: 16 })
      } else {
        Text('').height(19).margin({ top: 1, bottom: 16 })
      }


    }
    .backgroundColor(this.backgroundColorValue)
    .borderRadius(14)
  }
}