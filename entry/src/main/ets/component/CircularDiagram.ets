@Component
@Preview
export struct CircularDiagram {
  public color1: LinearGradient =
    new LinearGradient([{ color: '#FE3082', offset: 0.75 }, { color: '#E10115', offset: 0.25 }])
  public color2: LinearGradient =
    new LinearGradient([{ color: "#3EDE00", offset: 0.75, }, { color: "#B3FE00", offset: 0.25 }])
  public color3: LinearGradient =
    new LinearGradient([{ color: "#00BEE0", offset: 0.4 }, { color: "#00F3D3", offset: 0.66 }])

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

      DataPanel({ values: [414], max: 620, type: DataPanelType.Circle }) {
      }
      .width(160)
      .aspectRatio(1)
      .trackShadow(null)
      .valueColors([this.color1])
      .strokeWidth(12)
      .trackBackgroundColor('#12e20117')

      DataPanel({ values: [10], max: 20, type: DataPanelType.Circle })
        .width(130)
        .aspectRatio(1)
        .valueColors([this.color2])
        .strokeWidth(12)
        .trackBackgroundColor('#123fde00')

      DataPanel({ values: [4], max: 8, type: DataPanelType.Circle })
        .width(100)
        .aspectRatio(1)
        .valueColors([this.color3])
        .strokeWidth(12)
        .trackBackgroundColor('#1200bde0')
    }

  }
}