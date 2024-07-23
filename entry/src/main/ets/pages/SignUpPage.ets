import { CustomInput } from '../component/CustomInput'
import { router } from '@kit.ArkUI'

@Entry
@Component
struct SignUpPage {
  build() {
    Column() {
      Text('注册')
        .fontSize(36)
        .fontWeight(700)
        .fontColor('#5B67CA')
        .margin({ top: 100 })
        .width('100%')

      Column() {
        CustomInput({
          placeholder: '请输入用户名',
          preIcon: $r('app.media.username'),
          inputType: InputType.Normal
        })
        // CustomInput({
        //   placeholder: '请输入邮箱',
        //   preIcon: $r('app.media.email'),
        //   inputType: InputType.Normal
        // })
        CustomInput({
          placeholder: '请输入密码',
          preIcon: $r('app.media.password'),
          inputType: InputType.Password,
          onIconSrc: $r('app.media.show'),
          offIconSrc: $r('app.media.hide'),
        })
      }
      .margin({ top: 65 })

      Button('创建', { type: ButtonType.Normal })
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
          router.pushUrl({
            url: 'pages/LoginPage'
          })
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
}