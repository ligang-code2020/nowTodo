import { promptAction, router } from '@kit.ArkUI'

@Entry
@Component
struct PhoneVerifyPage {
  @State buttonFontColor: ResourceColor = '#9c9c9c'
  @State phone: string = '' // 手机号
  @State code: string = '' // 验证码
  @State count: number = 0 // 倒计时数值
  private intervalID: number = -1 // 倒计时定时器

  // 开始倒计时
  startCountDown() {
    // 初始化倒计时秒数
    this.count = 60
    // 关闭旧的定时器
    clearInterval(this.intervalID)
    // 开启定时器
    this.intervalID = setInterval(() => {
      this.count--
      if (this.count <= 0) {
        clearInterval(this.intervalID)
      }
    }, 1000)
  }

  // 页面销毁，停止倒计时，释放资源
  aboutToDisappear() {
    clearInterval(this.intervalID)
  }

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

        Stack({ alignContent: Alignment.End }) {
          TextInput({ placeholder: '请输入验证码' })
            .placeholderFont({ size: 18, weight: 600 })
            .border({ width: 0 })
            .borderRadius(0)
            .maxLength(6)
            .placeholderColor('#C6CEDD')
            .backgroundColor(Color.White)
            .padding({
              bottom: 10,
              top: 0,
              left: 0,
              right: 0
            })

          if (this.count > 0) {
            Text(this.count + '秒后重发')
              .fontSize(14)
              .fontColor('#C6CEDD')
              .fontWeight(600)
              .margin({ bottom: 5 })
          } else {
            Text('获取验证码')
              .fontSize(14)
              .fontWeight(600)
              .fontColor('#409eff')
              .enabled(this.phone.length > 0)
              .margin({ bottom: 5 })
              .onClick(() => {
                console.log("xxx", "kkaishi")
                // 用户提醒
                promptAction.showToast({ message: '短信发送到手机上，请注意查收' })
                // 界面更新倒计时
                this.startCountDown()
              })
          }

        }
        .margin({ top: 32 })
        .width('100%')
        .border({ width: { bottom: 1 }, color: '#E3E8F1' })


        Button('登录', { type: ButtonType.Normal })
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
            .onClick(() => {
              router.pushUrl({
                url: 'pages/ProtocolPage',
                params: {
                  title: '隐私协议',
                  protocolKey: 'privacyAgreement'
                }
              })
            })
          Span('《用户服务协议》').fontColor('#3274f6')
            .onClick(() => {
              router.pushUrl({
                url: 'pages/ProtocolPage',
                params: {
                  title: '用户服务协议',
                  protocolKey: 'userServiceAgreement'
                }
              })
            })
        }.fontSize(14).fontColor('#666').lineHeight(22)
      }
      .alignItems(VerticalAlign.Top)
      .margin({ bottom: 30 })

    }
    .height('100%')
    .width('100%')
  }
}