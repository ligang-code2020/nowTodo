import { BusinessError } from '@kit.BasicServicesKit';
import { HMRouter, HMRouterMgr, HMPageParam, HMParamType } from '@hadss/hmrouter'
import { inputMethod } from '@kit.IMEKit';


@Extend(Text)
function verifyCodeUnitStyle() {
  .fontSize('16fp')
  .fontWeight(FontWeight.Bold)
  .textAlign(TextAlign.Center)
  .width('50vp')
  .aspectRatio(1)
  .margin({
    left: '5vp',
    right: '5vp'
  })
  .borderRadius('10vp')
}

@HMRouter({ pageUrl: 'PhoneCodePage', singleton: true })
@Component
export struct PhoneCodePage {
  @State codeText: string = '';
  @State phoneCode: string = HMRouterMgr.getCurrentParam() as string;
  private inputController: inputMethod.InputMethodController = inputMethod.getController();
  private arrArea: number[] = [0.0, 1, 0];
  private verifyCodeLength: number = 6;
  private codeIndexArray: Array<number> = Array.from([0, 1, 2, 3, 4, 5]);
  private textConfig: inputMethod.TextConfig = {
    inputAttribute: {
      textInputType: inputMethod.TextInputType.NUMBER,
      enterKeyType: inputMethod.EnterKeyType.GO
    }
  };

  aboutToDisappear(): void {
    this.detach();
  }

  async attach() {
    await this.inputController.attach(true, this.textConfig);
  }

  listen() {
    this.inputController.on('insertText', (text: string) => {
      console.log("xxinsertText", text)
      if (this.codeText.length >= this.verifyCodeLength || isNaN(Number(text)) || text === ' ') {
        console.log("xx输入后完成", this.codeText)
        // 验证 code，验证通过去主页
        if (this.codeText === this.phoneCode) {

        }
        return;
      }
      this.codeText += text;
    })
    this.inputController.on('deleteLeft', () => {
      this.codeText = this.codeText.substring(0, this.codeText.length - 1);
    })
  }

  detach(): void {
    this.inputController.off('insertText');
    this.inputController.off('deleteLeft');
    this.inputController.detach((_err: BusinessError) => {
    });
  }

  @Builder
  buildVerifyCodeComponent() {
    Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
      ForEach(this.codeIndexArray, (item: number) => {
        Text(this.codeText[item])
          .verifyCodeUnitStyle()
          .backgroundColor(this.codeText[item] === undefined ? '#FFF1F3F5' : '#330a59f7')
      }, (item: number) => JSON.stringify(item))
    }
    .onVisibleAreaChange(this.arrArea, async (isVisible: boolean, currentRatio: number) => {
      if (isVisible && currentRatio >= 1.0) {
        await this.attach();
        this.listen();
      }
      if (!isVisible && currentRatio <= 0.0) {
        this.detach();
      }
    })
    .backgroundColor(Color.Transparent)
    .height('50vp')
    .margin({
      left: '19vp',
      right: '19vp'
    })
    .defaultFocus(true)
    .onClick(() => {
      this.attach();
    })
  }

  build() {
    Column() {
      Row() {
        Text('请输入验证码')
          .fontSize('24fp')
          .fontWeight(FontWeight.Medium)
      }
      .height('32vp')

      Row() {
        Text('验证码已发送至')
          .fontSize('14fp')
          .fontColor('#6e6e6e')
          .fontWeight(FontWeight.Regular)
        Text('+86 186******70')
          .fontSize('14fp')
          .fontColor('#0a59f7')
          .fontWeight(FontWeight.Regular)
      }
      .margin({
        top: '30vp',
        bottom: '30vp'
      })

      this.buildVerifyCodeComponent()

      Row() {
        Text('重新获取')
          .fontSize('16fp')
          .fontWeight(FontWeight.Medium)
          .fontColor('#0a59f7')
      }
      .width('90%')
      .margin({ top: '20vp' })
      .justifyContent(FlexAlign.End)
    }
    .padding({ top: 80 })
    .height('100%')
    .width('100%')
  }
}

