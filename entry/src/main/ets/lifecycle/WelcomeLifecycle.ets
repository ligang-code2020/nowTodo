import { HMLifecycle, HMLifecycleContext, IHMLifecycle } from '@hadss/hmrouter';

@HMLifecycle({ lifecycleName: 'WelcomeLifecycle', priority: 8 })
export class WelcomeLifecycle implements IHMLifecycle {
  onReady(ctx: HMLifecycleContext): void {
    console.log(`xxWelcome to page ${ctx.navContext?.pathInfo.name}`);
    return;
  }
}