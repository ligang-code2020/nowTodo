import dayjs from 'dayjs'

interface Title {
  title: string
}

interface DateTime {
  date: Date
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
  selectedDate: Date = new Date("2024-08-06")

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
          .onClick(() => {
            DatePickerDialog.show({
              start: new Date(dayjs().format('YYYY-MM-DD')),
              end: new Date(dayjs().endOf('year').format('YYYY-MM-DD')),
              selected: this.selectedDate,
              useMilitaryTime: false,
              selectedTextStyle: {
                font: {
                  weight: FontWeight.Medium
                }
              },
              onDateAccept: (value: Date) => {
                // 通过Date的setFullYear方法设置按下确定按钮时的日期，这样当弹窗再次弹出时显示选中的是上一次确定的日期
                this.selectedDate = value
                console.info("DatePickerDialog:onDateAccept()" + value.toString())
              },
              onCancel: () => {
                console.info("DatePickerDialog:onCancel()")
              },
              onDateChange: (value: Date) => {
                console.info("DatePickerDialog:onDateChange()" + value.toString())
              }
            })
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