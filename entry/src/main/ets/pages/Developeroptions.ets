import router from '@ohos.router';
@Entry
@Component
struct Developeroptions {
  recorder(){
    router.pushUrl({ url: 'pages/Recordertest' })
  }
  camera(){
    router.pushUrl({ url: 'pages/cameratest' })
  }
  fingerprint(){
    router.pushUrl({ url: 'pages/fingerprint' })
  }
  face(){
    router.pushUrl({ url: 'pages/facerecognition' })
  }
  backclick(){
    router.pushUrl({ url: 'pages/Mainpage' })
  }

  build() {
    Column() {
      Column() {
        Text("开发人员选项")
          .width("100%")
          .height("60vp")
          .textAlign(TextAlign.Center)
          .fontSize("50fp")
        Button("录音机测试")
          .width("200vp")
          .height("60vp")
          .margin({ top: "50vp", bottom: "0vp" })
          .fontSize("20fp")
          .onClick(this.recorder.bind(this))
        Button("照相机测试")
          .width("200vp")
          .height("60vp")
          .margin({ top: "50vp" })
          .fontSize("20fp")
          .onClick(this.camera.bind(this))
        Button("指纹识别")
          .width("200vp")
          .height("60vp")
          .margin({ top: "50vp" })
          .fontSize("20fp")
          .onClick(this.fingerprint.bind(this))
        Button("人脸识别")
          .width("200vp")
          .height("60vp")
          .margin({ top: "50vp" })
          .fontSize("20fp")
          .onClick(this.face.bind(this))
        Button("返回")
          .width("200vp")
          .height("60vp")
          .margin({ top: "50vp" })
          .onClick(this.backclick.bind(this))
      }      
      .width("100%")
      .height("100%")
      .backgroundImage($r('app.media.background'))
      .backgroundImageSize(ImageSize.Cover)
      .backgroundImagePosition(Alignment.Center)
      .justifyContent(FlexAlign.Center)
    }    
    .width("100%")
    .height("100%")
  }
}