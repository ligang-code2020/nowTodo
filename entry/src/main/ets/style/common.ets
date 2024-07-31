export class CommonContainer implements AttributeModifier<ColumnAttribute> {
  constructor() {
  }

  applyNormalAttribute(instance: ColumnAttribute) {
    instance.width('100%')
    instance.height('100%')
    instance.justifyContent(FlexAlign.Start)
    instance.padding({ left: 24, right: 24 })
    instance.margin({ top: 45 })
  }
}