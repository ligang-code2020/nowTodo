import { curves } from '@kit.ArkUI';

interface WeekRange {
  weekName: string,
  date: number
}

const weekRange: WeekRange[] = [
  {
    weekName: '一',
    date: 12
  },
  {
    weekName: '二',
    date: 13
  },
  {
    weekName: '三',
    date: 14
  },
  {
    weekName: '四',
    date: 15
  },
  {
    weekName: '五',
    date: 16
  },
  {
    weekName: '六',
    date: 17
  },
  {
    weekName: '日',
    date: 18
  }
]


@Component
@Entry
export  struct WeeklyTabs {
  @State currentIndex: number = 1
  @State translateX: number = 0; // 组件二偏移量
  @State opacityValue: number = 1; // 组件二透明度
  @State offsetNum: number = 0;

  build() {
    Column() {
      Row() {
        ForEach(weekRange, (weekDay: WeekRange, index: number) => {
          Column() {
            Text(weekDay.weekName)
              .fontColor(index === 0 ? '#FFFFFF' : '#10275A')
              .fontWeight(600)
              .fontSize(16)
              .height(26)
            Text(weekDay.date.toString())
              .fontColor(index === 0 ? '#FFFFFF' : '#10275A')
              .fontSize(14)
              .margin({ top: 2 })
              .height(23)
          }
          .height(71)
          .layoutWeight(1)
          // .backgroundColor(index === 0 ? '#5B67CA' : '#FFFFFF')
          .alignItems(HorizontalAlign.Center)
          .justifyContent(FlexAlign.Center)
          .borderRadius(12)
          .id((index + 1).toString())
          .onClick(() => {
            console.log("index", index.toString())
            this.currentIndex = index;
            animateTo({ curve: curves.springMotion(0, 0.9), tempo: 1.2 }, () => {
              console.log('切换')
              // this.offsetNum += 20;
              this.translateX = this.currentIndex * (360 / 7)
            })
          })
        })

        // 背景滑块
        Column() {

        }
        .backgroundColor('#5B67CA')
        .height(71)
        .width(360 / 7)
        .position({ top: 0, left: 0 })
        .borderRadius(12)
        .translate({ x: this.translateX })
        .zIndex(-1)

      }
      .margin({ bottom: 50 })
      .id('father')

      Button('OK1', { type: ButtonType.Normal, stateEffect: true })
        .margin({ bottom: 20 })
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(90)
        .onClick(() => {
          let father = getInspectorByKey('father')
          father = JSON.parse(father)
          console.log('111', JSON.stringify(father['$attrs'].size))
          this.offsetNum = 360 / 7
        })

      Button('切换', { type: ButtonType.Normal, stateEffect: true })
        .margin({ bottom: 20 })
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(90)
        .onClick(() => {
          console.log('12322223')
          animateTo({ curve: curves.springMotion(0, 0.825), tempo: 1.2 }, () => {
            console.log('切换')
            // this.offsetNum += 20;
            this.translateX = this.currentIndex * (360 / 7)
          })
        })

      // 组件二
      Column() {
      }
      .width(100)
      .height(100)
      .margin({ bottom: 40 })
      .backgroundColor('#D94838')
      .borderRadius(30)
      // .translate({ x: this.translateX })
      .zIndex(10)

      Button('OK', { type: ButtonType.Normal, stateEffect: true })
        .margin({ bottom: 20 })
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(90)
        .onClick(() => {
          console.log('12322223')
          animateTo({ curve: curves.springMotion(0, 0.825), tempo: 1.2 }, () => {
            this.offsetNum += 20;
            this.translateX = this.offsetNum
          })
        })

      Button('重置', { type: ButtonType.Normal, stateEffect: true })
        .margin({ bottom: 20 })
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(90)
        .onClick(() => {
          animateTo({ curve: curves.springMotion(0, 0.825), tempo: 1.2 }, () => {
            this.translateX = 0
            this.offsetNum = 20
          })
        })

    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)

  }
}