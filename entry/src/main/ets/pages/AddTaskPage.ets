import dayjs from 'dayjs'
import { text } from '@kit.ArkGraphics2D'
import { HMRouter } from '@hadss/hmrouter'

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

interface Tag {
  tagName: string,
  tagColor: ResourceColor,
  bgColor: ResourceColor
}

const typeList: Type[] = [
  { typeName: '个人', type: 'personal' },
  { typeName: '工作', type: 'work' },
  { typeName: '学习', type: 'study' },
  { typeName: '旅游', type: 'travel' }
]
const tagList: Tag[] = [
  {
    tagName: '办公',
    tagColor: '#8F81FE',
    bgColor: '#ECEAFF'
  },
  {
    tagName: '家庭',
    tagColor: '#F0A58E',
    bgColor: '#FFEFEB'
  },
  {
    tagName: '日程',
    tagColor: '#F57C96',
    bgColor: '#FFE9ED'
  }
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
  @State selectedType: string[] = []

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
                    if (value) {
                      this.selectedType.push(type.type)
                    } else {
                      this.selectedType = this.selectedType.filter(item => item !== type.type)
                    }
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
        .scrollBar(BarState.Off)
        .height(26)
      }
      .width('100%')
    }
    .alignItems(HorizontalAlign.Start)
    .margin({ top: 24 })
    .padding({ left: 30, right: 30 })
  }
}


@CustomDialog
struct CreateTagDialog {
  controller?: CustomDialogController
  @State tagName: string = ''

  build() {
    Column() {
      Text('新标签')
        .fontSize(22)
        .fontWeight(700)
        .fontColor('#10275A')
        .margin({ top: 25 })
        .height(36)
      TextInput({ placeholder: '请输入标签名', text: this.tagName })
        .placeholderFont({ size: 18, weight: FontWeight.Bold })
        .borderRadius(10)
        .placeholderColor('#10275A')
        .backgroundColor('#F6F6F6')
        .type(InputType.Normal)
        .width(281)
        .margin({ top: 16 })
      Row() {
        Row() {
          Text('取消')
            .fontSize(14)
            .fontWeight(600)
            .fontColor('#5B67CA')
            .textAlign(TextAlign.Center)
            .width('100%')
        }
        .borderRadius(6)
        .border({
          width: 1.5,
          color: '#5B67CA'
        })
        .width(91)
        .height(35)
        .backgroundColor(Color.White)
        .margin({ right: 20 })
        .onClick(() => {
          if (this.controller != undefined) {
            this.controller.close()
          }
        })


        Button('保存', { type: ButtonType.Normal })
          .borderRadius(6)
          .backgroundColor('#5B67CA')
          .width(91)
          .height(35)
          .fontSize(14)
          .fontWeight(600)
          .fontColor(Color.White)
          .onClick(() => {
          })
      }
      .margin({ top: 32, bottom: 30 })
    }
  }
}

@Component
struct tagFormItem {
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: CreateTagDialog(),
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
      Text('标签')
        .height(23)
        .fontColor('#8A8BB3')
        .fontSize(14)
        .fontWeight(600)
        .margin({ bottom: 10 })
      Row() {
        List({ space: 6 }) {
          ForEach(tagList, (tag: Tag, index: number) => {
            ListItem() {
              Row() {
                Text(tag.tagName).fontSize(14).fontWeight(600).fontColor(tag.tagColor)
              }
              .padding({
                left: 20,
                right: 20,
                top: 6,
                bottom: 6
              })
              .backgroundColor(tag.bgColor)
              .borderRadius(22)
            }
          })
        }
        .height(34)
        .listDirection(Axis.Horizontal)
        .scrollBar(BarState.Off)
      }
      .width('100%')


      Text('+ 添加标签')
        .width('100%')
        .fontWeight(600)
        .fontSize(12)
        .fontColor('#A8AEDF')
        .margin({ top: 16 })
        .textAlign(TextAlign.Center)
        .onClick(() => {
          if (this.dialogController != null) {
            this.dialogController.open()
          }
        })

    }
    .alignItems(HorizontalAlign.Start)
    .margin({ top: 24 })
    .padding({ left: 30, right: 30 })
  }
}


@HMRouter({
  pageUrl: 'AddTaskPage',
  singleton: true
})
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
      tagFormItem()

      Button('创建', { type: ButtonType.Normal })
        .margin({ top: 38 })
        .borderRadius(14)
        .width(327)
        .height(56)
        .backgroundColor('#5B67CA')
        .fontSize(18)
        .fontWeight(600)
        .fontColor(Color.White)
        .onClick(() => {
        })


    }
    .height('100%')
    .width('100%')
  }
}