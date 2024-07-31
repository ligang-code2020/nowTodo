import { McBarChart, Options } from '@mcui/mccharts'

@Entry
@Component
struct Index {
  @State defOption: Options = new Options({
    xAxis: {
      data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
    },
    yAxis: {
      name: '温度'
    },
    series: [
      {
        name: '最高气温',
        barStyle: {
          width: 40,
          borderRadius: true
        },
        data: [11, 11, 15, 13, 12, 130, 10]
      }
    ]
  })

  aboutToAppear() {
    setTimeout(() => {
      // 使用Option实例对象的setVal方法来实现，修改什么属性就传什么
      this.defOption.setVal({
        series: [
          {
            name: '最高气温',
            data: [110, 110, 150, 130, 102, 130, 210]
          }
        ]
      })
    }, 2000)
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