import { TaskCard } from '../component/TaskCard'

interface Task {
  taskName: string,
  time: string,
  tag: string[],
  priority: number
}

const Tasks: Task[] = [
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
  },
  {
    taskName: '下班3ssd',
    time: '07:59',
    tag: ['必做', '重要'],
    priority: 2
  }
]

@Component
export struct TheDayTaskList {
  taskList: Task[] = []

  build() {
    Column() {
      Text('2024/05/01')
        .fontColor('#525F77')
        .fontSize(14)
        .fontWeight(500)
        .height(23)
      TaskCard()
      Scroll() {
        Row({ space: 10 }) {
          ForEach(this.taskList, (task: Task, index: number) => {
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
    }
  }
}