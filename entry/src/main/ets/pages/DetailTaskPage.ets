interface Tag {
  tagName: string,
  tagColor: ResourceColor,
  bgColor: ResourceColor
}

@Component
struct tagFormItem {
  build() {
    Column() {
      Text('标签')
        .height(23)
        .fontWeight(600)
        .fontColor('#72757e')
        .margin({ bottom: 15 })
      Row() {
        List({ space: 6 }) {
          ForEach(tagList, (tag: Tag, index: number) => {
            ListItem() {
              Row() {
                Text(tag.tagName).fontSize(14).fontWeight(600).fontColor(tag.tagColor)
              }
              .padding({
                left: 20,
                right: 20,
                top: 6,
                bottom: 6
              })
              .backgroundColor(tag.bgColor)
              .borderRadius(22)
            }
          })
        }
        .height(34)
        .listDirection(Axis.Horizontal)
        .scrollBar(BarState.Off)
      }
      .width('100%')
    }
    .alignItems(HorizontalAlign.Start)
    .margin({ top: 24 })
  }
}


const tagList: Tag[] = [
  {
    tagName: '办公',
    tagColor: '#8F81FE',
    bgColor: '#ECEAFF'
  },
  {
    tagName: '家庭',
    tagColor: '#F0A58E',
    bgColor: '#FFEFEB'
  },
  {
    tagName: '日程',
    tagColor: '#F57C96',
    bgColor: '#FFE9ED'
  }
]


@Entry
@Component
struct DetailTaskPage {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Row() {
        Image($r('app.media.left_return')).width(24).aspectRatio(1)
      }
      .width(48)
      .height(48)
      .borderRadius(14)
      .justifyContent(FlexAlign.Center)
      .shadow({
        offsetX: -3,
        offsetY: 7,
        radius: 13,
        color: '#F1F7FF'
      })
      .position({ left: 24, top: 45 })

      Text('任务详情')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor('#10275A')
        .margin({ top: 55 })
        .height(29)

      Row() {
        Image($r('app.media.notice')).width(24).aspectRatio(1)
      }
      .width(48)
      .height(48)
      .position({
        top: 45,
        right: 27
      })
      .justifyContent(FlexAlign.Center)
      .borderRadius(14)
      .shadow({
        radius: 13,
        offsetX: -3,
        offsetY: 7,
        color: '#F1F7FF'
      })

      Column() {
        Text('吃饭上班打豆豆')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .fontColor('#10275A')
          .width('100%')
          .textAlign(TextAlign.Start)

        Text('个人类型')
          .fontSize(14)
          .fontColor('#2E426E')
          .height(23)
          .margin({ top: 8 })
          .width('100%')
          .textAlign(TextAlign.Start)

        Row({ space: 11 }) {
          Column() {
            Text('创建日期')
              .fontColor('#80ffffff')
              .fontSize(18)
              .fontWeight(600)
              .height(29)
              .width('100%')
            Text('2024/08/06')
              .fontColor('#ffffff')
              .fontSize(18)
              .fontWeight(600)
              .width('100%')
              .height(29)

          }
          .borderRadius(14)
          .linearGradient({
            repeating: false,
            direction: GradientDirection.LeftTop,
            colors: [['#FE9D9D', 0], ['#E77D7D', 1]]
          })
          .padding({ left: 16, top: 16, bottom: 11 })
          .layoutWeight(1)


          Column() {
            Text('创建时间')
              .fontColor('#80ffffff')
              .fontSize(18)
              .fontWeight(600)
              .height(29)
              .width('100%')
            Text('07:00 - 07:30')
              .fontColor('#ffffff')
              .fontSize(18)
              .fontWeight(600)
              .width('100%')
              .height(29)

          }
          .borderRadius(14)
          .linearGradient({
            repeating: false,
            direction: GradientDirection.LeftTop,
            colors: [['#FE9D9D', 0], ['#E77D7D', 1]]
          })
          .padding({ left: 16, top: 16, bottom: 11 })
          .layoutWeight(1)

        }
        .width('100%')
        .margin({ top: 22 })

        Column() {
          Text('是否完成')
            .width('100%')
            .fontWeight(600)
            .fontColor('#72757e')
            .textAlign(TextAlign.Start)

          Row() {
            Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
              .select(true)
              .selectedColor('#27bf57')
              .shape(CheckBoxShape.CIRCLE)
              .onChange((value: boolean) => {
                console.info('Checkbox1 change is' + value)
              })
              .width(80)
              .height(80)
          }
          .margin({ top: 40 })
          .width('100%')
          .justifyContent(FlexAlign.Center)

        }
        .margin({ top: 30 })

        tagFormItem()


      }
      .padding({ left: 24, right: 24 })
      .margin({ top: 30 })

    }
    .height('100%')
    .width('100%')
  }
}