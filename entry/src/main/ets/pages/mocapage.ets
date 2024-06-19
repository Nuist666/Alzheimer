import router from '@ohos.router';

@Entry
@Component
struct mocapage {

  build() {
    Column() {
      Column() {
        Navigation() {
          Row() {
            Swiper() {
              Image($r("app.media.image1"))
              Image($r("app.media.image2"))
                .width("100%")
                .height("100%")

            }
            .autoPlay(true)
            .width("100%")
            .height("100%")
            .offset({ x: "0vp", y: "-0.46vp" })
          }
          .width("360vp")
          .height("206.37vp")
          Row() {
            Text("蒙特利尔认知评估量表(MoCA)是由Nasreddine教授于2004年研究编制，用于针对轻度认知障碍(Mild Cognitive Impairment, MCI)进行快速筛查的评估工具")
              .width("360vp")
              .height("106.28vp")
              .offset({ x: "0vp", y: "48.85vp" })
              .fontSize("16fp")
              .fontStyle(FontStyle.Italic)
              .fontWeight(FontWeight.Bolder)
            Text("MoCA")
              .width("200vp")
              .height("48.93vp")
              .align(Alignment.Center)
              .offset({ x: "-360vp", y: "-28.47vp" })
              .fontColor(Color.Blue)
              .fontSize("38fp")
          }
          .width("360vp")
          .height("187.25vp")
          Button("开始测试")
            .width("180vp")
            .height("80vp")
            .offset({ x: "0vp", y: "130vp" })
            .fontSize("29fp")
            .onClick( () =>{
              //路由跳转
              router.pushUrl({
                //跳转页面的路径
                url:'pages/mocapage2'

              })
            })
        }
      }
      .width("100%")
      .height("100%")

    }
    .width("100%")
    .height("100%")
    .justifyContent(FlexAlign.Center)
  }


}