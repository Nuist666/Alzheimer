import router from '@ohos.router';

@Entry
@Component
struct Index {
  loginclick(){
    router.pushUrl({ url: 'pages/Login' })
  }
  registerclick(){
    router.pushUrl({ url: 'pages/Register' })
  }

  build() {
    Column() {
      Column() {
        Text("欢迎使用\n阿尔茨海默\n测试平台")
          .width("300vp")
          .height("200vp")
          .textAlign(TextAlign.Center)
          .fontSize("40fp")
        Image($r('app.media.NUIST'))
          .width("300vp")
          .height("300vp")
        Button("登录")
          .width("200vp")
          .height("50vp")
          .offset({ x: "0", y: "30vp" })
          .fontSize("20fp")
          .onClick(this.loginclick.bind(this))
        Button("注册")
          .width("200vp")
          .height("50vp")
          .offset({ x: "0", y: "60vp" })
          .fontSize("20fp")
          .onClick(this.registerclick.bind(this))
      }      
      .width("100%")
      .height("100%")
      .justifyContent(FlexAlign.Center)
    }    
    .width("100%")
    .height("100%")
    .backgroundImage($r('app.media.background'))
    .backgroundImageSize(ImageSize.Cover)
    .backgroundImagePosition(Alignment.Center)
  }
}