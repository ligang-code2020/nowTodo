@Entry
@Component
struct LoginPage {
  build() {
    Column() {
      Text('Login')
        .fontSize(36)
        .fontWeight(700)
        .fontColor('#5B67CA')
        .margin({ top: 100 })
        .width('100%')
      Row() {
        Image($r('app.media.email')).width(24)
        TextInput({ placeholder: '请输入邮箱或者用户名' })
          .border({ width: 0 })
          .borderRadius(0)
          .placeholderColor('#C6CEDD')
          .backgroundColor(Color.White)
      }
      .margin({ top: 74 })
      .width('100%')
      .border({ width: { bottom: 1 }, color: '#E3E8F1' })

      Row() {
        Image($r('app.media.password')).width(24)
        TextInput({ placeholder: '请输入密码' })
          .border({ width: 0 })
          .borderRadius(0)
          .placeholderColor('#C6CEDD')
          .backgroundColor(Color.White)
          .passwordIcon({ onIconSrc: $r('app.media.show'), offIconSrc: $r('app.media.hide') })
          .type(InputType.Password)
      }
      .margin({ top: 32 })
      .width('100%')
      .border({ width: { bottom: 1 }, color: '#E3E8F1' })

      Row() {
        Text('忘记密码？').fontSize(12).fontColor('#5B67CA')
      }
      .width('100%')
      .justifyContent(FlexAlign.End)
      .margin({ top: 16 })

      Button('登录', { type: ButtonType.Normal })
        .backgroundColor('#5B67CA')
        .fontSize(16)
        .fontWeight(700)
        .borderRadius(14)
        .width(304)
        .height(52)
        .margin({ top: 55 })

      Row() {
        Row()
          .height(1)
          .backgroundColor('#E3E8F1')
        Text('其他登录方式').fontSize(12).fontColor('#C6CEDD')
        Row()
          .height(1)
          .backgroundColor('#E3E8F1')
      }
      .width('100%')
      .margin({ top: 64 })


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
      .margin({ top: 30 })

    }
    .width('100%')
    .padding({ left: 35, right: 35 })
    .justifyContent(FlexAlign.Center)
  }
}