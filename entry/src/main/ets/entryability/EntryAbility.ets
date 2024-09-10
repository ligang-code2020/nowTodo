import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { httpDefaultSetting } from '../api/axios'
import { HMRouterMgr } from '@hadss/hmrouter';
import { LoginInfo } from '../pages/LoginPage';

export default class EntryAbility extends UIAbility {
  private intervalID: ESObject = null

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    // 初始化 axios 配置
    httpDefaultSetting()

    // 初始路由 HMRouterMgr 框架
    HMRouterMgr.init({
      context: this.context
    })

  }

  onDestroy(): void {
    hilog.info(0x0000, 'c', '%{public}s', 'Ability onDestroy');
    clearInterval(this.intervalID);
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    let windowClass: window.Window = windowStage.getMainWindowSync(); // 获取应用主窗口
    let type = window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR;
    let avoidArea = windowClass.getWindowAvoidArea(type);
    let bottomRectHeight = avoidArea.bottomRect.height; // 获取到导航条区域的高度[px]
    AppStorage.setOrCreate('bottomRectHeight', bottomRectHeight);


    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
      PersistentStorage.persistProp<LoginInfo>('LOGIN_INFO', {})
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
