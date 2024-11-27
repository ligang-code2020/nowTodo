import { protocol } from '../utils/protocol'
import { LengthMetrics } from '@kit.ArkUI';
import { HMRouter, HMRouterMgr } from '@hadss/hmrouter';

interface Param {
  protocolKey: string
  title: string
}

@HMRouter({ pageUrl: 'ProtocolPage' })
@Component
export struct ProtocolPage {
  @State title: string = ''
  @State protocolKey: string = ''
  @State param: Param = HMRouterMgr.getCurrentParam() as Param

  aboutToAppear(): void {
    this.title = this.param.title
    this.protocolKey = this.param.protocolKey
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
            HMRouterMgr.pop()
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

      Column() {
        Scroll() {
          Column() {
            Text(this.title)
              .fontSize(18)
              .fontWeight(700)
              .margin({ top: 30, bottom: 10 })

            TextArea({
              text: this.protocolKey === 'privacyAgreement' ? protocol.privacyAgreement :
              protocol.userServiceAgreement
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

