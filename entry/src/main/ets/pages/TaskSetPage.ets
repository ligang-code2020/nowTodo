import { SearchBar } from '../component/SearchBar'
import { TheDayTaskList } from '../component/ThedayTaskList'
import { CJCalendar, SelectedShape, CJCellStyle, CJDateItem, CellStatus, OptMode, SelectedStyle } from 'cjcalendar'
import dayjs from 'dayjs'


interface Task {
  taskName: string,
  time: string,
  tag: string[],
  priority: number
}

interface TheDayTask {
  dateTime: string,
  taskList: Task[]
}

const theDayTaskList: TheDayTask[] = [
  {
    dateTime: '2024/05/01',
    taskList: [
      {
        taskName: '吃饭上上上班班班',
        time: '07:00 - 7:15',
        tag: ['必做', '重要'],
        priority: 2
      },
      {
        taskName: '上班嘻嘻嘻哈哈',
        time: '07:30 - 07:45',
        tag: ['随意'],
        priority: 1
      },
      {
        taskName: '下班3ssd',
        time: '07:59',
        tag: ['必做', '重要'],
        priority: 2
      }
    ]
  },
  {
    dateTime: '2024/05/01',
    taskList: [
      {
        taskName: '吃饭上上上班班班',
        time: '08:00 - 8:15',
        tag: ['必做', '重要'],
        priority: 2
      },
      {
        taskName: '上班嘻嘻嘻哈哈',
        time: '08:30 - 08:45',
        tag: ['随意'],
        priority: 1
      },
      {
        taskName: '下班3ssd',
        time: '08:59',
        tag: ['必做', '重要'],
        priority: 2
      }
    ]
  },
  {
    dateTime: '2024/05/01',
    taskList: [
      {
        taskName: '吃饭上上上班班班',
        time: '09:00 - 09:15',
        tag: ['必做', '重要'],
        priority: 2
      },
      {
        taskName: '上班嘻嘻嘻哈哈',
        time: '09:30 - 09:45',
        tag: ['随意'],
        priority: 1
      },
      {
        taskName: '下班3ssd',
        time: '09:59',
        tag: ['必做', '重要'],
        priority: 2
      }
    ]
  },
  {
    dateTime: '2024/05/01',
    taskList: [
      {
        taskName: '吃饭上上上班班班',
        time: '09:00 - 09:15',
        tag: ['必做', '重要'],
        priority: 2
      },
      {
        taskName: '上班嘻嘻嘻哈哈',
        time: '09:30 - 09:45',
        tag: ['随意'],
        priority: 1
      },
      {
        taskName: '下班3ssd',
        time: '09:59',
        tag: ['必做', '重要'],
        priority: 2
      }
    ]
  }
]

interface Type {
  typeName: string,
  type: string,
  typeColor: ResourceColor
}

interface Tag {
  tagName: string,
  tagColor: ResourceColor,
  bgColor: ResourceColor
}

