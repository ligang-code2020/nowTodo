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
struct WeeklyTabs {
  @State animate: boolean = false;
  // 第一步: 声明相关状态变量
  @State rotateValue: number = 0; // 组件一旋转角度
  @State translateX: number = 0; // 组件二偏移量
  @State opacityValue: number = 1; // 组件二透明度
  @State offsetNum: number = 50;

  build() {
    Column() {
      Row() {
        ForEach(weekRange, (weekDay: WeekRange, index: number) => {
          Column() {
            Text(weekDay.weekName)
              .fontColor(index === 3 ? '#FFFFFF' : '#10275A')
              .fontWeight(600)
              .fontSize(16)
              .height(26)
            Text(weekDay.date.toString())
              .fontColor(index === 3 ? '#FFFFFF' : '#10275A')
              .fontSize(14)
              .margin({ top: 2 })
              .height(23)
          }
          .height(71)
          .layoutWeight(1)
          .backgroundColor(index === 3 ? '#5B67CA' : '#FFFFFF')
          .alignItems(HorizontalAlign.Center)
          .justifyContent(FlexAlign.Center)
          .borderRadius(12)
        })
      }
      .margin({ bottom: 50 })


      // 组件二
      Column() {
      }
      .width(100)
      .height(100)
      .margin({ bottom: 40 })
      .backgroundColor('#D94838')
      .borderRadius(30)
      .translate({ x: this.translateX })
      .zIndex(10)

      Button('OK', { type: ButtonType.Normal, stateEffect: true })
        .margin({ bottom: 20 })
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(90)
        .onClick(() => {
          console.log('12322223')
          animateTo({ curve: curves.springMotion(0, 0.825), tempo: 1.2 }, () => {
            this.animate = !this.animate;
            // 第三步：闭包内通过状态变量改变UI界面
            // 这里可以写任何能改变UI的逻辑比如数组添加，显隐控制，系统会检测改变后的UI界面与之前的UI界面的差异，对有差异的部分添加动画
            // 组件一的rotate属性发生变化，所以会给组件一添加rotate旋转动画
            this.rotateValue = this.animate ? 90 : 0;
            // 组件二的透明度发生变化，所以会给组件二添加透明度的动画
            this.opacityValue = this.animate ? 0.6 : 1;
            // 组件二的offset属性发生变化，所以会给组件二添加offset偏移动画
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