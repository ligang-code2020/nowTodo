import { router } from '@kit.ArkUI'
import { CustomInput } from '../component/CustomInput'

@Entry
@Component
struct LoginPage {
  build() {
    Column() {
      Text('登录')
        .fontSize(36)
        .fontWeight(700)
        .fontColor('#5B67CA')
        .margin({ top: 100 })
        .width('100%')

      CustomInput({
        placeholder: '请输入邮箱或者用户名',
        preIcon: $r('app.media.email'),
        inputType: InputType.Normal
      })
      CustomInput({
        placeholder: '请输入密码',
        preIcon: $r('app.media.password'),
        onIconSrc: $r('app.media.show'),
        offIconSrc: $r('app.media.hide'),
        inputType: InputType.Password
      })

      Row() {
        Text('忘记密码？').fontSize(12).fontColor('#5B67CA')
      }
      .width('100%')
      .justifyContent(FlexAlign.End)
      .margin({ top: 16 })

      Button('确定', { type: ButtonType.Normal })
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
        Text('其他登录方式').fontSize(12).fontColor('#C6CEDD').margin({ left: 15, right: 15 })
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
      .margin({ top: 30 })

      Text() {
        Span('没有账户？')
        Span('注册').fontWeight(700).onClick(() => {
          console.log('222')
          router.pushUrl({
            url: 'pages/InitPage'
          })
        })
      }
      .fontColor('#2C406E')
      .fontSize(14)
      .margin({ top: 124 })

    }
    .width('100%')
    .padding({ left: 35, right: 35 })
    .justifyContent(FlexAlign.Center)
  }
}