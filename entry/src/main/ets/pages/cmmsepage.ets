import prompt from '@ohos.prompt'
import router from '@ohos.router';
import { checkPermissions } from '../utils/Permission';
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import AudioCapturer from '../utils/Recorder';
import AudioRecorder from '../utils/Recorder';
import promptAction from '@ohos.promptAction';
import media from '@ohos.multimedia.media';
import fs from '@ohos.file.fs';


// 需要动态申请的权限
const permissions: Array<Permissions> = ['ohos.permission.MICROPHONE'];
// 获取程序的上下文
const context = getContext(this) as common.UIAbilityContext;
// 获取项目的files目录
const filesDir = context.filesDir;
// 如果文件夹不存在就创建
fs.access(filesDir, (err, res: boolean) => {
  if (!res) {
    fs.mkdirSync(filesDir)
  }
});

// 录音文件路径
let audioPath = filesDir + "/audio.m4a";



@Entry
@Component
struct Cmmsepage {
  @State score : number = 0
  @State recordBtnText: string = '按下录音'
  @State playBtnText: string = '播放音频'
  // 录音器
  private audioRecorder?: AudioRecorder;
  // 播放器
  private avPlayer
  private playIng: boolean = false



  // 申请权限
  reqPermissionsAndRecord(permissions: Array<Permissions>): void {
    let atManager = abilityAccessCtrl.createAtManager();
    // requestPermissionsFromUser会判断权限的授权状态来决定是否唤起弹窗
    atManager.requestPermissionsFromUser(context, permissions).then((data) => {
      let grantStatus: Array<number> = data.authResults;
      let length: number = grantStatus.length;
      for (let i = 0; i < length; i++) {
        if (grantStatus[i] === 0) {
          // 用户授权，可以继续访问目标操作
          console.info('授权成功')
          if (this.audioRecorder == null) {
            this.audioRecorder = new AudioCapturer()
          }
        } else {
          promptAction.showToast({ message: '授权失败,需要授权才能录音' })
          return;
        }
      }
    }).catch((err) => {
      console.error(`requestPermissionsFromUser failed, code is ${err.code}, message is ${err.message}`);
    })
  }



  // 注册avplayer回调函数
  setAVPlayerCallback() {
    this.avPlayer.on('error', (err) => {
      this.playIng = false
      this.playBtnText = '播放音频'
      console.error(`播放器发生错误，错误码：${err.code}, 错误信息：${err.message}`);
      // 调用reset重置资源，触发idle状态
      this.avPlayer.reset();
    })
    // 状态机变化回调函数
    this.avPlayer.on('stateChange', async (state) => {
      switch (state) {
        case 'initialized':
        // 资源初始化完成，开始准备文件
          this.avPlayer.prepare();
          break;
        case 'prepared':
        // 资源准备完成，开始准备文件
          this.avPlayer.play();
          break;
        case 'completed':
        // 调用reset()重置资源，AVPlayer重新进入idle状态，允许更换资源url
          this.avPlayer.reset();
          break;
        case 'idle':
          this.playIng = false
          this.playBtnText = '播放音频'
          break;
      }
    })
  }

  // 页面显示时
  async onPageShow() {
    // 判断是否已经授权
    let promise = checkPermissions(permissions[0])
    promise.then((result) => {
      if (result) {
        // 初始化录音器
        if (this.audioRecorder == null) {
          this.audioRecorder = new AudioRecorder()
        }
      } else {
        this.reqPermissionsAndRecord(permissions)
      }
    })
    // 创建avPlayer实例对象
    this.avPlayer = await media.createAVPlayer();
    // 创建状态机变化回调函数
    this.setAVPlayerCallback();
    console.info('播放器准备完成')
  }

  searchclick(){
    router.pushUrl({ url: 'pages/personalquery' })
  }

  // 播放音频
  async playAudio(path: string) {
    this.playIng = true
    let fdPath = 'fd://';
    let res = fs.accessSync(path);
    if (!res) {
      console.error(`音频文件不存在：${path}`);
      this.playIng = false
      return
    }
    console.info(`播放音频文件：${path}`)
    // 打开相应的资源文件地址获取fd
    let file = await fs.open(path);
    fdPath = fdPath + '' + file.fd;
    // url赋值触发initialized状态机上报
    this.avPlayer.url = fdPath;
  }

