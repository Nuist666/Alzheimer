import common from '@ohos.app.ability.common'
import wantConstant from '@ohos.ability.wantConstant'
import picker from '@ohos.file.picker'
import router from '@ohos.router';
@Component
@Entry
struct Index {
  @State uri :string = ''
  private context = getContext(this) as common.UIAbilityContext
  backclick(){
    router.pushUrl({ url: 'pages/Developeroptions' })
  }

  build(){
    Row(){
      Column(){
        Text('相机功能测试')
          .width("100%")
          .height("60vp")
          .margin({top:'40%'})
          .textAlign(TextAlign.Center)
          .fontSize("50fp")
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
          })
        Button('返回')
          .width("80%")
          .height("50vp")
          .onClick(this.backclick.bind(this))
          .margin({top:'20vp',bottom:'20vp'})

        Image(this.uri).size({width:300})
      }
      .width("100%")
    }
    .height("100%")
  }
}
