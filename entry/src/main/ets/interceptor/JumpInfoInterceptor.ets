import { HMInterceptorAction, HMInterceptorInfo, IHMInterceptor } from '@hadss/hmrouter';
import { HMActionType } from '@hadss/hmrouter';

export class JumpInfoInterceptor implements IHMInterceptor {
  handle(info: HMInterceptorInfo): HMInterceptorAction {
    let connectionInfo: string = '';
    if (info.type === HMActionType.PUSH) {
      connectionInfo = 'jump to';
    } else {
      connectionInfo = 'back to';
    }

    console.log(`xx${info.srcName} ${connectionInfo} ${info.targetName}`)
    return HMInterceptorAction.DO_NEXT;
  }
}