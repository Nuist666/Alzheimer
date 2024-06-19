import router from '@ohos.router';
@Entry
@Component
struct Registersuccess {
  @State message: string = 'Hello World'
  backclick(){
    router.pushUrl({ url: 'pages/Index' })
 
  }

  build() {
    Column() {
      Column() {
        Image($r('app.media.registersuccess'))
          .width("350vp")
          .height("350vp")
        Text("注册成功！")
          .width("300vp")
          .height("100vp")
          .textAlign(TextAlign.Center)
          .fontSize("50fp")
        Text("点击按钮返回主页面")
          .width("300vp")
          .height("80vp")
          .textAlign(TextAlign.Center)
          .fontSize("20fp")
        Button("返回")
          .width("200vp")
          .height("50vp")
          .fontSize("20fp")
          .onClick(this.backclick.bind(this))
      }      
      .width("100%")
      .height("100%")
      .justifyContent(FlexAlign.Center)
      .backgroundImage($r('app.media.background'))
      .backgroundImageSize(ImageSize.Cover)
      .backgroundImagePosition(Alignment.Center)
    }    
    .width("100%")
    .height("100%")
  }
}