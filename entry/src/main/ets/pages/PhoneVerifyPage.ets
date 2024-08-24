@Entry
@Component
struct PhoneVerifyPage {
  @State buttonFontColor: ResourceColor = '#9c9c9c'
  @State phone: string = ''
  @State code: string = ''

  build() {
    Column() {
      Row() {
        Image($r('app.media.cancel_icon')).width(24).aspectRatio(1)
      }
      .width('100%')
      .padding(20)

      Column() {
        Text('验证码登录')
          .fontSize(28)
          .fontWeight(600)
          .width('100%')
          .margin({ top: 30, bottom: 30 })

        TextInput({ placeholder: '请输入手机号码', text: $$this.phone })
          .placeholderFont({ size: 18, weight: 600 })
          .padding({
            bottom: 10,
            top: 0,
            left: 0,
            right: 0
          })
          .fontSize(18)
          .fontWeight(600)
          .border({
            color: '#E8E9F3',
            width: {
              bottom: 1
            }
          })
          .borderRadius(0)
          .placeholderColor('#C6CEDD')
          .backgroundColor(Color.White)
          .type(InputType.Number)
          .maxLength(13)
          .inputFilter('[0-9 ]', (e) => {
            console.log(JSON.stringify(e))
          })
          .onChange((value: string) => {
          })
          .width('100%')

        Row() {
          TextInput({ placeholder: '请输入验证码' })
            .placeholderFont({ size: 18, weight: 600 })
            .border({ width: 0 })
            .borderRadius(0)
            .placeholderColor('#C6CEDD')
            .backgroundColor(Color.White)
        }
        .margin({ top: 32 })
        .width('100%')
        .border({ width: { bottom: 1 }, color: '#E3E8F1' })


        Button('获取验证码', { type: ButtonType.Normal })
          .margin({ top: 50 })
          .width('100%')
          .borderRadius(50)
          .height(50)
          .fontSize(18)
          .fontWeight(600)
          .fontColor(this.phone !== '' ? Color.White : this.buttonFontColor)
          .linearGradient({
            repeating: false,
            direction: GradientDirection.LeftBottom,
            colors: this.phone !== '' ? [['#686DE0', 0], ['#4834D4', 1]] : [['#e5e5e5', 0], ['#e5e5e5', 1]]
          })
          .onClick(() => {
          })


      }
      .padding(30)

      Blank()

      Row() {
        Checkbox().width(14).margin({ top: 5 })
        Text() {
          Span('已阅读并同意')
          Span('《隐私协议》').fontColor('#3274f6')
          Span('《用户服务协议》').fontColor('#3274f6')
        }.fontSize(14).fontColor('#666').lineHeight(22)
      }
      .alignItems(VerticalAlign.Top)
      .margin({ bottom: 30 })

    }
    .height('100%')
    .width('100%')
  }
}