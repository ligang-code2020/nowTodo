import { HMRouterMgr } from '@hadss/hmrouter'
import { CustomAnimator } from '../animation/customAnimator'

@Component
export struct FloatTabs {
  @State @Watch('onCurrentIndexUpdate') currentIndex: number = 2

  onCurrentIndexUpdate(changedPropertyName: string) {
    console.log("xxx变化", this.currentIndex)
  }

  build() {
    Column() {
      Row() {
        Row() {
          // 主页
          Column() {
            Column() {
              Image($r("app.media.selected_home"))
              if (this.currentIndex === 1) {
                Circle({ width: 4, height: 4 }).fill('#5B67CA').margin({ top: 3 })
              }
            }
            .width(24)
            .aspectRatio(1)
          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Start)
          .onClick(() => {
            this.currentIndex === 1
            HMRouterMgr.replace({
              pageUrl: 'HomePage'
            })
          })

          // 列表
          Column() {
            Column() {
              Image($r("app.media.list"))
              if (this.currentIndex === 2) {
                Circle({ width: 4, height: 4 }).fill('#5B67CA').margin({ top: 3 })
              }
            }
            .width(24)
            .aspectRatio(1)
            .onClick(() => {
              this.currentIndex = 2
              HMRouterMgr.replace({
                pageUrl: 'TasksPage'
              })
            })

          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Start)
        }
        .layoutWeight(1)
        .height('100%')


        // new task
        Column() {
          Button('+', { type: ButtonType.Circle, stateEffect: false })
            .backgroundColor('#5B67CA')
            .fontSize(28)
            .fontWeight(500)
            .width(50)
            .width('100%')
            .height('100%')
            .onClick(() => {
              HMRouterMgr.push({
                pageUrl: 'AddTaskPage',
                animator: new CustomAnimator()
              })
            })
        }
        .height('100%')


        Row() {
          // 图表
          Column() {
            Column() {
              Image($r("app.media.charts"))
              if (this.currentIndex === 3) {
                Circle({ width: 4, height: 4 }).fill('#5B67CA').margin({ top: 3 })
              }
            }
            .width(24)
            .aspectRatio(1)
            .onClick(() => {
              this.currentIndex = 3
              HMRouterMgr.replace({
                pageUrl: 'GraphicPage'
              })
            })
          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.End)

          // 配置
          Column() {
            Column() {
              Image($r("app.media.profile"))
              if (this.currentIndex === 4) {
                Circle({ width: 4, height: 4 }).fill('#5B67CA').margin({ top: 3 })
              }
            }
            .width(24)
            .aspectRatio(1)
            .onClick(() => {
              this.currentIndex = 4
              HMRouterMgr.replace({
                pageUrl: 'ProfilePage'
              })
            })
          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.End)
        }
        .layoutWeight(1)
        .height('100%')

      }
      .width('100%')
      .height(50)
    }
    .padding({
      left: 20,
      right: 20,
      top: 12,
      bottom: 12
    })
    .backgroundColor('#FFF')
    .height(74)
    .width(316)
    .borderRadius(14)
    .shadow({
      radius: 13,
      color: '#F1F7FF',
      offsetX: -3,
      offsetY: 7
    })
    .border({
      width: 1,
      color: Color.Red
    })
    .margin({ bottom: 10 })

  }
}