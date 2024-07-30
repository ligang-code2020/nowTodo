@Component
@Preview
export struct CircularDiagram {
  build() {
    Stack(  ) {
      // Image($r('app.media.hours'))
      //   .width(15)
      //   .aspectRatio(1)
      //   .position({ top: 23, left: '48%' })
      //   .zIndex(1)
      //
      // Image($r('app.media.hours'))
      //   .width(15)
      //   .aspectRatio(1)
      //   .position({ top: 51, left: '48%' })
      //   .fillColor(Color.Black)
      //   .zIndex(1)

      DataPanel({ values: [75], max: 100, type: DataPanelType.Circle }) {
      }
      .width(160)
      .aspectRatio(1)
      .valueColors(['#00FF00'])
      .strokeWidth(12)

      DataPanel({ values: [50], max: 100, type: DataPanelType.Circle })
        .width(130)
        .aspectRatio(1)
        .valueColors([
          '#20FF0000'
        ])
        .strokeWidth(12)

      DataPanel({ values: [70], max: 100, type: DataPanelType.Circle })
        .width(100)
        .aspectRatio(1)
        .valueColors([
          '#08182431'
        ])
        .strokeWidth(12)
    }
  }
}