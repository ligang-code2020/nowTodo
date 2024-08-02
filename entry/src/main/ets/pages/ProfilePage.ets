import { CommonContainer } from '../style/common'
import { FloatTabs } from '../component/FloatTabs'

@Entry
@Component
struct ProfilePage {
  @State commonContainerStyle: CommonContainer = new CommonContainer()

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        Column() {
          Image($r('app.media.notice')).width(24).aspectRatio(1)
        }
        .width(48)
        .height(48)
        .position({
          top: 52,
          right: 1
        })
        .justifyContent(FlexAlign.Center)
        .borderRadius(14)
        .shadow({
          radius: 13,
          offsetX: -3,
          offsetY: 7,
          color: '#F1F7FF'
        })

        // 头像
        Column() {
          Image($r('app.media.userIcon'))
        }
        .width(86)
        .height(86)
        .shadow({
          offsetX: -3,
          offsetY: 7,
          radius: 13,
          color: '#F1F7FF'
        })
        .borderRadius(50)
        .margin({ top: 93 })

        Text('橘猫不加糖 🐱')
          .height(32)
          .fontColor('#10275A')
          .fontSize(20)
          .fontWeight(700)
          .margin({ top: 20 })
        Text('askjhx@163.com')
          .height(17)
          .fontColor('#10275A')
          .fontSize(14)
          .fontWeight(500)
          .margin({ top: 5 })

      }
      .height('100%')
      .attributeModifier(this.commonContainerStyle)


      // 悬浮 tabs 栏
      FloatTabs().align(Alignment.Bottom)
    }
    .height('100%')
    .width('100%')
  }
}