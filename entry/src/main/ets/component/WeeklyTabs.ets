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
@Preview
export struct WeeklyTabs {
  build() {
    Row() {
      ForEach(weekRange, (weekDay: WeekRange, index: number) => {
        Column() {
          Text(weekDay.weekName).fontColor(index === 3 ? '#FFFFFF' : '#10275A').fontWeight(600).fontSize(16).height(26)
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
    .width('100%')
  }
}