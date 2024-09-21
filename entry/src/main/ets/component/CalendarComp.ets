import { CJCalendar, SelectedShape, CJCellStyle, CJDateItem, CellStatus, CJCalendarControl } from 'cjcalendar'
import dayjs from 'dayjs'


interface Time {
  date: string,
  time: string
}

const timeList: Time[] = [
  {
    date: '2024-09-01',
    time: '5.34h'
  },
  {
    date: '2024-09-02',
    time: '5.34h'
  },
  {
    date: '2024-09-10',
    time: '4.34h'
  },
  {
    date: '2024-09-15',
    time: '6.34h'
  },
  {
    date: '2024-09-18',
    time: '5.34h'
  },
  {
    date: '2024-09-19',
    time: '5.34h'
  },
  {
    date: '2024-09-20',
    time: '6.34h'
  },
  {
    date: '2024-09-21',
    time: '9.34h'
  }
]


const getDayHours = (today: string, timeList: Time[]) => {
  const time = timeList.find((timeItem: Time) => {
    return timeItem.date === today
  })
  return time?.time
}

@Component
export struct CalendarComp {
  @Link selectedDate: string
  private cjCellStyle: CJCellStyle = new CJCellStyle()
  private cjDataItem: CJDateItem = new CJDateItem(new Date())
  cjCellStatus: CellStatus = new CellStatus()

  aboutToAppear(): void {
    console.log("xxxxcjDataItem", JSON.stringify(this.cjDataItem))
    console.log("xxxxday", dayjs(this.cjDataItem.time).format('YYYY-MM-DD HH:mm:ss'))
  }

  build() {
    Column() {
      CJCalendar({
        showLunar: true,
        selectedShape: SelectedShape.RECT,
        showFastToday: false,
        buildCellBackground: this.BuildCellBackground,
        buildCellBody: this.BuildCellBody,
        buildCellStyle: (item: CJDateItem) => {
          let cjCellStyle: CJCellStyle = new CJCellStyle()
          cjCellStyle.selectFontColor = Color.Black
          return cjCellStyle
        },
        onCellItemClick: (item: CJDateItem) => {
          console.log("xx点击了：", JSON.stringify(item))
          this.selectedDate = dayjs(item.time).format('YYYY-MM-DD')
        }
      })
    }
    .width('100%')
  }

  @Builder
  BuildCellBackground() {
    if (this.cjDataItem.isSelected) {
      Column()
        .backgroundColor('#286488')
        .width('90%')
        .aspectRatio(1)
        .border({
          width: this.cjCellStyle.boderWidth,
          color: this.cjCellStyle.boderColor
        })
        .borderRadius(10)
    } else if (this.cjDataItem.isToday) { // 今天
      Column()
        .backgroundColor(Color.Transparent)
        .width('90%')
        .aspectRatio(1)
        .border({
          width: this.cjCellStyle.boderWidth,
          color: this.cjCellStyle.boderColor
        })
    } else {
      Column()
        .backgroundColor(Color.Transparent)
        .width('90%')
        .aspectRatio(1)
        .border({
          width: this.cjCellStyle.boderWidth,
          color: this.cjCellStyle.boderColor
        })
        .borderRadius(50)
    }

  }

  @Builder
  BuildCellBody() {
    Column() {
      Text(this.cjDataItem.date + '')
        .fontColor(this.cjDataItem.isSelected ? Color.White
          : this.cjDataItem.isToday ? '#ff6e6c' : this.cjCellStatus.fontColor)
        .fontSize(16)
        .fontWeight(700)
        .height(20)
      Text(getDayHours(dayjs(this.cjDataItem.time).format('YYYY-MM-DD'), timeList))
        .fontColor(this.cjDataItem.isSelected ? Color.White : '#286488')
        .fontSize(12)
        .fontWeight(500)
    }
    .height(48)
    .padding({ top: 5, bottom: 6 })
    .justifyContent(FlexAlign.SpaceBetween)

  }
}