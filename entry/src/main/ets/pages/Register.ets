import router from '@ohos.router';
import prompt from '@ohos.prompt'

@Entry
@Component
struct Register {
  @State text: string = ''; //电话号码
  @State sec: number = 10 //验证码倒计时
  @State flag: boolean = false; //能否获取验证码
  registerclick(){
    router.pushUrl({ url: 'pages/Registersuccess' })
  }
  backclick(){
    router.back()
  }
  getcode(){
    var T = setInterval(() => {
      if (this.sec <= 0) {
        clearTimeout(T)
        this.flag = false;
        this.sec = 10
      } else {
        this.sec--
      }
    }, 1000)
  }
  
  build() {
    Column() {
      Column() {
        Text("注册")
          .width("200vp")
          .height("60vp")
          .textAlign(TextAlign.Center)
          .fontSize("50fp")
        Text("手机号")
          .width("200vp")
          .height("50vp")
          .textAlign(TextAlign.Center)
          .fontSize("20fp")
        Select([{value: "+86(中国大陆,UTC+8)"},
          {value: "+852(中国香港,UTC+8)"},
          {value: "+853(中国澳门,UTC+8)"},
          {value: "+886(中国台湾,UTC+8)"},])
          .width("300vp")
          .height("40vp")
          .value("+86(中国大陆,UTC+8)")
          .selected(0)
          .font({ size: "20fp" })
        TextInput({ placeholder: "请输入手机号" })
          .width("200vp")
          .height("60vp")
          .type(InputType.Normal)
          .onChange((value: string) => {
            console.log("输入的数据是" + value)
            this.text = value;
          })
        Button(this.flag ? `${this.sec}` + "s后重新获取" : "获取短信验证码")
          .width("150vp")
          .height("50vp")
          .onClick(() => {
            if (this.text == "12345678901") {
              this.flag = true;
              this.getcode()
            }
            else {
              prompt.showToast({
                message: '请输入正确的电话号码',
                duration: 2000,
              });
            }
          })
        Text("验证码")
          .width("200vp")
          .height("50vp")
          .textAlign(TextAlign.Center)
          .fontSize("20fp")
        TextInput({ placeholder: "请输入验证码" })
          .width("200vp")
          .height("60vp")
        Text("邮箱")
          .width("200vp")
          .height("40vp")
          .textAlign(TextAlign.Center)
          .fontSize("20fp")
        TextInput({ placeholder: "请输入邮箱" })
          .width("200vp")
          .height("60vp")
          .type(InputType.Email)
        Text("密码")
          .width("200vp")
          .height("50vp")
          .textAlign(TextAlign.Center)
          .fontSize("20fp")
        TextInput({ placeholder: "请输入密码" })
          .width("200vp")
          .height("60vp")
          .type(InputType.Password)
        Button("注册")
          .width("180vp")
          .height("50vp")
          .offset({ x: "0", y: "10vp" })
          .onClick(this.registerclick.bind(this))
        Button("返回")
          .width("180vp")
          .height("50vp")
          .offset({ x: "0", y: "20vp" })
          .onClick(this.backclick.bind(this))
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