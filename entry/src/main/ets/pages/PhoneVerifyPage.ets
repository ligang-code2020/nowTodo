import { promptAction } from '@kit.ArkUI'
import { LoginApi } from '../api/login'

class ParamWithOp {
  constructor(protocolKey: string, title: string) {
    this.protocolKey = protocolKey
    this.title = title
  }

  protocolKey: string
  title: string
}


@Entry
@Component
struct PhoneVerifyPage {
  pathStack: NavPathStack = AppStorage.get("PathStack") as NavPathStack
  private generateCode: string = '' // 随机生成验证码
  private intervalID: number = -1 // 倒计时定时器
  @State buttonFontColor: ResourceColor = '#9c9c9c'
  @State phone: string = '' // 手机号
  @State code: string = '' // 验证码
  @State count: number = 0 // 倒计时数值
  @State isShow: boolean = false // 协议同意弹窗
  @State isChecked: boolean = false // 是否勾选s
  @State sheetHeight: number = 200

  aboutToAppear(): void {
    console.log("xxxx1pathStack", this.pathStack)
  }

  @Builder
  ProtocolSheet() {
    Column() {
      Text('请阅读并同意以下条款')
        .fontSize(16)
        .fontWeight(600)
        .height(50)
        .width('100%')
        .textAlign(TextAlign.Center)
        .border({
          color: '#E8E9F3',
          width: {
            bottom: 1
          }
        })
      Column() {
        Text() {
          Span('《隐私协议》').fontColor('#3274f6')
            .onClick(() => {
              this.isShow = false

              this.pathStack.pushPath({ name: "ProtocolPage", param: "PageOne Param" })
              return
              this.pathStack.pushPathByName(
                'ProtocolPage',
                new ParamWithOp('privacyAgreement', '隐私协议'),
                (popInfo) => {
                  console.log("xxpopInfo", JSON.stringify(popInfo))
                }
              )


            })
          Span('《用户服务协议》').fontColor('#3274f6')
            .onClick(() => {
              this.isShow = false
              this.pathStack.pushPath({
                name: 'ProtocolPage',
                param: new ParamWithOp('userServiceAgreement', '用户服务协议')
              })
            })
        }.fontSize(14).fontColor('#666').lineHeight(22).margin({ top: 20, bottom: 50 })

        Blank()

        Button('同意并继续', { type: ButtonType.Normal })
          .width('70%')
          .borderRadius(50)
          .height(45)
          .fontSize(16)
          .fontWeight(600)
          .fontColor(Color.White)
          .backgroundColor('#f82314')
          .onClick(() => {
            this.isChecked = true
            this.isShow = false
          })
          .margin({ bottom: 10 })
      }
    }
    .gesture(PanGesture({ direction: PanDirection.Up | PanDirection.Down }))
    .height('100%')
  }

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

  validatePhone(phone: string): boolean {
    const reg =
      new RegExp('^(?:\\+?86)?1(?:3\\d{3}|5[^4\\D]\\d{2}|8\\d{3}|7(?:[235-8]\\d{2}|4(?:0\\d|1[0-2]|9\\d))|9[0-35-9]\\d{2}|66\\d{2})\\d{6}$')
    return reg.test(phone)
  }

  build() {
    NavDestination() {
      Column() {
        Row() {
          Image($r('app.media.cancel_icon')).width(24).aspectRatio(1)
        }
        .width('100%')
        .padding(20)
        .onClick(() => {
          this.pathStack.pop()
        })

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
            .maxLength(11)
            .inputFilter('[0-9 ]', (e) => {
              console.log(JSON.stringify(e))
            })
            .onChange((value: string) => {
            })
            .width('100%')

          Stack({ alignContent: Alignment.End }) {
            TextInput({ placeholder: '请输入验证码', text: $$this.code })
              .placeholderFont({ size: 18, weight: 600 })
              .border({ width: 0 })
              .borderRadius(0)
              .maxLength(6)
              .fontSize(18)
              .fontWeight(600)
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
                  if (!this.validatePhone(this.phone)) {
                    promptAction.showToast({ message: '手机号格式错误' })
                  } else {
                    // 用户提醒
                    promptAction.showToast({ message: '短信发送到手机上，请注意查收' })
                    // 界面更新倒计时
                    this.startCountDown()
                    this.generateCode = (Math.floor(Math.random() * (999999 - 100000 + 1)) + 100000).toString();
                    console.log("this.generateCode", this.generateCode)
                    LoginApi.getPhoneCode({
                      phone: this.phone,
                      code: this.generateCode
                    }).then(res => {
                      console.log("res", JSON.stringify(res))
                    })
                  }
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
            .fontColor(this.phone !== '' && this.code !== '' ? Color.White : this.buttonFontColor)
            .linearGradient({
              repeating: false,
              direction: GradientDirection.LeftBottom,
              colors: this.phone !== '' && this.code !== '' ? [['#686DE0', 0], ['#4834D4', 1]] :
                [['#e5e5e5', 0], ['#e5e5e5', 1]]
            })
            .bindSheet($$this.isShow, this.ProtocolSheet(), {
              height: this.sheetHeight,
              backgroundColor: Color.White,
              blurStyle: BlurStyle.Thick,
              showClose: false
            })
            .onClick(() => {
              if (this.phone === '' || this.code === '') {
                return
              } else {
                // 如果登录前没有勾选，则弹出
                if (!this.isChecked) {
                  this.isShow = true
                  return
                } else {
                  if (this.code !== this.generateCode) {
                    promptAction.showToast({ message: '手机验证码错误', bottom: '200vp' })
                  } else {
                    // router.replaceUrl({
                    //   url: 'pages/TasksPage'
                    // })
                  }
                }


              }
            })


        }
        .padding(30)

        Blank()

        Row() {
          Checkbox()
            .select(this.isChecked)
            .width(14)
            .margin({ top: 5 })
            .onChange((value: boolean) => {
              this.isChecked = value
            })

          Text() {
            Span('已阅读并同意')
            Span('《隐私协议》').fontColor('#3274f6')
              .onClick(() => {
                this.pathStack.pushPath({
                  name: 'ProtocolPage',
                  param: new ParamWithOp('privacyAgreement', '隐私协议')
                })
              })
            Span('《用户服务协议》').fontColor('#3274f6')
              .onClick(() => {
                this.pathStack.pushPath({
                  name: 'ProtocolPage',
                  param: new ParamWithOp('userServiceAgreement', '用户服务协议')
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
    .hideTitleBar(true)
  }
}

@Builder
export function PhoneVerifyBuilder(): void {
  PhoneVerifyPage();
}