import dayjs from "dayjs";
import weekday from "dayjs/plugin/weekday";
import "dayjs/locale/zh-cn";

// config dayjs
dayjs.extend(weekday);
dayjs.locale('zh-cn')

export  interface WeekDay {
  weekName: string,
  date: number
}

export class TimeTools {
  static getCurrentWeekRange(): WeekDay[] {
    const startOfWeek = dayjs().startOf('week');
    const weekDays: WeekDay[] = [];
    for (let i = 0; i < 7; i++) {
      const date = startOfWeek.add(i, 'day').format('YYYY-MM-DD');
      weekDays.push({
        weekName: TimeTools.convertWeekDayToChinese(dayjs(date).day()),
        date: Number(dayjs(date).format('DD')),
      })

    }
    return weekDays
  }

  static convertWeekDayToChinese(weekDay: number) {
    switch (weekDay) {
      case 1:
        return '一';
      case 2:
        return '二';
      case 3:
        return '三';
      case 4:
        return '四';
      case 5:
        return '五';
      case 6:
        return '六';
      case 0:
        return '日';
      default:
        return '';
    }
  }
}