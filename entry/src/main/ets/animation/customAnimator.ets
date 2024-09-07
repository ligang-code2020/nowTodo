import { HMAnimator, HMAnimatorHandle, IHMAnimator, OpacityOption,
  ScaleOption,
  TranslateOption } from '@hadss/hmrouter';

@HMAnimator({ animatorName: 'CustomAnimator' })
export class CustomAnimator implements IHMAnimator {
  effect(enterHandle: HMAnimatorHandle, exitHandle: HMAnimatorHandle): void {
    // 入场动画
    enterHandle.start((translateOption: TranslateOption, scaleOption: ScaleOption,
      opacityOption: OpacityOption) => {
      translateOption.y = '100%'
      scaleOption.x = 0.7;
      opacityOption.opacity = 0.3;
    })
    enterHandle.finish((translateOption: TranslateOption, scaleOption: ScaleOption,
      opacityOption: OpacityOption) => {
      translateOption.y = '0'
      scaleOption.x = 1;
      opacityOption.opacity = 1;
    })
    enterHandle.duration = 400;
    enterHandle.curve = Curve.Linear;

    // 出场动画
    exitHandle.start((translateOption: TranslateOption, scaleOption: ScaleOption,
      opacityOption: OpacityOption) => {
      translateOption.y = '0'
      scaleOption.x = 1;
      opacityOption.opacity = 1;
    })
    exitHandle.finish((translateOption: TranslateOption, scaleOption: ScaleOption,
      opacityOption: OpacityOption) => {
      translateOption.y = '100%'
      scaleOption.x = 0.7;
      opacityOption.opacity = 0.3;
    })
    exitHandle.duration = 400;
    enterHandle.curve = Curve.Linear;
  }
}