  // 停止播放
  stopPlay() {
    this.avPlayer.reset();
  }

  checkbox1(value: boolean){
    if(value){
      this.score=this.score+1
      console.log('+1')
    }
    else {
      this.score=this.score-1
      console.log('-1')
    }
  }
  checkbox2(value: boolean){
    if(value){
      this.score=this.score+2
      console.log('+2')
    }
    else {
      this.score=this.score-2
      console.log('-2')
    }
  }
  checkbox3(value: boolean){
    if(value){
      this.score=this.score+3
      console.log('+3')
    }
    else {
      this.score=this.score-3
      console.log('-3')
    }
  }
  checkbox4(value: boolean){
    if(value){
      this.score=this.score+4
      console.log('+4')
    }
    else {
      this.score=this.score-4
      console.log('-4')
    }
  }
  checkbox5(value: boolean){
    if(value){
      this.score=this.score+5
      console.log('+5')
    }
    else {
      this.score=this.score-5
      console.log('-5')
    }
  }
  checkbox7(value: boolean){
    if(value){
      this.score=this.score+7
      console.log('+7')
    }
    else {
      this.score=this.score-7
      console.log('-7')
    }
  }
  checkbox9(value: boolean){
    if(value){
      this.score=this.score+9
      console.log('+9')
    }
    else {
      this.score=this.score-9
      console.log('-9')
    }
  }

