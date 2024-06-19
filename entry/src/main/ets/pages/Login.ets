import router from '@ohos.router';
import prompt from '@ohos.prompt'

@Entry
@Component

struct Login {
  @State phonenum: string = '';
  @State passwd: string = '';
  @State sec: number = 10
  @State flag: boolean = false;
  @State wrongpasswd: number = 0
  loginclick(){
    if(this.passwd == '0000'){
      router.pushUrl({ url: 'pages/Mainpage' })
    }
    else{
      this.wrongpasswd++
      if(this.wrongpasswd<=5){
        prompt.showToast({
          message: '密码输入错误'+this.wrongpasswd+'次，超过5次后自动退出！'+'剩余次数'+(6-this.wrongpasswd)+'次',
          duration: 2000,
        });
      }
      else{
        router.pushUrl({ url: 'pages/Index' })
      }
    }
  }
  backclick(){
    router.pushUrl({ url: 'pages/Index' })

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
        Text("登录")
          .width("200vp")
          .height("60vp")
          .textAlign(TextAlign.Center)
          .fontSize("50fp")
        Text("手机号")
          .width("200vp")
          .height("60vp")
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
          .optionBgColor('#00000000')

        TextInput({ placeholder: "请输入手机号" })
          .width("200vp")
          .height("60vp")
          .type(InputType.Normal)
          .onChange((value: string) => {
            console.log("输入的数据是" + value)
            this.phonenum = value;
          })
        Button(this.flag ? `${this.sec}` + "s后重新获取" : "获取短信验证码")
          .width("150vp")
          .height("50vp")
          .onClick(() => {
            if (this.phonenum == "12345678901") {
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
          .height("60vp")
          .textAlign(TextAlign.Center)
          .fontSize("20fp")
        TextInput({ placeholder: "请输入验证码" })
          .width("200vp")
          .height("60vp")
          .type(InputType.Number)
        Text("密码")
          .width("200vp")
          .height("60vp")
          .textAlign(TextAlign.Center)
          .fontSize("20fp")
        TextInput({ placeholder: "请输入密码" })
          .width("200vp")
          .height("60vp")
          .type(InputType.Password)
          .onChange((value: string) => {
            console.log("输入的数据是" + value)
            this.passwd = value;
          })
        Button("登录")
          .width("200vp")
          .height("50vp")
          .offset({ x: "0", y: "20vp" })
          .onClick(this.loginclick.bind(this))
        Button("返回")
          .width("200vp")
          .height("50vp")
          .offset({ x: "0", y: "40vp" })
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