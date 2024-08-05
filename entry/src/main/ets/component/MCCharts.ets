import { McBarChart, Options, chartInterface } from '@mcui/mccharts'

@Entry
@Component
export struct MCCharts {
  @State defOption: Options = new Options({
    legend: {
      show: false
    },
    xAxis: {
      axisTick: {
        show: false
      },
      data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
    },
    yAxis: {
      axisLine: {
        show: false
      },
      axisTick: {
        // 刻度线配置
        show: false, // 是否显示
        // interval: 3, // 与文本的间隔
        length: 2 // 刻度的长度
      }
    },
    series: [
      {
        label: {
          color: 'transparent',
          show: false
        },
        name: '时长统计',
        color: '#5098fe',
        barStyle: {
          width: 35,
          borderRadius: true
        },
        data: [4.5, 5.5, 6, 7, 7.5, 8, 8.2]
      }
    ]
  })

  aboutToAppear() {
    this.defOption.setVal({
      series: [
        {
          name: '时长统计',
          data: [4.5, 5.5, 6, 7, 4, 8, 8.2]
        }
      ]
    })
  }

  build() {
    Row() {
      McBarChart({
        options: this.defOption
      })
    }
    .height('50%')
  }
}