  @Builder navigation1ToolBar_lvbj() {
    Row() {
    Text("当前得分：")
      .width("80vp")
      .height("50vp")
      .fontSize("15fp")
    Text(`${this.score}`)
      .width("80vp")
      .height("50vp")
      .fontColor("#36D")
      .fontSize("30fp")
      // 录音按钮
      Button(this.recordBtnText)
        .id('btn1')
        .width('120vp')
        .height('50vp')
        .alignRules({
          bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onTouch((event) => {
          switch (event.type) {
            case TouchType.Down:
              console.info('按下按钮')
            // 判断是否有权限
              let promise = checkPermissions(permissions[0])
              promise.then((result) => {
                if (result) {
                  // 开始录音
                  this.audioRecorder.startRecord(audioPath)
                  this.recordBtnText = '录音中...'
                } else {
                  // 申请权限
                  this.reqPermissionsAndRecord(permissions)
                }
              })
              break
            case TouchType.Up:
              console.info('松开按钮')
              if (this.audioRecorder != null) {
                // 停止录音
                this.audioRecorder.stopRecord()
              }
              this.recordBtnText = '按下录音'
              break
          }
        })

      // 播放按钮
      Button(this.playBtnText)
        .id('btn2')
        .width('120vp')
        .height('50vp')
        .alignRules({
          bottom: { anchor: 'btn1', align: VerticalAlign.Top },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          if (!this.playIng) {
            this.playBtnText = '播放中...'
            // 播放音频
            this.playAudio(audioPath)
          }else {
            // 停止播放
            this.stopPlay()
          }
        })


  }
    .backgroundColor("#EEEEEE")
  }


  aboutToAppear() {

  }

  build() {
    Column() {
      Column() {
        Navigation() {
          Search({placeholder:'搜索功能请至人员得分数据管理页面使用！'})
            .width("100%")
            .height("40vp")


          List() {
            ListItem() {
              Text("简易智能状态检查前点击右下角的开始录音按钮")
                .width("100%")
                .height("20vp")
                .fontColor("#ff0000")
                .textAlign(TextAlign.Center)
                .fontWeight(FontWeight.Bold)
            }            
            .width("100%")
            .height("40vp")
            ListItem() {
              Text("内容一：（正确1  错误5）")
                .width("100%")
                .height("20vp")
                .fontColor("#ff0000")
                .textAlign(TextAlign.Center)
                .fontWeight(FontWeight.Bold)
            }            
            .width("100%")
            .height("20vp")
            ListItem() {
              Row() {
                Text("1．今年的年份？")
                  .width("200vp")
                  .height("20vp")
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox1.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox5.bind(this))
              }
            }            
            .width("100%")
            .height("50vp")
            ListItem() {
              Row() {
                Text("2．现在是什么季节？")
                  .width("200vp")
                  .height("20vp")
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox1.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox5.bind(this))
              }
            }            
            .width("100%")
            .height("50vp")
            ListItem() {
              Row() {
                Text("3．今天是几号？")
                  .width("200vp")
                  .height("20vp")
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .offset({ x: "0vp", y: "0vp" })
                  .onChange(this.checkbox1.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox5.bind(this))
              }
            }            
            .width("100%")
            .height("50vp")
            ListItem() {
              Row() {
                Text("4．今天是星期几？")
                  .width("200vp")
                  .height("20vp")
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox1.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox5.bind(this))
              }
            }            
            .width("100%")
            .height("50vp")
            ListItem() {
              Row() {
                Text("5．现在是几月份？")
                  .width("200vp")
                  .height("20vp")
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox1.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox5.bind(this))
              }
            }            
            .width("100%")
            .height("50vp")
            ListItem() {
              Column() {
                Text("内容二：（对 1 错 5 拒绝回答 9）")
                  .width("100%")
                  .height("20vp")
                  .fontColor("#ff0000")
                  .textAlign(TextAlign.Center)
                  .fontWeight(FontWeight.Bold)
                Text("访问员：现在我要说三样东西的名称，在我讲完后，请您重复说一遍，请您好好记住这三样东西，因为等一下还要再问您的。（每一样东西一秒钟）")
                  .width("100%")
                  .height("60vp")
                  .textAlign(TextAlign.Center)
                Text("“皮球” “国旗” “树木”\n请把这三样东西说一遍（以第一次答案记分）\n")
                  .width("100%")
                  .height("40vp")
                  .textAlign(TextAlign.Center)
              }              
              .width("100%")
            }            
            .width("100%")
            .height("130vp")
            ListItem() {
              Row() {
                Text("11．皮球________")
                  .width("150vp")
                  .height("20vp")
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox1.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox5.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox9.bind(this))
              }
            }            
            .width("100%")
            .height("50vp")
            ListItem() {
              Row() {
                Text("12．国旗________")
                  .width("150vp")
                  .height("20vp")
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox1.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox5.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox9.bind(this))
              }
            }            
            .width("100%")
            .height("50vp")
            ListItem() {
              Row() {
                Text("13．树木________")
                  .width("150vp")
                  .height("20vp")
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox1.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox5.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox9.bind(this))
              }
            }            
            .width("100%")
            .height("50vp")
            ListItem() {
              Text("访问员：（继续重复这三样东西，直到受访者能正确重述，可重复六次）")
                .width("100%")
                .height("40vp")
                .textAlign(TextAlign.Center)
            }            
            .width("100%")
            .height("40vp")
            ListItem() {
              Row() {
                Text("13（a）．重复几次？（不计分）")
                  .width("250vp")
                  .height("40vp")
                TextInput()
                  .width("80vp")
                  .height("40vp")
              }
            }            
            .width("100%")
            .height("40vp")
            ListItem() {
              Text("内容三：（对 1 错 5 说不会做 7 其他原因不做 9）")
                .width("100%")
                .height("20vp")
                .fontColor("#ff0000")
                .textAlign(TextAlign.Center)
                .fontWeight(FontWeight.Bold)
            }            
            .width("100%")
            .height("20vp")
            ListItem() {
              Text("访问员：现在请您从100减去7，然后从所得的数目再减去7，如此一直计算下去，把每一个答案告诉我，直到我说“停”为止。（若错了，但下一个答案却是对的，那么只记录一次错误。）")
                .width("100%")
                .height("100vp")
                .textAlign(TextAlign.Center)
            }            
            .width("100%")
            .height("100vp")
            ListItem() {
              Row() {
                Text("14．（       ）______")
                  .width("100vp")
                  .height("20vp")
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox1.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox5.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox7.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox9.bind(this))
              }
            }            
            .width("100%")
            .height("50vp")
            ListItem() {
              Row() {
                Text("15．（       ）______")
                  .width("100vp")
                  .height("20vp")
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox1.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox5.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox7.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox9.bind(this))
              }
            }            
            .width("100%")
            .height("50vp")
            ListItem() {
              Row() {
                Text("16．（       ）______")
                  .width("100vp")
                  .height("20vp")
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox1.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox5.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox7.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox9.bind(this))
              }
            }            
            .width("100%")
            .height("50vp")
            ListItem() {
              Row() {
                Text("17．（       ）______")
                  .width("100vp")
                  .height("20vp")
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox1.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox5.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox7.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox9.bind(this))
              }
            }            
            .width("100%")
            .height("50vp")
            ListItem() {
              Row() {
                Text("18．（       ）______")
                  .width("100vp")
                  .height("20vp")
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox1.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox5.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox7.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox9.bind(this))
              }
            }            
            .width("100%")
            .height("50vp")
            ListItem() {
              Text("停止！")
                .width("250vp")
                .height("30vp")
                .fontSize("15fp")
            }            
            .width("100%")
            .height("30vp")
            ListItem() {
              Text("内容四： 错误数  0个  1个  2个  3个  4个  5个（对应得分）  拒绝回答 9")
                .width("100%")
                .height("40vp")
                .fontColor("#ff0000")
                .textAlign(TextAlign.Center)
                .fontWeight(FontWeight.Bold)
            }            
            .width("100%")
            .height("40vp")
            ListItem() {
              Text("访问员：现在我要说一句话，然后请您把它倒说一遍，这句话是“天上有月亮”，请倒说出来。（如有必要可重念）")
                .width("100%")
                .height("60vp")
            }            
            .width("100%")
            .height("60vp")
            ListItem() {
              Text("18（a）．亮月有上天")
                .width("100%")
                .height("20vp")
                .textAlign(TextAlign.Center)
            }            
            .width("100%")
            .height("20vp")
            ListItem() {
              Row() {
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox1.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox2.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox3.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox4.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox5.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox9.bind(this))
              }
            }            
            .width("100%")
            .height("50vp")
            ListItem() {
              Text("访问员：现在请您告诉我，刚才我要您记住的三样东西是什么？（对 1 错 5 不会做 7 拒绝 9）")
                .width("100%")
                .height("40vp")
            }            
            .width("100%")
            .height("40vp")
            ListItem() {
              Row() {
                Text("19．皮球_____")
                  .width("100vp")
                  .height("20vp")
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox1.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox5.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox7.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox9.bind(this))
              }
            }            
            .width("100%")
            .height("50vp")
            ListItem() {
              Row() {
                Text("20．国旗_____")
                  .width("100vp")
                  .height("20vp")
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox1.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox5.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox7.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox9.bind(this))
              }
            }            
            .width("100%")
            .height("50vp")
            ListItem() {
              Row() {
                Text("21．树木_____")
                  .width("100vp")
                  .height("20vp")
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox1.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox5.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox7.bind(this))
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                  .onChange(this.checkbox9.bind(this))
              }
            }            
            .width("100%")
            .height("50vp")
            ListItem() {
              Text("至此简易智能状态检查结束。\n点击右下角停止录音后自动提交结果。")
                .width("100%")
                .height("60vp")
                .fontColor("#ff0000")
                .fontSize("20fp")
                .fontWeight(FontWeight.Bold)
            }            
            .width("100%")
            .height("100vp")
          }          
          .width("100%")
          .height("90%")
        }        
        .width("100%")
        .height("100%")
        .title("简易智能状态检查")
        .subTitle("Chinese Mini-Mental State Exam")
        .titleMode(NavigationTitleMode.Mini)
        .toolBar(this.navigation1ToolBar_lvbj)
      }      
      .width("100%")
      .height("100%")
      .justifyContent(FlexAlign.Center)
    }    
    .width("100%")
    .height("100%")
  }
}