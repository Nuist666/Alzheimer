import { DataModel, PersonalModel }  from '../model/DataModel'
import TitleBar from '../common/TitleBar'
import { MainPage } from '../../../../../search'

@Entry
@Component
struct Index {
  @State changeValue: string = ''
  @State books: PersonalModel[] = new DataModel().getAllData()
  private controller: SearchController = new SearchController()

  @Builder
  PersonalItem(image: Resource, title: string, introduction: string) {
    Row() {
      Image(image)
        .width(120)
        .height(120)
      Column() {
        Text(title)
          .fontColor(Color.Black)
          .fontSize(25)
        Text(introduction)
          .fontColor(Color.Gray)
          .fontSize(25)
      }
      .layoutWeight(1)
      .margin({ left: 10 })
      .alignItems(HorizontalAlign.Start)
    }
    .padding(10)
    .margin({ left: 10, right: 10 })
    .backgroundColor(Color.White)
    .borderRadius(10)
  }

  build() {
    Column() {
      TitleBar()
      MainPage({ textInfo: $changeValue, customizeFunction: () => {
        this.books = new DataModel().query(this.changeValue)
      } })
      List({ space: 10 }) {
        ForEach(this.books, (item: PersonalModel) => {
          ListItem() {
            this.PersonalItem(item.image, item.title, item.introduction)
          }
        }, (item: PersonalModel) => item.title)
      }
      .width('100%')
      .height('100%')
      .layoutWeight(1)
      .margin({ bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}