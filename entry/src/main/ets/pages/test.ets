@Component
@Entry
struct Test {
  build() {
    // Column() {
    //
    //   Image($r('app.media.blur1')).width('100%')
    //   // .position({ right: -1, bottom: -10 })
    //
    //
    // }
    // .width(140)
    // .height(73)
    // .borderRadius(14)
    // .border({ width: 1 })
    //
    // .backgroundColor('#E77D7D')
    // .align(Alignment.Top)
    // .margin({ left: 100, top: 100 })




    Stack({ alignContent: Alignment.TopStart }) {
      Text('Stack').width('90%').height('100%').backgroundColor('#e1dede').align(Alignment.BottomEnd)
      Image($r('app.media.blur1')).width('70%')
      Text('Item 1').width('65%').height('90%').backgroundColor(0xd2cab3).align(Alignment.BottomEnd)
      // Text('Item 2').width('70%').height('80%').backgroundColor(0xc1cbac).align(Alignment.BottomEnd)

    }.width('100%').height(150).margin({ top: 5 })

  }
}