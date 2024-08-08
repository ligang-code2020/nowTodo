import dayjs from 'dayjs'

interface Title {
  title: string
}

interface Tmp {
  time: Date,
  index: number
}

interface Type {
  typeName: string,
  type: string
}

const typeList: Type[] = [
  { typeName: '个人', type: 'personal' },
  { typeName: '工作', type: 'work' },
  { typeName: '学习', type: 'study' },
  { typeName: '旅游', type: 'travel' }
]

@Builder
function titleFormItem($$: Title) {
  Column() {
    Text('标题')
      .height(23)
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
        .height(23)
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

@Component
struct timeFormItem {
  @State startTime: Date = new Date(dayjs().format('YYYY-MM-DD 00:00:00'))
  @State endTime: Date = new Date(dayjs().format('YYYY-MM-DD HH:mm:ss'))
  @State isShow: boolean = false
  @State endTimeShow: boolean = false
  @State sheetHeight: number = 300

  @Builder
  timePick($$: Tmp) {
    Column() {
      TimePicker({
        selected: $$.time,
      })
        .useMilitaryTime(true)
        .onChange((value: TimePickerResult) => {
          if (value.hour >= 0) {
            $$.index === 1 ? this.startTime.setHours(value.hour, value.minute) :
            this.endTime.setHours(value.hour, value.minute)
            console.info('select current date is: ' + JSON.stringify(value))
          }
        })
        .disappearTextStyle({ font: { size: 15, weight: FontWeight.Bold } })
        .textStyle({ color: Color.Black, font: { size: 20, weight: FontWeight.Normal } })
        .selectedTextStyle({ font: { size: 30, weight: FontWeight.Bolder } })
    }
    .width('100%')
  }

  build() {
    Column() {
      Text('时间')
        .fontColor('#8A8BB3')
        .fontSize(14)
        .fontWeight(600)
        .height(23)
        .margin({ bottom: 10 })
      Row({ space: 15 }) {
        Row() {
          Text(dayjs(this.startTime).format('HH:mm'))
            .fontColor('#10275A')
            .fontSize(16)
            .fontWeight(600)
        }
        .padding({ bottom: 10 })
        .justifyContent(FlexAlign.Center)
        .border({
          color: '#E8E9F3',
          width: {
            bottom: 1
          }
        })
        .layoutWeight(1)
        .bindSheet($$this.isShow,
          this.timePick({
            time: this.startTime,
            index: 1
          }), {
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

        Row() {
          Text(dayjs(this.endTime).format('HH:mm'))
            .fontColor('#10275A')
            .fontSize(16)
            .fontWeight(600)
        }
        .padding({ bottom: 10 })
        .justifyContent(FlexAlign.Center)
        .border({
          color: '#E8E9F3',
          width: {
            bottom: 1
          }
        })
        .layoutWeight(1)
        .bindSheet($$this.endTimeShow,
          this.timePick({
            time: this.endTime,
            index: 2
          }), {
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
          this.endTimeShow = true
        })
      }
      .width('100%')
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .margin({ top: 20 })
    .padding({ left: 30, right: 30 })
  }
}

@Component
struct descriptionFormItem {
  @State description: string = ''

  build() {
    Column() {
      Text('描述')
        .height(23)
        .fontColor('#8A8BB3')
        .fontSize(14)
        .fontWeight(600)
        .margin({ bottom: 10 })
      TextInput({ placeholder: '请输入任务描述', text: this.description })
        .placeholderFont({ size: 12 })
        .padding({
          bottom: 7,
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
    .margin({ top: 24 })
    .padding({ left: 30, right: 30 })
  }
}

@Component
struct typeFormItem {
  build() {
    Column() {
      Text('类型')
        .height(23)
        .fontColor('#8A8BB3')
        .fontSize(14)
        .fontWeight(600)
        .margin({ bottom: 10 })
      Row() {
        List({ space: 30 }) {
          ForEach(typeList, (type: Type, index: number) => {
            ListItem() {
              Row() {
                Checkbox({ name: type.type })
                  .select(false)
                  .selectedColor('#5B67CA')
                  .shape(CheckBoxShape.ROUNDED_SQUARE)
                  .onChange((value: boolean) => {
                    console.info('Checkbox1 change is' + value + '' + type.type)
                  })
                  .height(16)
                  .width(16)
                Text(type.typeName)
                  .fontSize(16)
                  .fontWeight(600)
                  .fontColor('#10275A')
                  .margin({ left: 8 })
              }

            }
          })
        }
        .listDirection(Axis.Horizontal)
      }
      .width('100%')
    }
    .alignItems(HorizontalAlign.Start)
    .margin({ top: 24 })
    .padding({ left: 30, right: 30 })
  }
}


@Entry
@Component
export struct AddTaskPage {
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
      timeFormItem()
      descriptionFormItem()
      typeFormItem()


    }
    .height('100%')
    .width('100%')
  }
}