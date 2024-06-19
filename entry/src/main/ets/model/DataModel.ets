

export interface PersonalModel {
  title: string
  introduction: string
  image: Resource
}

const BOOKS: PersonalModel[] = [
  { title: 'Zhang San', introduction: '得分：85', image: $r('app.media.1') },
  { title: 'Li Si', introduction: '得分：75', image: $r('app.media.2') },
  { title: 'Wang Wu', introduction: '得分：70', image: $r('app.media.3') },
  { title: 'Zhao Liu', introduction: '得分：69', image: $r('app.media.4') },
  { title: 'Qian Qi', introduction: '得分：84', image: $r('app.media.5') },
  { title: 'Sun Ba', introduction: '得分：76', image: $r('app.media.6') },
  { title: 'Zhou Jiu', introduction: '得分：79', image: $r('app.media.7') },
  { title: 'Wu Shi', introduction: '得分：86', image: $r('app.media.8') },
  { title: 'Xiao Hong', introduction: '得分：76', image: $r('app.media.9') },
  { title: 'Xiao Ming', introduction: '得分：71', image: $r('app.media.10') },
  { title: 'Xiao Gu', introduction: '得分：73', image: $r('app.media.11') },
  { title: 'Xiao Xu', introduction: '得分：66', image: $r('app.media.12') },
  { title: 'Xiao Ke', introduction: '得分：88', image: $r('app.media.13') },
  { title: 'Xiao Qi', introduction: '得分：57', image: $r('app.media.14') },
  { title: 'Xiao Ai', introduction: '得分：59', image: $r('app.media.15') }

]

export class DataModel {
  private books: Array<PersonalModel> = BOOKS

  constructor() {
  }

  query(key: string) {
    let result: Array<PersonalModel> = []
    this.books.forEach((item) => {
      if (item.title.match(key) || item.introduction.match(key)) {
        result.push(item)
      }
    })
    return result
  }

  getAllData() {
    return this.books
  }
}

export default new DataModel()