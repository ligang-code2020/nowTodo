@Component
@Preview
export struct CircularDiagram {
  public color1: LinearGradient =
    new LinearGradient([{ color: "#65EEC9A3", offset: 0 }, { color: "#FFEF629F", offset: 1 }])
  public color2: LinearGradient =
    new LinearGradient([{ color: "#FF67F9D4", offset: 0 }, { color: "#FFFF9554", offset: 1 }])

  build() {
    Stack() {
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
      .trackShadow(null)
      .valueColors([this.color1])
      .strokeWidth(12)

      DataPanel({ values: [50], max: 100, type: DataPanelType.Circle })
        .width(130)
        .aspectRatio(1)
        .valueColors([this.color2])
        .strokeWidth(12)

      DataPanel({ values: [70], max: 100, type: DataPanelType.Circle })
        .width(100)
        .aspectRatio(1)
        .valueColors([
          '#  5eb7cb'
        ])
        .strokeWidth(12)
    }
  }
}