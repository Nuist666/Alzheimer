import router from '@ohos.router';
@Entry
@Component
struct Mainpage {
  exitclick(){
    router.pushUrl({ url: 'pages/Index' })
  }
  videoclick(){
    router.pushUrl({ url: 'pages/SimpleVideoIndex' })
  }
  cdrclick(){
    router.pushUrl({ url: 'pages/cdrpage' })
  }
  mocaclick(){
    router.pushUrl({ url: 'pages/mocapage' })
  }
  cmmseclick(){
    router.pushUrl({ url: 'pages/cmmsepage' })
  }
  personalqueryclick(){
    router.pushUrl({ url: 'pages/fingerprint' })
  }
  developerclick(){
    router.pushUrl({ url: 'pages/Developeroptions' })
  }
  
  build() {
    Column() {
      Column() {
        Text("主菜单")
          .width("200vp")
          .height("60vp")
          .offset({ x: "0", y: "-60vp" })
          .textAlign(TextAlign.Center)
          .fontSize("50fp")
        Swiper(){
          Image($r("app.media.mainpage1"))
            .width("300vp")
            .height("200vp")
          Image($r("app.media.mainpage2"))
            .width("300vp")
            .height("200vp")
          Image($r("app.media.mainpage3"))
            .width("300vp")
            .height("200vp")
          Image($r("app.media.mainpage4"))
            .width("300vp")
            .height("200vp")
        }
        .width('90%')
        .borderRadius(30)
        .autoPlay(true)
        .interval(1000)
        .margin({bottom:20})
        .offset({ x: "0", y: "-50vp" })
        Button("视频点播")
          .width("300vp")
          .height("50vp")
          .fontSize("20fp")
          .onClick(this.videoclick.bind(this))
          .offset({ x: "0", y: "-30vp" })
        Button("CDR临床痴呆评定")
          .width("300vp")
          .height("50vp")
          .fontSize("20fp")
          .onClick(this.cdrclick.bind(this))
          .offset({ x: "0", y: "-20vp" })
        Button("MoCA蒙特利尔认知评估")
          .width("300vp")
          .height("50vp")
          .offset({ x: "0", y: "-10vp" })
          .fontSize("20fp")
          .onClick(this.mocaclick.bind(this))
        Button("CMMSE简易智能状态检查")
          .width("300vp")
          .height("50vp")
          .offset({ x: "0", y: "0" })
          .fontSize("20fp")
          .onClick(this.cmmseclick.bind(this))
        Button("人员得分数据管理")
          .width("300vp")
          .height("50vp")
          .offset({ x: "0", y: "10vp" })
          .fontSize("20fp")
          .onClick(this.personalqueryclick.bind(this))
        Button("开发人员选项")
          .width("300vp")
          .height("50vp")
          .offset({ x: "0", y: "20vp" })
          .fontSize("20fp")
          .onClick(this.developerclick.bind(this))
        Button("退出")
          .width("300vp")
          .height("50vp")
          .offset({ x: "0", y: "30vp" })
          .fontSize("20fp")
          .onClick(this.exitclick.bind(this))
      }      
      .width("100%")
      .height("100%")
      .backgroundImageSize(ImageSize.Auto)
      .justifyContent(FlexAlign.Center)
    }    
    .width("100%")
    .height("100%")
    .backgroundImage($r('app.media.background'))
    .backgroundImageSize(ImageSize.Cover)
    .backgroundImagePosition(Alignment.Center)
  }
}