import media from '@ohos.multimedia.media';
import fs from '@ohos.file.fs';
import promptAction from '@ohos.promptAction';
import audio from '@ohos.multimedia.audio';

export default class AudioRecorder {
  private audioFile = null
  private avRecorder: media.AVRecorder | undefined = undefined;
  private avProfile: media.AVRecorderProfile = {
    audioBitrate: 48000, // 音频比特率
    audioChannels: audio.AudioChannel.CHANNEL_1, // 音频声道数
    audioCodec: media.CodecMimeType.AUDIO_AAC, // 音频编码格式，当前只支持aac
    audioSampleRate: audio.AudioSamplingRate.SAMPLE_RATE_16000, // 音频采样率
    fileFormat: media.ContainerFormatType.CFT_MPEG_4A, // 封装格式，当前只支持m4a
  };
  private avConfig: media.AVRecorderConfig = {
    audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC, // 音频输入源，这里设置为麦克风
    profile: this.avProfile,
    url: '', // 录音文件的url
  };

  // 注册audioRecorder回调函数
  setAudioRecorderCallback() {
    if (this.avRecorder != undefined) {
      // 错误上报回调函数
      this.avRecorder.on('error', (err) => {
        console.error(`录音器发生错误，错误码为：${err.code}, 错误信息为：${err.message}`);
      })
    }
  }

  // 开始录制
  async startRecord(audioPath: string) {
    // 1.创建录制实例
    this.avRecorder = await media.createAVRecorder();
    this.setAudioRecorderCallback();
    // 创建并打开录音文件
    this.audioFile = fs.openSync(audioPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    // 2.获取录制文件fd赋予avConfig里的url
    this.avConfig.url = `fd://${this.audioFile.fd}`
    // 3.配置录制参数完成准备工作
    await this.avRecorder.prepare(this.avConfig);
    // 4.开始录制
    await this.avRecorder.start();
    console.info('正在录音...')
  }

  // 暂停录制
  async pauseRecord() {
    // 仅在started状态下调用pause为合理状态切换
    if (this.avRecorder != undefined && this.avRecorder.state === 'started') {
      await this.avRecorder.pause();
    }
  }

  // 恢复录制
  async resumeRecord() {
    // 仅在paused状态下调用resume为合理状态切换
    if (this.avRecorder != undefined && this.avRecorder.state === 'paused') {
      await this.avRecorder.resume();
    }
  }

  // 停止录制
  async stopRecord() {
    if (this.avRecorder != undefined) {
      // 1. 停止录制
      // 仅在started或者paused状态下调用stop为合理状态切换
      if (this.avRecorder.state === 'started'
      || this.avRecorder.state === 'paused') {
        await this.avRecorder.stop();
      }
      // 2.重置
      await this.avRecorder.reset();
      // 3.释放录制实例
      await this.avRecorder.release();
      // 4.关闭录制文件fd
      fs.closeSync(this.audioFile);

      promptAction.showToast({ message: "录音成功！" })
    }
  }
}
