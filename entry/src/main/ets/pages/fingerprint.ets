import router from '@ohos.router'
@Entry
@Component
struct Fingerprint {
  @State message: string = '验证指纹'

  backclick(){
    router.back()
  }
  faceclick(){
    router.pushUrl({ url: 'pages/facerecognition' })
  }


  build() {
    Column() {
      Column() {
        Text(`${this.message}`)
          .width("300vp")
          .height("150vp")
          .textAlign(TextAlign.Center)
          .fontSize("50fp")
          .fontWeight(FontWeight.Bold)
        Image($r('app.media.fingerprint'))
          .width("200vp")
          .height("200vp")
          .opacity(1)
          .margin({top:"40vp",bottom:"50vp"})
          .onTouch((event: TouchEvent) => {
            if (event.type === TouchType.Down) {
              this.message = '验证中...';
            }
            if (event.type === TouchType.Up) {
              this.message = '验证成功！\n即将跳转...';
              setTimeout(function(){
                router.pushUrl({ url: 'pages/personnelquery' })
              }, 2000);
            }
            if (event.type === TouchType.Move) {
              this.message = '请勿移动';
            }
          })
        Button("使用人脸识别验证")
          .width("80%")
          .height("50vp")
          .onClick(this.faceclick.bind(this))
          .margin({top:"20vp",bottom:"20vp"})
        Button("返回")
          .width("80%")
          .height("50vp")
          .onClick(this.backclick.bind(this))
      }      
      .width("100%")
      .height("100%")
      .justifyContent(FlexAlign.Center)
    }    
    .width("100%")
    .height("100%")
  }
}