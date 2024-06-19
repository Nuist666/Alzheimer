import common from '@ohos.app.ability.common'
import wantConstant from '@ohos.ability.wantConstant'
import picker from '@ohos.file.picker'
import router from '@ohos.router';
@Entry
@Component
struct Facerecognition {
  @State uri :string = ''
  @State message: string = '人脸识别验证'
  private context = getContext(this) as common.UIAbilityContext
  backclick(){
    router.pushUrl({ url: 'pages/Mainpage' })
  }

  redraw(){
    this.uri = ''
  }
  build() {
    Column() {
      Column() {
        Text(`${this.message}`)
          .width("100%")
          .height("120vp")
          .margin({ bottom: "20vp" })
          .textAlign(TextAlign.Center)
          .fontSize("50fp")
        Image(this.uri).size({width:"90%",height:200})
        Button('拍照')
          .width("80%")
          .height("50vp")
          .margin({top:'20vp',bottom:'20vp'})
          .onClick(async ()=>{
            let wantObj = {
              deviceId:"",
              action:wantConstant.Action.ACTION_IMAGE_CAPTURE
            }
            let data = await this.context.startAbilityForResult(wantObj)
            console.log(data.want.uri)
            this.uri = data.want.uri
          })
        Button('选择图片')
          .width("80%")
          .height("50vp")
          .margin({top:'20vp',bottom:'20vp'})
          .onClick(async ()=>{
            let phoToSelectOptions = new picker.PhotoSelectOptions()
            phoToSelectOptions.MIMEType = picker.PhotoViewMIMETypes.IMAGE_TYPE
            phoToSelectOptions.maxSelectNumber = 1
            let photoPicker = new picker.PhotoViewPicker()
            let res = await photoPicker.select(phoToSelectOptions)
            console.log(res.photoUris[0])
            this.uri = res.photoUris[0]
            if(this.uri = res.photoUris[0]){
              this.message='验证成功\n即将跳转'
              setTimeout(function() {
                router.pushUrl({ url: 'pages/personnelquery' })
              }, 2000);
            }
          })
        Button('返回')
          .width("80%")
          .height("50vp")
          .margin({top:'20vp',bottom:'20vp'})
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