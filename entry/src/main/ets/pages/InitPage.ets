import { router } from '@kit.ArkUI'

@Component
@Entry
export default struct InitPage {
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

      Text('不积跬步，无以至千里；不积小流，无以成江海;').fontSize(14).fontColor('#2C406E').margin({ top: 16 })

      Button('登录', { type: ButtonType.Normal })
        .borderRadius(14)
        .margin({ top: 65 })
        .width(304)
        .height(52)
        .backgroundColor('#5B67CA')
        .fontSize(16)
        .fontWeight(500)
        .fontColor(Color.White)
      Text('注册')
        .margin({ top: 24 })
        .fontColor('#5B67CA')
        .fontSize(16)
        .fontWeight(500)
        .onClick(() => {
          router.pushUrl({
            url: 'pages/LoginPage'
          })
        })

    }
    .width('100%')
  }
}