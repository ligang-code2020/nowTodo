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
      }
    },
    series: [
      {
        label: {
          show: false
        },
        name: '最高气温',
        color: '#5098fe',
        barStyle: {
          width: 30,
          borderRadius: true
        },
        data: [11, 11, 15, 13, 12, 130, 10]
      }
    ]
  })

  aboutToAppear() {
    this.defOption.setVal({
      series: [
        {
          name: '最高气温',
          data: [110, 110, 150, 130, 102, 130, 210]
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