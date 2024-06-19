
import router from '@ohos.router';
@Component
export default struct TitleBar {
  backclick(){
    router.pushUrl({ url: 'pages/Mainpage' })

  }
  build() {
    Row() {
      Button("返回")
        .width("90vp")
        .height("50vp")
        .margin({right:'20vp'})
        .onClick(this.backclick.bind(this))
      Text('人员得分数据管理')
        .fontColor(Color.White)
        .fontSize(28)

    }
    .width('100%')
    .height('8%')
    .constraintSize({ minHeight: 70 })
    .padding({ left: 10, right: 10 })
    .backgroundColor('#fffab40a')
  }
}