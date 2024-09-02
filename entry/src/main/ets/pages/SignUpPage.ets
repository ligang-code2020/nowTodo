import { CustomInput } from '../component/CustomInput'
import { promptAction } from '@kit.ArkUI'
import { LoginApi } from '../api/login'


@Component
struct SignUpPage {
  pathStack: NavPathStack = AppStorage.get("PathStack") as NavPathStack
  @State username: string = ''
  @State password: string = ''
  @State rePassword: string = ''
  @State passwordError: boolean = false
  @State passwordErrorTxt: string = ''
  @State usernameExist: boolean = false

  aboutToAppear(): void {
    console.log("xxx1注册参数", JSON.stringify(this.pathStack.getParamByName('LoginPage')))

    console.log('xx获取index指定的NavDestination页面的参数信息', JSON.stringify(this.pathStack.getParamByIndex(1)))
    console.log('xx获取全部名为name的NavDestination页面的参数信息',
      JSON.stringify(this.pathStack.getParamByName('LoginPage')))
    console.log('xx获取全部名为name的NavDestination页面的位置索引', this.pathStack.getIndexByName('LoginPage'))
  }

  validateUsername(username: string): boolean {
    const reg =
      new RegExp('^[\u4e00-\u9fa5a-zA-Z0-9]{6,12}$')
    return reg.test(username)
  }

  validatePassword(password: string): boolean {
    const reg =
      new RegExp('^.{8,}$') // 至少一个字母，一个数字，长度大于8
    return reg.test(password)
  }

  async validateUsernameExist(username: string): Promise<boolean> {
    let user = await LoginApi.findUser({ username })
    if (user) {
      return true
    } else {
      return false
    }
  }

  build() {
    NavDestination() {
      Column() {
        Text('注册')
          .fontSize(36)
          .fontWeight(700)
          .fontColor('#5B67CA')
          .margin({ top: 100 })
          .width('100%')

        Column() {
          CustomInput({
            text: this.username,
            placeholder: '请输入用户名 (6-12个字符)',
            preIcon: $r('app.media.username'),
            inputType: InputType.Normal
          })
          if (this.usernameExist) {
            Text('用户名已经存在')
              .width('100%')
              .fontSize(14)
              .fontColor(Color.Red)
              .margin({ top: 10 })
              .textAlign(TextAlign.End)
              .height(16)
          } else {
            Row()
              .height(16)
              .width('100%')
              .margin({ top: 10 })
              .backgroundColor(Color.White)

          }


          CustomInput({
            text: this.password,
            placeholder: '密码（至少8个字符）',
            preIcon: $r('app.media.password'),
            inputType: InputType.Password,
            onIconSrc: $r('app.media.show'),
            offIconSrc: $r('app.media.hide'),
            marginValue: 6
          })
          CustomInput({
            text: this.rePassword,
            placeholder: '确认密码',
            preIcon: $r('app.media.password'),
            inputType: InputType.Password,
            onIconSrc: $r('app.media.show'),
            offIconSrc: $r('app.media.hide'),
          })
          if (this.passwordError) {
            Text('两次输入密码不一致！')
              .width('100%')
              .fontSize(14)
              .fontColor(Color.Red)
              .margin({ top: 10 })
              .textAlign(TextAlign.End)
              .height(16)
          } else {
            Row()
              .height(16)
              .width('100%')
              .margin({ top: 10 })
              .backgroundColor(Color.White)

          }

        }
        .margin({ top: 33 })

        Button('创建', { type: ButtonType.Normal })
          .backgroundColor('#5B67CA')
          .fontSize(16)
          .fontWeight(700)
          .borderRadius(14)
          .width(304)
          .height(52)
          .margin({ top: 55 })
          .onClick(async () => {
            this.usernameExist = await this.validateUsernameExist(this.username)
            if (this.usernameExist) {
              return
            }

            console.log("xxx", this.password, this.rePassword)
            if (!this.validateUsername(this.username)) {
              promptAction.showToast({ message: '用户名格式错误' })
              return
            }

            if (!this.validatePassword(this.password)) {
              promptAction.showToast({ message: '设置密码不符合格式' })
              return
            }

            if (this.password !== this.rePassword) {
              this.passwordError = true
            } else {
              this.passwordError = false
              // 跳转手机验证页
              this.pathStack.pushPath({
                name: 'PhoneVerifyPage'
              })
            }


          })

        Row() {
          Row()
            .height(1)
            .backgroundColor('#E3E8F1')
            .layoutWeight(1)
          Text('其他方式注册').fontSize(12).fontColor('#C6CEDD').margin({ left: 15, right: 15 })
          Row()
            .height(1)
            .backgroundColor('#E3E8F1')
            .layoutWeight(1)
        }
        .width('100%')
        .margin({ top: 64 })
        .justifyContent(FlexAlign.SpaceAround)

        Row() {
          Row() {
            Image($r('app.media.wechat')).width(24)
          }
          .width(42)
          .aspectRatio(1)
          .border({ width: 0.78 })
          .borderRadius(50)
          .borderColor('#E3E8F1')
          .justifyContent(FlexAlign.Center)

          Row() {
            Image($r('app.media.phone')).width(24)
          }
          .width(42)
          .aspectRatio(1)
          .border({ width: 0.78 })
          .borderRadius(50)
          .borderColor('#E3E8F1')
          .justifyContent(FlexAlign.Center)
        }
        .width(100)
        .justifyContent(FlexAlign.SpaceBetween)
        .margin({ top: 30, bottom: 10 })

        Blank()

        Text() {
          Span('已有账号？')
          Span('登录').fontWeight(700).onClick(() => {
            this.pathStack.pushPath({ name: "LoginPage" })
          })
        }
        .fontColor('#2C406E')
        .fontSize(14)
        .margin({ bottom: 44 })
      }
      .width('100%')
      .height('100%')
      .padding({ left: 35, right: 35 })
      .justifyContent(FlexAlign.Center)
    }
    .hideTitleBar(true)
  }
}


@Builder
export function SignUpBuilder(): void {
  SignUpPage();
}

