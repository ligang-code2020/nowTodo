import { TaskCard } from '../component/TaskCard'

interface Task {
  taskName: string,
  time: string,
  tag: string[],
  priority: number
}

enum PriorityColor {
  '#8F99EB' = 1,
  '#E88B8C' = 2
}

const Tasks: Task[] = [
  {
    taskName: '吃饭',
    time: '08:00 - 9:00',
    tag: ['必做', '重要'],
    priority: 2
  },
  {
    taskName: '上班',
    time: '09:00 - 18:00',
    tag: ['随意'],
    priority: 1
  },
  {
    taskName: '下班',
    time: '18:00',
    tag: ['必做', '重要'],
    priority: 2
  }
]

@Component
@Preview
export struct TaskList {
  build() {
    Column({ space: 10 }) {
      ForEach(Tasks, (task: Task, index) => {
        Column() {
          Line()
            .startPoint([0, 35])
            .strokeWidth(2)
            .strokeLineCap(LineCapStyle.Round)
            .stroke(PriorityColor[task.priority])
            .position({ top: 22, left: 15 })
          Image($r('app.media.more'))
            .width(14)
            .aspectRatio(1)
            .position({ top: 22, right: 15 })

          Column() {
            Text(task.taskName).fontColor('#2C406E').fontSize(16).fontWeight(600).height(26)
            Text(task.time).fontSize(14).fontColor('#9AA8C7').height(23)
          }
          .alignItems(HorizontalAlign.Start)
          .margin({ top: 15, left: 25 })

          // tag
          Row() {
            ForEach(task.tag, (tag: string, index) => {
              Column() {
                Text(tag)
                  .height(20)
                  .fontSize(10)
                  .fontWeight(600)
                  .fontColor('#8F99EB')
              }
              .backgroundColor('#338f99eb')
              .borderRadius(3)
              .margin({ right: 6 })
              .padding({
                left: 7,
                right: 7,
                top: 2,
                bottom: 2
              })
            })
          }
          .margin({ top: 15 })
          .padding({ left: 25 })
          .width('100%')
        }
        .padding({ bottom: 15 })
        .justifyContent(FlexAlign.Start)
        .alignItems(HorizontalAlign.Start)
        .width('100%')
        .borderRadius(15)
        .backgroundColor('#F9FAFD')
      })
      Blank().height(100)
    }
  }
}