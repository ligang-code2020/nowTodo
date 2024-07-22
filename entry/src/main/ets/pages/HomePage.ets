@Entry
@Component
struct HomePage {
  @State message: string = 'Hello World';

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        Row() {
          Column() {
            Text('你好，橘猫')
              .fontSize(28)
              .fontColor('#12175E')
              .fontWeight(700)
              .lineHeight(31)
            Text('千里之行，始于足下。').fontSize(14).fontColor('#575757').margin({ top: 8 })

            Text('我的任务')
              .fontSize(24)
              .fontColor('#12175E')
              .fontWeight(700)
              .width('100%')
              .height(32)
              .margin({ top: 32 })

          }
          .alignItems(HorizontalAlign.Start)
          .layoutWeight(1)


          Column() {
            Image($r('app.media.userIcon')).width(36)
          }
          .width(39)
          .aspectRatio(1)
          .borderRadius(14)
          .shadow({
            radius: 13,
            color: '#F1F7FF',
            offsetX: -3,
            offsetY: 7
          })

        }
        .width('100%')
        .margin({ top: 45 })
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(VerticalAlign.Top)


        // 任务概览卡片
        Row() {
          Column() {
            Column() {
              // Image($r('app.media.computer')).width(92).height(69)
              Row() {
                Image($r('app.media.jiantou'))
                  .width(39)
                  .height(50)
                  .position({ left: 55, top: 0 })
                Image($r('app.media.jiantou1'))
                  .width(39)
                  .height(50)
                  .position({ left: 94, top: 0 })
                Image($r('app.media.arrow_right'))
                  .width(12)
                  .height(12)
                  .position({ left: 128, top: 15 })
                  .zIndex(10)
              }
            }
            .padding({ left: 14 })
            .height(152)
            .width(155)
            .borderRadius(14)
            .linearGradient({
              repeating: false,
              direction: GradientDirection.LeftBottom,
              // angle: 225,
              colors: [['#7DC8E7', 0.21], ['#7DC8E7', 0]]
            })


            Column() {

            }
            .height(116)
            .width(155)
            .border({ width: 1 })
            .borderRadius(14)
            .margin({ top: 16 })

          }

          Column() {
            Column() {

            }
            .height(152)
            .border({ width: 1 })
            .borderRadius(14)

            Column() {

            }
            .height(116)
            .border({ width: 1 })
            .borderRadius(14)
            .margin({ top: 16 })

          }
          .width(155)
        }
        .margin({ top: 16 })
        .justifyContent(FlexAlign.SpaceBetween)
      }
      .justifyContent(FlexAlign.Start)
      .height('100%')
      .width('100%')


      Column()
        .backgroundColor(Color.Blue)
        .width('100%')
        .height(40)
        .align(Alignment.Bottom)
        .margin({ bottom: 29 })
    }
    .height('100%')
    .width('100%')
    .padding({ left: 24, right: 24 })
  }
}