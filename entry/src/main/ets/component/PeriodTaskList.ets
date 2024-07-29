import { TaskCard } from '../component/TaskCard'

interface Task {
  taskName: string,
  time: string,
  tag: string[],
  priority: number
}

const Tasks: Task[] = [
  {
    taskName: '吃饭上上上班班班班班班',
    time: '07:00 - 7:15',
    tag: ['必做', '重要'],
    priority: 2
  },
  {
    taskName: '上班',
    time: '07:30 - 07:45',
    tag: ['随意'],
    priority: 1
  },
  {
    taskName: '下班',
    time: '07:59',
    tag: ['必做', '重要'],
    priority: 2
  }
]

@Component
export struct PeriodTaskList {
  build() {
    Column() {
      Line()
        .startPoint([0, 0])
        .endPoint([300, 0])
        .stroke('#E3E8F1')
        .strokeWidth(1)

      Row() {
        Text('07:00')
          .fontColor('#2C406E')
          .fontSize(14)
          .fontWeight(600)
          .margin({ left: 15, top: 24, right: 21 })


        Scroll() {
          Row({ space: 10 }) {
            ForEach(Tasks, (task: Task, index: number) => {
              TaskCard({
                taskName: task.taskName,
                time: task.time,
                tag: task.tag,
                priority: task.priority,
                maxWidth: '70%'
              })
            })
          }
          .margin({ top: 16 })
          .padding({ right: 80 })
        }
        .scrollable(ScrollDirection.Horizontal)
        .scrollBar(BarState.Off)
      }
      .alignItems(VerticalAlign.Top)

    }
  }
}