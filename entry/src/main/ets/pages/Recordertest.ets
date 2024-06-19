import { checkPermissions } from '../utils/Permission';
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import AudioCapturer from '../utils/Recorder';
import AudioRecorder from '../utils/Recorder';
import promptAction from '@ohos.promptAction';
import media from '@ohos.multimedia.media';
import fs from '@ohos.file.fs';
import router from '@ohos.router';

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
struct Recordertest {
  @State recordBtnText: string = '按下录音'
  @State playBtnText: string = '播放音频'
  // 录音器
  private audioRecorder?: AudioRecorder;
  // 播放器
  private avPlayer
  private playIng: boolean = false

  backclick(){
    router.back()
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

  build() {

    Column() {
      Text('录音功能测试')
        .width("100%")
        .height("60vp")
        .margin({top:'40%'})
        .textAlign(TextAlign.Center)
        .fontSize("50fp")
      RelativeContainer() {
        // 录音按钮
        Button(this.recordBtnText)
          .id('btn1')
          .width('90%')
          .height('60vp')
          .margin({ bottom: 200 })
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
          .width('90%')
          .height('60vp')
          .margin({ bottom: 50 })
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
      .width('100%')
      .height('50%')
      Button("返回")
        .width("90%")
        .height("60vp")
        .offset({ x: "0", y: "40vp" })
        .onClick(this.backclick.bind(this))
    }
    .width('100%')
    .height('100%')
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
}
