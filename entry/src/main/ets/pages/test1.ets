// xxx.ets
@Entry
@Component
struct SheetTransitionExample {
  @State isShow: boolean = false
  @State sheetHeight: number = 250;

  @Builder
  myBuilder() {
    Column() {

    }
    .width('100%')
    .height('100%')
  }

  build() {
    Column() {
      Button("transition modal 1")
        .onClick(() => {
          this.isShow = true
        })
        .fontSize(20)
        .margin(10)
        .bindSheet($$this.isShow, this.myBuilder(), {
          preferType: SheetType.POPUP,
          height: this.sheetHeight,
          backgroundColor: Color.White,
          onWillAppear: () => {
            console.log("BindSheet onWillAppear.")
          },
          onAppear: () => {
            console.log("BindSheet onAppear.")
          },
          onWillDisappear: () => {
            console.log("BindSheet onWillDisappear.")
          },
          onDisappear: () => {
            console.log("BindSheet onDisappear.")
          }
        })
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}