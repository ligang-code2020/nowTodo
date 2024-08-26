import { protocol } from '../utils/protocol'
import { LengthMetrics, router } from '@kit.ArkUI';


@Entry
@Component
struct ProtocolPage {
  @State message: string = 'Hello World';
  @State title: string = (router.getParams() as object)['title']
  @State protocolKey: string = (router.getParams() as object)['protocolKey']

  aboutToAppear(): void {
  }

  build() {
    Column() {
      Row() {
        Image($r('app.media.left_return'))
          .width(30)
          .aspectRatio(1)
          .position({
            top: 9,
            left: 10
          })
          .onClick(() => {
            router.back()
          })
        Text(this.title)
          .fontSize(17)
          .fontWeight(600)
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .height(50)
      .border({
        color: '#E8E9F3',
        width: {
          bottom: 1
        }
      })

      Column(){
        Scroll() {
          Column() {
            Text(this.title)
              .fontSize(18)
              .fontWeight(700)
              .margin({ top: 30, bottom: 10 })

            TextArea({
              text: this.protocolKey === 'privacyAgreement' ? protocol.privacyAgreement : protocol.userServiceAgreement
            })
              .width('90%')
              .selectedBackgroundColor(Color.White)
              .backgroundColor(Color.White)
              .enabled(false)
              .enableKeyboardOnFocus(false)
              .lineSpacing(LengthMetrics.vp(15))

            Blank().height(100)
          }
        }
        .edgeEffect(EdgeEffect.None)
        .scrollBar(BarState.Off)
      }

    }
    .height('100%')
    .width('100%')
  }
}