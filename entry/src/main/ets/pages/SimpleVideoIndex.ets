
import router from '@ohos.router';
import { VideoModule } from '../view/IndexModule';
import { SwiperVideo } from '../view/IndexSwiper';
import { LIST, MARGIN_FONT_SIZE, ALL_PERCENT } from '../common/constants/CommonConstants';

/**
 * The start index of the application
 */
@Entry
@Component
struct SimpleVideoIndex {
  backclick(){
    router.pushUrl({ url: 'pages/Mainpage' })

  }
  build() {
    Column({ space: MARGIN_FONT_SIZE.FOURTH_MARGIN }) {
      SwiperVideo()
      List() {
        ForEach(LIST, (item: string) => {
          ListItem() {
            VideoModule({ moduleName: item })
              .margin({ top: MARGIN_FONT_SIZE.FIRST_MARGIN })
          }
        }, (item: string) => JSON.stringify(item))
      }
      .listDirection(Axis.Vertical)
      .margin({ top: MARGIN_FONT_SIZE.THIRD_MARGIN })
      Button('返回')
        .width("80%")
        .height("50vp")
        .fontSize("20")
        .onClick(this.backclick.bind(this))
    }
    .width(ALL_PERCENT)
    .height(ALL_PERCENT)
    .backgroundColor($r("app.color.index_backgroundColor"))
  }
}