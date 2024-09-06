import { HMLifecycle, IHMLifecycle, HMLifecycleContext } from '@hadss/hmrouter';

@HMLifecycle({ lifecycleName: 'ExitAppLifecycle' })
export class ExitAppLifecycle implements IHMLifecycle {
  lastTime: number = 0;

  onBackPressed(ctx: HMLifecycleContext): boolean {
    console.log("xxx退出页面")
    let time = new Date().getTime();
    if (time - this.lastTime > 1000) {
      this.lastTime = time;
      ctx.uiContext.getPromptAction().showToast({
        message: '再次返回退出应用',
        duration: 1000,
      });
      return true;
    } else {
      return false
    }
  }
}