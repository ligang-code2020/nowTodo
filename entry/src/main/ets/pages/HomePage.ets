import { FloatTabs } from '../component/FloatTabs'

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
              // 已完成卡片
              Column() {
                Column() {
                  Image($r('app.media.computer')).width(92).height(69).zIndex(8).margin({ top: 10, left: 14 })
                  Row() {
                    Image($r('app.media.vector8'))
                      .width(39)
                      .height(50)
                      .position({ left: 55, top: 0 })
                    Image($r('app.media.vector9'))
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


                // 阴影
                Column() {
                  Image($r('app.media.blur')).width('100%').height('100%')
                }
                .borderRadius(14)
                .width(140)
                .height(93)
                .position({ right: -15, bottom: -15 })
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

              // 已取消卡片
              Column() {
                Column() {
                  Column() {
                    Image($r('app.media.canceled')).width(28).aspectRatio(1).zIndex(8).margin({ top: 15, left: 17 })
                    Row() {
                      Image($r('app.media.vector6'))
                        .width(39)
                        .height(50)
                        .position({ left: 55, top: 0 })
                      Image($r('app.media.vector7'))
                        .width(39)
                        .height(50)
                        .position({ left: 94, top: 0 })
                      Image($r('app.media.arrow_right1'))
                        .width(12)
                        .height(12)
                        .position({ left: 128, top: 15 })
                        .zIndex(10)
                    }

                    Text('已取消')
                      .fontSize(16)
                      .fontColor('#FFFFFF')
                      .fontWeight(600)
                      .margin({ left: 15, bottom: 8, top: 8 })
                      .height(21)

                    Text('15 个任务')
                      .fontSize(14)
                      .fontColor('#FFFFFF')
                      .margin({ left: 15 })
                      .height(21)
                  }
                  .alignItems(HorizontalAlign.Start)
                  .borderRadius(14)
                  .width('100%')
                  .height(116)

                  Column() {
                    Image($r('app.media.blur1')).width('100%').height('100%')
                  }
                  .borderRadius(14)
                  .width(140)
                  .height(73)
                  .position({ bottom: 0, right: 0 })
                  .zIndex(-1)

                }
              }
              .alignItems(HorizontalAlign.Start)
              .height(116)
              .width('100%')
              .borderRadius(14)
              .margin({ top: 16 })
              .linearGradient({
                repeating: false,
                direction: GradientDirection.RightTop, // angle: 225
                colors: [['#E77D7D', 0], ['#b5e77d7d', 1]]
              })

            }
            .layoutWeight(1)


            Column() {
              // 暂停中
              Column() {
                Column() {
                  Image($r('app.media.alarm')).width(28).aspectRatio(1).zIndex(8).margin({ top: 15, left: 15 })
                  Row() {
                    Image($r('app.media.vector2'))
                      .width(39)
                      .height(50)
                      .position({ left: 55, top: 0 })
                    Image($r('app.media.vector3'))
                      .width(39)
                      .height(50)
                      .position({ left: 94, top: 0 })
                    Image($r('app.media.arrow_right1'))
                      .width(12)
                      .height(12)
                      .position({ left: 128, top: 15 })
                      .zIndex(10)
                  }

                  Text('暂停中')
                    .fontSize(16)
                    .fontColor('#FFFFFF')
                    .fontWeight(600)
                    .margin({ left: 15, bottom: 8, top: 8 })
                    .height(21)

                  Text('10 个任务')
                    .fontSize(14)
                    .fontColor('#FFFFFF')
                    .margin({ left: 15 })
                    .height(21)
                }
                .alignItems(HorizontalAlign.Start)
                .borderRadius(14)
                .width('100%')
                .height(116)

              }
              .height(116)
              .width('100%')
              .borderRadius(14)
              .linearGradient({
                repeating: false,
                direction: GradientDirection.RightTop, // angle: 225
                colors: [['#7D88E7', 0], ['#bd7d88e7', 1]]
              })

              // 进行中
              Column() {
                Column() {
                  Column() {
                    Image($r('app.media.folder')).width(92).height(69).zIndex(8).margin({ top: 10, left: 14 })
                    Row() {
                      Image($r('app.media.vector4'))
                        .width(39)
                        .height(50)
                        .position({ left: 55, top: 0 })
                      Image($r('app.media.vector5'))
                        .width(39)
                        .height(50)
                        .position({ left: 94, top: 0 })
                      Image($r('app.media.arrow_right'))
                        .width(12)
                        .height(12)
                        .position({ left: 128, top: 15 })
                        .zIndex(10)
                    }

                    Text('进行中')
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
                }
                .alignItems(HorizontalAlign.Start)
                .height(152)
                .borderRadius(14)
              }
              .height(152)
              .width('100%')
              .borderRadius(14)
              .margin({ top: 16 })
              .linearGradient({
                repeating: false,
                direction: GradientDirection.RightTop, // angle: 225
                colors: [['#81E89E', 0], ['#5981e89e', 1]]
              })

            }
            .layoutWeight(1)
          }
          .margin({ top: 16 })
        }
        .justifyContent(FlexAlign.Start)
        .height('1000')
        .width('100%')
        .padding({ left: 24, right: 24 })
      }


      // 悬浮 tabs 栏
      FloatTabs().align(Alignment.Bottom)


    }


    .height('100%')
    .width('100%')
  }
}