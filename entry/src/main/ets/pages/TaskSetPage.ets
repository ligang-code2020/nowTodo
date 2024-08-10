import { SearchBar } from '../component/SearchBar'
import { CJCalendar, SelectedShape, CJCellStyle, CJDateItem, CellStatus } from 'cjcalendar'
import dayjs from 'dayjs'


@CustomDialog
struct DateFilter {
  controller?: CustomDialogController

  build() {
    Column() {
      CJCalendar({
        showLunar: true,
        selectedShape: SelectedShape.RECT,
        showFastToday: false,
        // buildCellBackground: this.BuildCellBackground,
        // buildCellBody: this.BuildCellBody,
        buildCellStyle: (item: CJDateItem) => {
          let cjCellStyle: CJCellStyle = new CJCellStyle()
          cjCellStyle.selectFontColor = Color.Black
          return cjCellStyle
        }
      })
    }
  }
}


@Entry
@Component
struct TaskSetPage {
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: DateFilter(),
    alignment: DialogAlignment.Center,
    onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
      console.info("reason=" + JSON.stringify(dismissDialogAction.reason))
      console.log("dialog onWillDismiss")
      if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
        dismissDialogAction.dismiss()
      }
      if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
        dismissDialogAction.dismiss()
      }
    }
  })

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

      Text('已完成')
        .height(29)
        .fontColor('#000000')
        .fontSize(18)
        .fontWeight(700)
        .margin({ top: 55 })

      Column() {
        Row() {
          SearchBar().layoutWeight(1)
          Row() {
            Image($r('app.media.filter')).width(24).aspectRatio(1)
          }
          .borderRadius(15)
          .height(50)
          .width(50)
          .backgroundColor('#F6F6F6')
          .margin({ left: 15 })
          .justifyContent(FlexAlign.Center)
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .margin({ top: 40 })
        .height(50)
        .width(327)

        Row() {
          Image($r('app.media.calendar'))
            .width(24)
            .aspectRatio(1)
            .margin({ right: 10 })
            .onClick(() => {
              if (this.dialogController != null) {
                this.dialogController.open()
              }
            })
          Text('2024/08/10')
            .fontSize(20)
            .fontWeight(600)
            .fontColor('#000000')
            .height(30)
        }
        .margin({ top: 23 })
        .width('100%')
      }
      .padding({ left: 24, right: 24 })
    }
    .height('100%')
    .width('100%')
  }
}