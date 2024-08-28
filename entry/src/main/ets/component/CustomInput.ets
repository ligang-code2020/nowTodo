@Component
export struct CustomInput {
  @Link text: string
  placeholder: string = ''
  preIcon?: Resource = $r('app.media.password')
  onIconSrc?: Resource = $r('app.media.show')
  offIconSrc?: Resource = $r('app.media.hide')
  inputType: InputType = InputType.Normal
  marginValue: number = 32

  build() {
    Row() {
      Image(this.preIcon).width(24)
      TextInput({ placeholder: this.placeholder, text: $$this.text })
        .border({ width: 0 })
        .borderRadius(0)
        .placeholderColor('#C6CEDD')
        .backgroundColor(Color.White)
        .passwordIcon({ onIconSrc: this.onIconSrc, offIconSrc: this.offIconSrc })
        .type(this.inputType)
    }
    .margin({ top: this.marginValue })
    .width('100%')
    .border({ width: { bottom: 1 }, color: '#E3E8F1' })
  }
}