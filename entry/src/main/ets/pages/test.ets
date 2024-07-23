@Component
@Entry
struct Test {
  build() {
    Column() {

    }
    .width(140)
    .height(73)
    // .border({ width: 2, color: Color.Red })
    .margin({
      left: 100,
      top: 100
    })
    .backgroundColor('#E77D7D')
    // .shadow({
    //   color: '#E77D7D',
    //   radius: 27,
    //   fill: true,
    //   type: ShadowType.COLOR
    //   // offsetX: 20,
    //   // offsetY: 15
    // })
    .backdropBlur(30)
  }
}