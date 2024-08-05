import { CommonContainer } from '../style/common'
import { FloatTabs } from '../component/FloatTabs'
import { ProfileBlock } from '../component/ProfileBlock'

interface Profile {
  backgroundColorValue: ResourceColor,
  iconBackgroundColor: ResourceColor,
  title: string,
  taskCount?: number,
  icon: ResourceStr
}

const profileList: Profile[] = [
  {
    backgroundColorValue: '#40858fe9',
    iconBackgroundColor: '#858FE9',
    title: '个人',
    taskCount: 6,
    icon: $r('app.media.personal')
  },
  {
    backgroundColorValue: '#407fc9e7',
    iconBackgroundColor: '#7FC9E7',
    title: '工作',
    taskCount: 8,
    icon: $r('app.media.work')
  },
  {
    backgroundColorValue: '#40ffe4e4',
    iconBackgroundColor: '#E77D7D',
    title: '学习',
    taskCount: 6,
    icon: $r('app.media.study')
  },
  {
    backgroundColorValue: '#40cbf9d8',
    iconBackgroundColor: '#81E89E',
    title: '旅游',
    taskCount: 1,
    icon: $r('app.media.travel')
  },
  {
    backgroundColorValue: '#FFEFEB',
    iconBackgroundColor: '#F0A58E',
    title: '创建面板',
    icon: $r('app.media.add')
  }
]


@Entry
@Component
struct ProfilePage {
  @State commonContainerStyle: CommonContainer = new CommonContainer()

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        Column() {
          Image($r('app.media.notice')).width(24).aspectRatio(1)
        }
        .width(48)
        .height(48)
        .position({
          top: 35,
          right: 1
        })
        .justifyContent(FlexAlign.Center)
        .borderRadius(14)
        .shadow({
          radius: 13,
          offsetX: -3,
          offsetY: 7,
          color: '#F1F7FF'
        })

        // 头像
        Column() {
          Image($r('app.media.userIcon'))
        }
        .width(86)
        .height(86)
        .shadow({
          offsetX: -3,
          offsetY: 7,
          radius: 13,
          color: '#F1F7FF'
        })
        .borderRadius(50)
        .margin({ top: 70 })

        Text('橘猫不加糖 🐱')
          .height(32)
          .fontColor('#10275A')
          .fontSize(20)
          .fontWeight(700)
          .margin({ top: 20 })
        Text('askjhx@163.com')
          .height(17)
          .fontColor('#10275A')
          .fontSize(14)
          .fontWeight(500)
          .margin({ top: 5 })

        // 配置列表
        Column() {
          Grid() {
            ForEach(profileList, (profileBlock: Profile, index: number) => {
              GridItem() {
                ProfileBlock({
                  backgroundColorValue: profileBlock.backgroundColorValue,
                  iconBackgroundColor: profileBlock.iconBackgroundColor,
                  title: profileBlock.title,
                  taskCount: profileBlock.taskCount,
                  icon: profileBlock.icon
                })
              }
            })
          }
          .friction(0.6)
          .edgeEffect(EdgeEffect.Spring)
          .rowsGap(10)
          .margin({ top: 31 })
          .width('100%')
          .height(400)
          .columnsTemplate('1fr 1fr')
          .scrollBar(BarState.Off)

          Blank().height(220)
        }
      }
      .height('100%')
      .attributeModifier(this.commonContainerStyle)


      // 悬浮 tabs 栏
      FloatTabs().align(Alignment.Bottom)
    }
    .height('100%')
    .width('100%')
  }
}