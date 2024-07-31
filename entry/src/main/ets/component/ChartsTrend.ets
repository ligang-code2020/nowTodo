import { LineChartComponent } from '../component/MPChart'

@Component
@Preview
struct ChartsTrend {
  build() {
    Column() {
      LineChartComponent()
    }
  }
}