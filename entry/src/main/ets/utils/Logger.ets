import hilog from '@ohos.hilog';


class LoggerUtil {
  private static DOMAIN: number = 0x0000

  constructor() {
  }

  public info(logTag: string, content: string) {
    hilog.info(LoggerUtil.DOMAIN, logTag, '%{public}s', content)
  }

  public error(logTag: string, content: string | number) {
    hilog.error(LoggerUtil.DOMAIN, logTag, '%{public}s', content)
  }

  public debug(logTag: string, content: string) {
    hilog.debug(LoggerUtil.DOMAIN, logTag, '%{public}s', content)
  }
}


export const Logger: LoggerUtil = new LoggerUtil()