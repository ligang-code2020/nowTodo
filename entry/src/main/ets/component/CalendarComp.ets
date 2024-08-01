import { CJCalendar, SelectedShape, CJCellStyle, CJDateItem, CellStatus } from 'cjcalendar'
import dayjs from 'dayjs'

@Component
@Preview
export struct CalendarComp {
  private cjCellStyle: CJCellStyle = new CJCellStyle()
  private cjDataItem: CJDateItem = new CJDateItem(new Date())
  cjCellStatus: CellStatus = new CellStatus()

  aboutToAppear(): void {
    // this.cellStyle.fontSize = 25
    // this.cellStyle.fontFontWeight = FontWeight.Bold
    console.log("xxxxcjDataItem", JSON.stringify(this.cjDataItem))
    console.log("xxxxday", dayjs(this.cjDataItem.time).format('YYYY-MM-DD HH:mm:ss'))
  }

  build() {
    Column() {
      CJCalendar({
        showLunar: true,
        selectedShape: SelectedShape.RECT,
        showFastToday: false,
        // cjCellStyle: this.cellStyle,
        // buildCellBackground: this.BuildCellBackground,
        buildCellBody: this.BuildCellBody,
      })
    }
    .width('100%')
  }

  @Builder
  BuildCellBackground() {
    if (this.cjDataItem.isToday) { // 今天
      Column()
        .backgroundColor('#fd332f')
        .width('85%')
        .aspectRatio(1)
        .border({
          width: this.cjCellStyle.boderWidth,
          color: this.cjCellStyle.boderColor
        })
    } else {
      Column()
        .backgroundColor(this.cjCellStatus.backgroundColor)
        .width('85%')
        .aspectRatio(1)
        .border({
          width: this.cjCellStyle.boderWidth,
          color: this.cjCellStyle.boderColor
        })
    }

  }

  @Builder
  BuildCellBody() {

    Column() {
      Text(this.cjDataItem.date + '')
        .fontColor(this.cjCellStatus.fontColor)
        .fontSize(16)
        .fontWeight(700)
      // Text(this.cjDataItem.solar?.getLunar().toString().slice(-2))
      //   .fontSize(10)
      //   .fontColor(Color.Gray)
      //   .fontWeight(700)
      //   .fontColor(this.cjCellStatus.fontColor)
      //   .margin({ top: 3 })
      Text('5.45h')
        .fontColor(this.cjCellStatus.fontColor)
        .fontSize(12)
        .fontWeight(500)
        .margin({ top: 3 })
    }
    .alignItems(HorizontalAlign.Center)

  }
}