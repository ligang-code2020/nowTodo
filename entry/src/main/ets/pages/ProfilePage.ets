import { CommonContainer } from '../style/common'
import { FloatTabs } from '../component/FloatTabs'
import { ProfileBlock } from '../component/ProfileBlock'
import { HMRouter, HMRouterMgr } from '@hadss/hmrouter'
import { removeAccessToken, removeRefreshToken } from '../api/token'

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


@CustomDialog
struct Logout {
  controller?: CustomDialogController

  build() {
    Column() {
      Text('退出')
        .height(36)
        .fontColor('#10275A')
        .fontSize(22)
        .fontWeight(700)
        .margin({ top: 25 })
      Text('您确定要退出这个账户吗？')
        .width(225)
        .fontSize(18)
        .fontColor('#10275A')
        .fontWeight(500)
        .margin({ top: 16 })
        .textAlign(TextAlign.Center)
        .height(58)
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
            this.controller?.close()
            // 移除 token，跳转登录页
            removeAccessToken()
            removeRefreshToken()
            HMRouterMgr.replace({
              pageUrl: 'LoginPage',
              skipAllInterceptor: true
            })
          })
      }
      .margin({ top: 24, bottom: 25 })
    }
  }
}

@CustomDialog
struct CreateBoard {
  controller?: CustomDialogController
  @State boardName: string = ''

  build() {
    Column() {
      Text('创建面板')
        .height(36)
        .fontColor('#10275A')
        .fontSize(22)
        .fontWeight(700)
        .margin({ top: 25 })

      Column() {
        Text('面板名称')
          .fontSize(14)
          .fontWeight(600)
          .fontColor('#10275A')
          .margin({ top: 16 })
          .height(23)
          .width('100%')

        TextInput({ placeholder: '请输入面板名称', text: this.boardName })
          .placeholderFont({ size: 18, weight: FontWeight.Bold })
          .borderRadius(10)
          .placeholderColor('#10275A')
          .backgroundColor('#F6F6F6')
          .type(InputType.Normal)
          .width(281)
          .margin({ top: 16, bottom: 25 })

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
        .margin({ top: 24, bottom: 25 })

      }
      .padding({ left: 25, right: 30 })

    }
    .width('100%')
  }
}


@HMRouter({
  pageUrl: 'ProfilePage',
  animator: 'CustomAnimator',
  singleton: true
})
@Component
export struct ProfilePage {
  @State commonContainerStyle: CommonContainer = new CommonContainer()
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: Logout(),
    alignment: DialogAlignment.Center,
    customStyle: false,
    cornerRadius: 20,
  })
  dialogController1: CustomDialogController | null = new CustomDialogController({
    builder: CreateBoard(),
    alignment: DialogAlignment.Center,
    customStyle: false,
    cornerRadius: 20,
  })
  private fileDir = getContext().filesDir + "/" + 'computer.svg'

  aboutToAppear(): void {
    console.log("xxxxxx1211rawfile", this.fileDir)
  }

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: $r("app.media.setting"), content: "设置" })
      MenuItem({ startIcon: $r("app.media.logout"), content: "退出" })
        .onClick(() => {
          if (this.dialogController != null) {
            this.dialogController.open()
          }
        })
    }
    .width(144)
    .radius(10)
  }

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
        .bindMenu(this.MyMenu())

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
                }).onClick(() => {
                  if (this.dialogController1 != null && profileBlock.title === '创建面板') {
                    this.dialogController1.open()
                  }
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