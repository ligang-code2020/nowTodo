import { curves } from '@kit.ArkUI';
import display from '@ohos.display';
import dayjs from "dayjs";
import { TimeTools, WeekDay } from '../utils/TimeTools'

const weekRange: WeekDay[] = TimeTools.getCurrentWeekRange();

@Component
@Entry
export struct WeeklyTabs {
  @State currentIndex: number = 0
  @State translateX: number = 0; // 组件二偏移量
  @State screenWidth: number = 312;

  aboutToAppear(): void {
    console.log("TimeTools", JSON.stringify(TimeTools.getCurrentWeekRange()))
    // 获取屏幕宽度
    // this.screenWidth = px2vp(display.getDefaultDisplaySync().width);
    // console.log("this.screenWidth", this.screenWidth)

  }

  // todo 字体颜色需要实现渐变
  build() {
    Column() {
      Row() {
        ForEach(weekRange, (weekDay: WeekDay, index: number) => {
          Column() {
            Text(weekDay.weekName)
              .fontColor(index === this.currentIndex ? '#bae8e8' : '#232323')
              .fontWeight(600)
              .fontSize(16)
              .height(26)
              .transition({})
            Text(weekDay.date.toString())
              .fontColor(index === this.currentIndex ? '#bae8e8' : '#232323')
              .fontSize(14)
              .margin({ top: 2 })
              .height(23)
          }
          .height(71)
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Center)
          .justifyContent(FlexAlign.Center)
          .borderRadius(12)
          .onClick(() => {
            console.log("index", index.toString())
            this.currentIndex = index;
            animateTo(
              {
                curve: curves.springMotion(0, 0.89), // 弹簧阻尼效果
                tempo: 2
              }, () => {
              console.log('切换')
              this.translateX = this.currentIndex * (this.screenWidth / 7)
              console.log("this.translateX", this.translateX)
            })
          })
        })

        // 背景滑块
        Column()
          .backgroundColor('#5B67CA')
          .height(71)
          .width(this.screenWidth / 7)
          .position({ top: 0, left: 0 })
          .borderRadius(12)
          .translate({ x: this.translateX })
          .zIndex(-1)

      }
      .margin({ bottom: 50 })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)

  }
}