import common from '@ohos.app.ability.common'
import wantConstant from '@ohos.ability.wantConstant'
import picker from '@ohos.file.picker'
import router from '@ohos.router';
@Entry
@Component
struct Page3 {
  @State uri :string = ''
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
        Navigation() {
          List() {
            ListItem() {
              Search({placeholder:'搜索功能请至人员得分数据管理页面使用！'})
                .width("100%")
                .height("40vp")
            }
            .width("100%")
            .height("50.18vp")
            ListItem() {
              Column() {
                Text("模块一：视空间与执行能力")
                  .width("77.14%")
                  .height("60vp")
                  .fontSize("22fp")
                Text("\"指导语：“请您下方画一个钟表，填上所有的数字并指出11点10分”")
                  .width("281.43vp")
                  .height("50.84vp")
                  .fontColor(Color.Red)
                  .fontSize("15fp")
                Image(this.uri).size({width:300,height:200})
                Button('点击拍照后选择图片进行插入')
                  .width("80%")
                  .height("40vp")
                  .onClick(async ()=>{
                    let wantObj = {
                      deviceId:"",
                      action:wantConstant.Action.ACTION_IMAGE_CAPTURE
                    }
                    let data = await this.context.startAbilityForResult(wantObj)
                    console.log(data.want.uri)
                    this.uri = data.want.uri
                  })
              }
              .width("100%")
              .height("100%")
            }
            .width("100%")
            .height("358.32vp")
            ListItem() {
              Column() {
                Text("模块二：命名")
                  .width("44.87%")
                  .height("60vp")
                  .fontSize("22fp")
                Text(" 指导语：“请您告诉我这个动物的名字”")
                  .width("200vp")
                  .height("50.84vp")
                  .fontColor(Color.Red)
                  .fontSize("15fp")
                Row() {
                  Image($r('app.media.image1_3'))
                    .width("188.8vp")
                    .height("110.43vp")
                    .offset({ x: "29.5vp", y: "-0.22vp" })
                  Checkbox()
                    .width("20vp")
                    .height("20vp")
                    .offset({ x: "44.59vp", y: "-0.1vp" })
                  Checkbox()
                    .width("20vp")
                    .height("20vp")
                    .offset({ x: "53.91vp", y: "-0.27vp" })
                }
                .width("360vp")
                .height("140.21vp")
                Row() {
                  Image($r('app.media.image1_4'))
                    .width("194.91vp")
                    .height("83.97vp")
                    .offset({ x: "20.14vp", y: "-0.01vp" })
                  Checkbox()
                    .width("20vp")
                    .height("20vp")
                    .offset({ x: "42.1vp", y: "-0.23vp" })
                  Checkbox()
                    .width("20vp")
                    .height("20vp")
                    .offset({ x: "48.84vp", y: "-0.23vp" })
                }
                .width("360vp")
                .height("135.12vp")
                Text("评分标准：每答对1个给1分，正确答案是：①狮子 ②骆驼")
                  .width("284.48vp")
                  .height("60vp")
                  .fontSize("13fp")
              }
              .width("100%")
              .height("100%")
            }
            .width("100%")
            .height("459.7vp")
            ListItem() {
              Column() {
                Text("模块三：语言")
                  .width("47.41%")
                  .height("60vp")
                  .fontSize("22fp")
                Text("\"指导语: “现在我要对您说一句话，我说完后请您把我说的话尽可能原原本本地重复出来(暂停一会儿)”：\"")
                  .width("272.27vp")
                  .height("60vp")
                  .fontColor(Color.Red)
                  .fontSize("15fp")
                Row() {
                  Text("狗在房间的时候，猫总是躲在沙发下面")
                    .width("200vp")
                    .height("60vp")
                    .offset({ x: "23.12vp", y: "-12.55vp" })
                    .fontSize("18fp")
                  Checkbox()
                    .width("20vp")
                    .height("20vp")
                    .offset({ x: "31.34vp", y: "-7.32vp" })
                  Checkbox()
                    .width("20vp")
                    .height("20vp")
                    .offset({ x: "43.46vp", y: "-8.7vp" })
                }
                .width("360vp")
                .height("120.87vp")
                Row() {
                  Text("我只知道今天王雷是来帮过忙的人")
                    .width("200vp")
                    .height("60vp")
                    .offset({ x: "23.98vp", y: "-9.26vp" })
                    .fontSize("18fp")
                  Checkbox()
                    .width("20vp")
                    .height("20vp")
                    .offset({ x: "34.17vp", y: "-7.28vp" })
                  Checkbox()
                    .width("20vp")
                    .height("20vp")
                    .offset({ x: "46.21vp", y: "-7.35vp" })
                }
                .width("360vp")
                .height("99.48vp")
                Text("评分标准：复述正确，每句话分别给1分，复述必须准确，注意复述时出现的省略")
                  .width("311.96vp")
                  .height("60vp")
                  .fontSize("13fp")
              }
              .width("100%")
              .height("100%")
            }
            .width("100%")
            .height("410.84vp")
            ListItem() {
              Column() {
                Text("模块四：抽象")
                  .width("200vp")
                  .height("60vp")
                  .fontSize("22fp")
                Text("指导语：先进行练习环节，“请您说一说桔子和香蕉在什么方面相似？”。如果受试者回答的是一种具体特征（如都有皮或者都能吃等），那么只能再提示一次：请再换一种说法，他们在什么方面相兴似？”")
                  .width("309.92vp")
                  .height("79.34vp")
                  .fontColor(Color.Red)
                  .fontSize("12fp")
                Row() {
                  Text("火车--自行车 代表_____?")
                    .width("200vp")
                    .height("60vp")
                    .offset({ x: "31.21vp", y: "-10.33vp" })
                    .fontSize("18fp")
                  Checkbox()
                    .width("20vp")
                    .height("20vp")
                    .offset({ x: "39.39vp", y: "-11.26vp" })
                  Checkbox()
                    .width("20vp")
                    .height("20vp")
                    .offset({ x: "42.54vp", y: "-11.31vp" })
                }
                .width("360vp")
                .height("90.33vp")
                Row() {
                  Text("手表--尺子 代表_____?")
                    .width("200vp")
                    .height("60vp")
                    .offset({ x: "30.47vp", y: "-14.26vp" })
                    .fontSize("18fp")
                  Checkbox()
                    .width("20vp")
                    .height("20vp")
                    .offset({ x: "40.46vp", y: "-8.29vp" })
                  Checkbox()
                    .width("20vp")
                    .height("20vp")
                    .offset({ x: "46.68vp", y: "-8.51vp" })
                }
                .width("360vp")
                .height("93.39vp")
                Text("评分标准：只对后两组词的回答进行评分，回答正确，每组词分别给1分")
                  .width("266.16vp")
                  .height("45.75vp")
                  .fontSize("13fp")
              }
              .width("100%")
              .height("100%")
            }
            .width("100%")
            .height("100%")
          }
          .width("100%")
          .height("90%")
          Row(){
            Button('拍照')
              .width("80vp")
              .height("50vp")
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
              .width("80vp")
              .height("50vp")
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
              .width("80vp")
              .height("50vp")
              .onClick(this.backclick.bind(this))
          }
        }
        .width("100%")
        .height("100%")
        .title("蒙特利尔评估")
        .subTitle("MoCA")
      }
      .width("100%")
      .height("100%")
      .justifyContent(FlexAlign.Center)
    }
    .width("100%")
    .height("100%")
  }
}