const typeList: Type[] = [
  { typeName: '个人', type: 'personal', typeColor: '#8F99EB' },
  { typeName: '工作', type: 'work', typeColor: '#E88B8C' },
  { typeName: '学习', type: 'study', typeColor: '#7EC8E7' }
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
const timeSortList: string[] = ['最新', '最久']

@CustomDialog
 struct DateFilter {
  controller?: CustomDialogController
  private cjCellStyle: CJCellStyle = new CJCellStyle()
  private cjDataItem: CJDateItem = new CJDateItem(new Date())
  cjCellStatus: CellStatus = new CellStatus()

  build() {
    Column() {
      CJCalendar({
        optMode: OptMode.RANGE,
        showLunar: false,
        selectedShape: SelectedShape.CIRCLE,
        showFastToday: false,
        selectedStyle: SelectedStyle.CLOSE,
        buildCellStyle: (item: CJDateItem) => {
          let cjCellStyle: CJCellStyle = new CJCellStyle()
          cjCellStyle.selectItemBackgroundColor = '#5B67CA'
          cjCellStyle.selectFontColor = Color.White
          cjCellStyle.fontSize = 14
          cjCellStyle.fontFontWeight = 600
          cjCellStyle.selectFontSize = 14
          return cjCellStyle
        }
      })
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


        Button('确定', { type: ButtonType.Normal })
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
      .margin({ top: 24 })
    }
    .width(342)
    .padding({
      top: 24,
      bottom: 24,
      right: 30,
      left: 30
    })
  }
}

@CustomDialog
struct OtherFilter {
  controller?: CustomDialogController

  build() {
    Column() {
      Column() {
        Text('标签排序')
          .fontSize(15)
          .fontWeight(600)
          .fontColor('#000000')
          .width('100%')
          .height(24)
          .margin({ bottom: 16 })
        Row() {
          List({ space: 6 }) {
            ForEach(tagList, (tag: Tag, index: number) => {
              ListItem() {
                Row() {
                  Text(tag.tagName).fontSize(14).fontWeight(600).fontColor(tag.tagColor)
                }
                .padding({
                  left: 18,
                  right: 19,
                  top: 6,
                  bottom: 5
                })
                .backgroundColor(tag.bgColor)
                .borderRadius(22)
              }
            })
          }
          .height(31)
          .listDirection(Axis.Horizontal)
          .scrollBar(BarState.Off)
        }
        .width('100%')
      }

      Column() {
        Text('类型排序')
          .fontSize(15)
          .fontWeight(600)
          .fontColor('#000000')
          .width('100%')
          .height(24)
          .margin({ bottom: 16 })
        Row() {
          List({ space: 6 }) {
            ForEach(typeList, (tag: Type, index: number) => {
              ListItem() {
                Row() {
                  Text(tag.typeName).fontSize(14).fontWeight(600).fontColor(Color.White)
                }
                .padding({
                  left: 18,
                  right: 19,
                  top: 6,
                  bottom: 5
                })
                .backgroundColor(tag.typeColor)
                .borderRadius(22)
              }
            })
          }
          .height(31)
          .listDirection(Axis.Horizontal)
          .scrollBar(BarState.Off)
        }
        .width('100%')
      }
      .margin({ top: 32 })

      Column() {
        Text('时间排序')
          .fontSize(15)
          .fontWeight(600)
          .fontColor('#000000')
          .width('100%')
          .height(24)
          .margin({ bottom: 16 })
        Row() {
          List({ space: 6 }) {
            ForEach(timeSortList, (timeType: string, index: number) => {
              ListItem() {
                Row() {
                  Text(timeType).fontSize(13).fontWeight(500).fontColor('#000000')
                }
                .padding({
                  left: 18,
                  right: 19,
                  top: 6,
                  bottom: 5
                })
                .backgroundColor('#F9FAFD')
                .borderRadius(22)
              }
            })
          }
          .height(31)
          .listDirection(Axis.Horizontal)
          .scrollBar(BarState.Off)
        }
        .width('100%')
      }
      .margin({ top: 32 })

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


        Button('过滤', { type: ButtonType.Normal })
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
      .margin({ top: 50 })

    }
    .padding(20)
  }
}


@Entry
@Component
export  struct TaskSetPage {
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: DateFilter(),
    alignment: DialogAlignment.Center,
    cornerRadius: 20,
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
  dialogController1: CustomDialogController | null = new CustomDialogController({
    builder: OtherFilter(),
    alignment: DialogAlignment.Center,
    cornerRadius: 20,
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
      .position({ left: 24, top: 46 })

      Text('已完成')
        .height(29)
        .fontColor('#10275A')
        .fontSize(18)
        .fontWeight(700)
        .margin({ top: 56 })

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
          .onClick(() => {
            if (this.dialogController1 != null) {
              this.dialogController1.open()
            }
          })
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .margin({ top: 40 })
        .height(50)

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
          Text('2024/08')
            .fontSize(20)
            .fontWeight(600)
            .fontColor('#000000')
            .height(30)
        }
        .margin({ top: 23 })
        .width('100%')

        List({ space: 24 }) {
          ForEach(theDayTaskList, (theDayTask: TheDayTask) => {
            ListItem() {
              TheDayTaskList({
                dateTime: theDayTask.dateTime,
                taskList: theDayTask.taskList
              })
            }
          })

          // 底部留白
          ListItem() {
            Column() {
              Blank().height(100)
            }
          }

        }
        .edgeEffect(EdgeEffect.None)
        .scrollBar(BarState.Off)
        .layoutWeight(1)
        .width('100%')
        .margin({ top: 24 })

      }
      .padding({ left: 24, right: 24 })
    }
    .height('100%')
    .width('100%')
  }
}