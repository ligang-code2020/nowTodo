import { router } from '@kit.ArkUI'

@Component
@Entry
export default struct InitPage {
  build() {
    Column() {
      Image($r('app.media.cover')).width(291).aspectRatio(1).margin({ top: 128 })
      Blank()
      Row() {
        Text('NowToDo')
          .fontSize(32)
          .fontWeight(FontWeight.Bold)
          .fontColor('#5B67CA')
          .letterSpacing(1)
        Circle({ width: 6, height: 6 }).fill('#FD7694').margin({ left: 3 })
      }
      Text('不积跬步，无以至千里；不积小流，无以成江海;').fontSize(14).fontColor('#2C406E').margin({ top: 16, bottom: 10 })

      // 填充组件，填充空白区域，这里不能使用margin，不然无法适应窗口大小
      Blank()

      Button('登录', { type: ButtonType.Normal })
        .borderRadius(14)
        .width(304)
        .height(52)
        .backgroundColor('#5B67CA')
        .fontSize(16)
        .fontWeight(500)
        .fontColor(Color.White)
        .onClick(() => {
          router.pushUrl({
            url: 'pages/LoginPage'
          })
        })
      Text('注册')
        .margin({ top: 24, bottom: 55 })
        .fontColor('#5B67CA')
        .fontSize(16)
        .fontWeight(500)
        .onClick(() => {
          router.pushUrl({
            url: 'pages/SignUpPage'
          })
        })

    }
    .width('100%')
    .height('100%')
  }
}