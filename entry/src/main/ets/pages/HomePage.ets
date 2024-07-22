@Entry
@Component
export default struct HomePage {
  @State message: string = 'Hello World';

  build() {
    Stack({ alignContent: Alignment.Bottom }) {

      Scroll() {
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
          Row({ space: 16 }) {
            Column() {
              Column() {
                Column() {
                  Image($r('app.media.computer')).width(92).height(69).zIndex(8).margin({ top: 10, left: 14 })
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

                  Text('已完成')
                    .fontSize(16)
                    .fontColor('#12175E')
                    .fontWeight(600)
                    .margin({ left: 15, bottom: 8, top: 8 })
                    .height(21)

                  Text('86 个任务')
                    .fontSize(14)
                    .fontColor('#12175E')
                    .margin({ left: 15 })
                    .height(21)
                }
                .alignItems(HorizontalAlign.Start)
                .borderRadius(14)
                .width('100%')
                .height(116)


                Column() {
                  Image($r('app.media.blur')).width('100%').height('100%')
                }
                .borderRadius(14)
                .width(140)
                .height(93)
                .position({ top: 61, right: 0 })
                .zIndex(-1)

              }
              .alignItems(HorizontalAlign.Start)
              .height(152)
              .borderRadius(14)
              .linearGradient({
                repeating: false,
                direction: GradientDirection.RightTop, // angle: 225
                colors: [['#7DC8E7', 0], ['#b07dc8e7', 1]]
              })

              Column() {
              }
              .height(116)
              .width('100%')
              .border({ width: 1 })
              .borderRadius(14)
              .margin({ top: 16 })

            }
            .layoutWeight(1)


            Column() {
              Column() {

              }
              .height(116)
              .width('100%')
              .border({ width: 1 })
              .borderRadius(14)

              Column() {

              }
              .height(152)
              .width('100%')
              .border({ width: 1 })
              .borderRadius(14)
              .margin({ top: 16 })

            }
            .layoutWeight(1)
          }
          .margin({ top: 16 })

          // .justifyContent(FlexAlign.SpaceBetween)
        }
        .justifyContent(FlexAlign.Start)
        .height('1000')
        .width('100%')
        .padding({ left: 24, right: 24 })

      }


      Column() {

      }
      .backgroundColor(Color.Blue)
      .width(316)
      .height(40)
      .align(Alignment.Bottom)
      .margin({ bottom: 29 })
    }


    .height('100%')
    .width('100%')
  }
}