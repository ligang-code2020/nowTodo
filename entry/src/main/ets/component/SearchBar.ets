@Component
@Preview
export struct SearchBar {
  build() {
    Row() {
      // Image($r('app.media.search')).width(20).aspectRatio(1).margin({ left: 20, right: 15})
      Column() {
        Image($r('app.media.search')).width(20).aspectRatio(1)
      }
      .justifyContent(FlexAlign.Center)
      .margin({ left: 20, right: 15 })
      .height('100%')

      TextInput({ placeholder: '搜索任务' })
        .placeholderColor('#CED0E7')
        .backgroundColor('#F6F6F6')
        .layoutWeight(1)
        .height(50)
        .padding({ left: 0 })

      Column() {
        Image($r('app.media.cancel')).width(16).aspectRatio(1)
      }
      .margin({ right: 17 })
      .justifyContent(FlexAlign.Center)
      .height('100%')
    }
    .alignItems(VerticalAlign.Center)
    .height(50)
    .width('100%')
    .borderRadius(15)
    .backgroundColor('#F6F6F6')
  }
}