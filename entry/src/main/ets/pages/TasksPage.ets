import { CommonContainer } from '../style/common'
import { SearchBar } from '../component/SearchBar'
import { WeeklyTabs } from '../component/WeeklyTabs'
import { PeriodTaskList } from '../component/PeriodTaskList'
import { FloatTabs } from '../component/FloatTabs'
import dayjs from 'dayjs'
import { HMRouter } from '@hadss/hmrouter'

interface Task {
  taskName: string,
  time: string,
  tag: string[],
  priority: number
}

interface PeriodTask {
  periodTime: string,
  taskList: Task[]
}

const periodList: PeriodTask[] = [
  {
    periodTime: '07:00',
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
    periodTime: '08:00',
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
    periodTime: '09:00',
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



@HMRouter({
  pageUrl: 'TasksPage',
  singleton: true
})
@Component
export struct TasksPage {
  @State private selectedDate: Date = new Date(dayjs().format('YYYY-MM-DD'))
  @State commonContainerStyle: CommonContainer = new CommonContainer()
  @State totalTime: number = 0;

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        // 搜索栏
        SearchBar()
          .margin({ top: 45 })

        Row() {
          Text('任务').fontSize(24).fontWeight(FontWeight.Bold).fontColor('#10275A')
          Row() {
            Image($r('app.media.calendar')).width(14).aspectRatio(1).margin({ right: 5 })
            Text(dayjs(this.selectedDate).format('YYYY年M月'))
              .fontSize(12)
              .fontColor('#525F77')
              .onClick(() => {
                console.info("CalendarDialog.show")
                CalendarPickerDialog.show({
                  selected: this.selectedDate,
                  onAccept: (value) => {
                    console.info("calendar onAccept:" + JSON.stringify(value))
                    console.log("calendar onAccept:1111", dayjs(value).format('YYYY-MM-DD'))
                    this.selectedDate = value
                  },
                  onCancel: () => {
                    console.info("calendar onCancel")
                  },
                  onChange: (value) => {
                    console.info("calendar onChange:" + JSON.stringify(value))
                  }
                })
              })
          }
        }
        .margin({ top: 30 })
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)

        // 周内选择
        WeeklyTabs().margin({ top: 16 })


        Row() {
          Text('今天').fontSize(20).fontWeight(600).fontColor('#10275A')
          if (this.totalTime) {
            Text(`${Math.floor(this.totalTime)}个小时${this.totalTime % 1 * 60}分钟`)
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .fontColor('#10275A')
          }

        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .margin({ top: 24, bottom: 30 })

        if (periodList.length) {
          List({ space: 16 }) {
            ForEach(periodList, (periodTask: PeriodTask, index: number) => {
              ListItem() {
                PeriodTaskList({
                  period: periodTask.periodTime,
                  taskList: periodTask.taskList
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
        } else {
          Column() {
            Image($r('app.media.empty_task_icon'))
              .width(199)
              .height(196)
            Text('当日没有任何任务').fontSize(14).fontColor('#575757').fontWeight(600).margin({ top: 32 })
            Text('种一棵树最好的时间是十年前,其次是现在.')
              .width(225)
              .fontSize(16)
              .fontColor('#272343')
              .fontWeight(700)
              .margin({ top: 15 })
              .textAlign(TextAlign.Center)
              .lineHeight(30)

          }
        }


      }
      .attributeModifier(this.commonContainerStyle)


      // 悬浮 tabs 栏
      FloatTabs().align(Alignment.Bottom)
    }
    .height('100%')
    .width('100%')
  }
}