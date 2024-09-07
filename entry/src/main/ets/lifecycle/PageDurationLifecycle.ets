import { HMLifecycleContext, IHMLifecycle } from '@hadss/hmrouter';

export class PageDurationLifecycle implements IHMLifecycle {
  private timeMap: Map<string, number> = new Map();

  onShown(ctx: HMLifecycleContext): void {
    const pageName = ctx.navContext?.pathInfo.name;
    if (pageName) {
      this.timeMap.set(pageName, new Date().getTime())
    }
  }

  onHidden(ctx: HMLifecycleContext): void {
    const pageName = ctx.navContext?.pathInfo.name
    if (pageName && this.timeMap.has(pageName)) {
      const duration = new Date().getTime() - (this.timeMap.get(pageName) as number);
      this.timeMap.delete(pageName);
      console.log(`xxPage ${pageName} stay ${duration} ms`);
    }
  }
}