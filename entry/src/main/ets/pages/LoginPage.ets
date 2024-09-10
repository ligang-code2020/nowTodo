import { HMDefaultGlobalAnimator, HMPopInfo, HMRouter, HMRouterMgr } from '@hadss/hmrouter'
import { CustomInput } from '../component/CustomInput'
import { promptAction } from '@kit.ArkUI'
import { LoginApi } from '../api/login'
import { ErrorResponse } from '../types/ErrorResponse'
import { Logger } from '../utils/Logger'
import { constants } from '../common/constants/constants'
import { CustomAnimator } from '../animation/customAnimator'


export interface LoginInfo {
  userName?: string
  accessToken?: string
  refreshToken?: string
}

@HMRouter({ pageUrl: 'LoginPage', singleton: true })
@Component
export struct LoginPage {
  // 用户信息持久化
  @StorageLink('LOGIN_INFO') loginInfo: LoginInfo = {}
  @StorageLink('ACCESS_TOKEN') accessToken: string = ''
  @StorageLink('REFRESH_TOKEN') refreshToken: string = ''
  @State username: string = ''
  @State password: string = ''
  @State isLoading: Boolean = false;
  @State timerId: number = 100

  aboutToAppear(): void {
  }

  async waitLoading(): Promise<void> {
    return new Promise((resolve, reject) => {
      this.timerId = setTimeout(() => {
        this.isLoading = false;
        resolve();
      }, 1500);
    });
  }

  build() {
    Stack() {
      if (this.isLoading) {
        Column() {
          LoadingProgress()
            .color('#409eff')
            .width(80).height(80)
          Text('正在验证登录')
            .fontSize(16)
            .fontColor('#409eff')
            .margin({ bottom: 140 })
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .zIndex(10)
        .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
      }


      Column() {
        Text('登录')
          .fontSize(36)
          .fontWeight(700)
          .fontColor('#5B67CA')
          .margin({ top: 100 })
          .width('100%')

        CustomInput({
          text: this.username,
          placeholder: '请输入邮箱或者用户名',
          preIcon: $r('app.media.email'),
          inputType: InputType.Normal
        })
        CustomInput({
          text: this.password,
          placeholder: '请输入密码',
          preIcon: $r('app.media.password'),
          onIconSrc: $r('app.media.show'),
          offIconSrc: $r('app.media.hide'),
          inputType: InputType.Password
        })

        Row() {
          Text('忘记密码？').fontSize(12).fontColor('#5B67CA')
        }
        .width('100%')
        .justifyContent(FlexAlign.End)
        .margin({ top: 16 })

        Button('确定', { type: ButtonType.Normal })
          .backgroundColor('#5B67CA')
          .fontSize(16)
          .fontWeight(700)
          .borderRadius(14)
          .width(304)
          .height(52)
          .margin({ top: 55 })
          .onClick(() => {
            this.isLoading = true
            LoginApi.login({
              username: this.username,
              password: this.password
            }).then(async res => {
              Logger.info(constants.DEVELOP_TAG, "登录res" + JSON.stringify(res));
              // 缓存token
              this.loginInfo = {
                userName: this.username,
                accessToken: res.data.access_token,
                refreshToken: res.data.refresh_token
              }
              this.accessToken = res.data.access_token;
              this.refreshToken = res.data.refresh_token;
              await this.waitLoading()
              clearTimeout(this.timerId)
              HMRouterMgr.replace({
                pageUrl: 'HomePage',
                animator: new CustomAnimator()
              })

            }).catch(async (e: ErrorResponse) => {
              await this.waitLoading()
              clearTimeout(this.timerId)
              console.log("xxloginError", JSON.stringify(e))
              promptAction.showToast({
                duration: 3000,
                message: e.message,
                alignment: Alignment.Top,
                offset: {
                  dx: '50%',
                  dy: 80
                }
              })
            })
          })

        Row() {
          Row()
            .height(1)
            .backgroundColor('#E3E8F1')
            .layoutWeight(1)
          Text('其他方式登录').fontSize(12).fontColor('#C6CEDD').margin({ left: 15, right: 15 })
          Row()
            .height(1)
            .backgroundColor('#E3E8F1')
            .layoutWeight(1)
        }
        .width('100%')
        .margin({ top: 64 })
        .justifyContent(FlexAlign.SpaceAround)


        Row() {
          Row() {
            Image($r('app.media.wechat')).width(24)
          }
          .width(42)
          .aspectRatio(1)
          .border({ width: 0.78 })
          .borderRadius(50)
          .borderColor('#E3E8F1')
          .justifyContent(FlexAlign.Center)

          Row() {
            Image($r('app.media.phone')).width(24)
          }
          .width(42)
          .aspectRatio(1)
          .border({ width: 0.78 })
          .borderRadius(50)
          .borderColor('#E3E8F1')
          .justifyContent(FlexAlign.Center)
        }
        .width(100)
        .justifyContent(FlexAlign.SpaceBetween)
        .margin({ top: 30, bottom: 10 })

        Blank()

        Text() {
          Span('没有账户？')
          Span('注册').fontWeight(700).onClick(() => {
            HMRouterMgr.push({
              pageUrl: 'SignUpPage'
            })
          })
        }
        .fontColor('#2C406E')
        .fontSize(14)
        .margin({ bottom: 44 })

      }
      .width('100%')
      .height('100%')
      .padding({ left: 35, right: 35 })
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')

  }
}

@Builder
export function LoginBuilder(): void {
  LoginPage();
}