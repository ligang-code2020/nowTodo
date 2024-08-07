import dayjs from 'dayjs'

interface Title {
  title: string
}


@Builder
function titleFormItem($$: Title) {
  Column() {
    Text('标题')
      .fontColor('#8A8BB3')
      .fontSize(14)
      .fontWeight(600)
      .margin({ bottom: 10 })
    TextInput({ placeholder: '请输入任务名称', text: $$.title })
      .placeholderFont({ size: 12 })
      .padding({
        bottom: 4,
        top: 0,
        left: 0,
        right: 0
      })
      .border({
        color: '#E8E9F3',
        width: {
          bottom: 1
        }
      })
      .borderRadius(0)
      .placeholderColor('#C6CEDD')
      .backgroundColor(Color.White)
      .type(InputType.Normal)
      .width('100%')
  }
  .alignItems(HorizontalAlign.Start)
  .margin({ top: 39 })
  .padding({ left: 30, right: 30 })
}


@Component
struct dateFormItem {
  @State selectedDate: Date = new Date(dayjs().format('YYYY-MM-DD'))
  @State isShow: boolean = false
  @State sheetHeight: number = 300

  @Builder
  datePick() {
    Column() {
      DatePicker({
        start: new Date(dayjs().format('YYYY-MM-DD')),
        end: new Date(dayjs().endOf('year').format('YYYY-MM-DD')),
        selected: this.selectedDate
      })
        .disappearTextStyle({ color: Color.Gray, font: { size: '16fp', weight: FontWeight.Bold } })
        .textStyle({ color: '#ff182431', font: { size: '18fp', weight: FontWeight.Normal } })
        .selectedTextStyle({ font: { weight: FontWeight.Bold } })
        .onDateChange((value: Date) => {
          this.selectedDate = value
        })

    }
    .width('100%')
  }

  build() {
    Column() {
      Text('日期')
        .fontColor('#8A8BB3')
        .fontSize(14)
        .fontWeight(600)
        .margin({ bottom: 10 })
      Row() {
        Text(dayjs(this.selectedDate).format('YYYY/MM/DD')).fontSize(16).fontColor('#10275A').fontWeight(600)
        Image($r('app.media.calendar')).width(20).aspectRatio(1)
          .bindSheet($$this.isShow, this.datePick(), {
            height: this.sheetHeight,
            backgroundColor: Color.White,
            blurStyle: BlurStyle.Thick,
            showClose: true,
            title: { title: "选择日期" },
            onWillAppear: () => {
              console.log("BindSheet onWillAppear.")
            },
            onAppear: () => {
              console.log("BindSheet onAppear.")
            },
            onWillDisappear: () => {
              console.log("BindSheet onWillDisappear.")
            },
            onDisappear: () => {
              console.log("BindSheet onDisappear.")
            }
          })
          .onClick(() => {
            this.isShow = true
          })
      }
      .padding({ bottom: 7 })
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .border({
        color: '#E8E9F3',
        width: {
          bottom: 1
        }
      })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .margin({ top: 20 })
    .padding({ left: 30, right: 30 })
  }
}

@ComponentV2
struct timeFormItem {
  build() {
  }
}


@Entry
@Component
struct AddTaskPage {
  @State title: string = ''
  @State selectedDate: Date = new Date("2024-08-06")

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

      Text('添加任务')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor('#10275A')
        .margin({ top: 55 })
        .height(29)

      titleFormItem({
        title: this.title
      })

      dateFormItem()


    }
    .height('100%')
    .width('100%')
  }
}