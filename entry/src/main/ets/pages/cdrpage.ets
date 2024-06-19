@Entry
@Component
struct Cdrpage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Column() {
        Navigation() {
          List() {
            ListItem() {
              Text("一、询问知情者")
                .width("100%")
                .height("100%")
                .fontSize("20fp")
            }
            .width("100%")
            .height("60vp")
            ListItem() {
              Text("(1)询问知情者有关受试者记忆的问题")
                .width("100%")
                .height("100%")
                .fontSize("15fp")
            }
            .width("100%")
            .height("40vp")
            ListItem() {
              Row() {
                Text("1-1. 他/她有记忆减退或考虑问题困难吗?  ")
                  .width("200vp")
                  .height("40vp")
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                Text("有")
                  .width("20vp")
                  .height("20vp")
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                Text("没有")
                  .width("40vp")
                  .height("20vp")
              }
              .width("360vp")
              .height("40vp")
            }
            .width("100%")
            .height("80vp")
            ListItem()
              .width("100%")
              .height("20vp")
            ListItem() {
              Row() {
                Text("1-1a. 假如有,是经常出现的吗(而不是偶尔出现)?\t\t \t\t\t\t\t\t\t")
                  .width("200vp")
                  .height("40vp")
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                Text("是")
                  .width("20vp")
                  .height("20vp")
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                Text("不是")
                  .width("40vp")
                  .height("20vp")
              }
              .width("360vp")
              .height("40vp")
            }
            .width("100%")
            .height("80vp")
            ListItem() {
              Row() {
                Text("1-2.过去的一年中,他/她有记忆力减退吗? \t \t\t\t\t\t\t\t")
                  .width("200vp")
                  .height("40vp")
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                Text("有")
                  .width("20vp")
                  .height("20vp")
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                Text("没有")
                  .width("40vp")
                  .height("20vp")
              }
              .width("360vp")
              .height("40vp")
            }
            .width("100%")
            .height("80vp")
            ListItem() {
              Text("告诉我一些他/她最近生活中应该记住的一些事情[请详细描述事情发生的地点,开始、持续和结束时间,参加者是谁以及他们(包括受试者)是如何到达活动场所的]。 \n请具体记录:   ")
                .width("100%")
                .height("100%")
            }
            .width("100%")
            .height("80vp")
            ListItem()
              .width("100%")
              .height("20vp")
            ListItem() {
              Text("一周以内的事件")
                .width("100%")
                .height("100%")
            }
            .width("100%")
            .height("30vp")
            ListItem() {
              TextInput()
                .width("100%")
                .height("100%")
            }
            .width("100%")
            .height("40vp")
            ListItem() {
              Text("一月以内的事件")
                .width("100%")
                .height("100%")
            }
            .width("100%")
            .height("30vp")
            ListItem() {
              TextInput()
                .width("100%")
                .height("100%")
            }
            .width("100%")
            .height("40vp")
            ListItem() {
              Text("(2)询问知情者有关受试者定向的问题:他/她是否经常准确知道")
                .width("100%")
                .height("100%")
                .fontSize("15fp")
            }
            .width("100%")
            .height("60vp")
            ListItem() {
              Row() {
                Text("2-1. 日期?")
                  .width("30%")
                  .height("100%")
                Checkbox()
                  .width("10vp")
                  .height("20vp")
                Text("经常")
                  .width("40vp")
                  .height("20vp")
                  .fontSize("10fp")
                Checkbox()
                  .width("10vp")
                  .height("20vp")
                Text("有时")
                  .width("40vp")
                  .height("20vp")
                Checkbox()
                  .width("10vp")
                  .height("20vp")
                Text("很少")
                  .width("40vp")
                  .height("20vp")
                Checkbox()
                  .width("10vp")
                  .height("20vp")
                Text("不详")
                  .width("40vp")
                  .height("20vp")
              }
            }
            .width("100%")
            .height("40vp")
            ListItem() {
              Row() {
                Text("2-2. 月份?")
                  .width("30%")
                  .height("100%")
                Checkbox()
                  .width("10vp")
                  .height("20vp")
                Text("经常")
                  .width("40vp")
                  .height("20vp")
                  .fontSize("10fp")
                Checkbox()
                  .width("10vp")
                  .height("20vp")
                Text("有时")
                  .width("40vp")
                  .height("20vp")
                Checkbox()
                  .width("10vp")
                  .height("20vp")
                Text("很少")
                  .width("40vp")
                  .height("20vp")
                Checkbox()
                  .width("10vp")
                  .height("20vp")
                Text("不详")
                  .width("40vp")
                  .height("20vp")
              }
            }
            .width("100%")
            .height("40vp")
            ListItem() {
              Row() {
                Text("2-3.星期几?")
                  .width("30%")
                  .height("100%")
                Checkbox()
                  .width("10vp")
                  .height("20vp")
                Text("经常")
                  .width("40vp")
                  .height("20vp")
                  .fontSize("10fp")
                Checkbox()
                  .width("10vp")
                  .height("20vp")
                Text("有时")
                  .width("40vp")
                  .height("20vp")
                Checkbox()
                  .width("10vp")
                  .height("20vp")
                Text("很少")
                  .width("40vp")
                  .height("20vp")
                Checkbox()
                  .width("10vp")
                  .height("20vp")
                Text("不详")
                  .width("40vp")
                  .height("20vp")
              }
            }
            .width("100%")
            .height("40vp")
            ListItem() {
              Row() {
                Text("2-4. 年份?")
                  .width("30%")
                  .height("100%")
                Checkbox()
                  .width("10vp")
                  .height("20vp")
                Text("经常")
                  .width("40vp")
                  .height("20vp")
                  .fontSize("10fp")
                Checkbox()
                  .width("10vp")
                  .height("20vp")
                Text("有时")
                  .width("40vp")
                  .height("20vp")
                Checkbox()
                  .width("10vp")
                  .height("20vp")
                Text("很少")
                  .width("40vp")
                  .height("20vp")
                Checkbox()
                  .width("10vp")
                  .height("20vp")
                Text("不详")
                  .width("40vp")
                  .height("20vp")
              }
            }
            .width("100%")
            .height("40vp")
            ListItem()
              .width("100%")
              .height("20vp")
            ListItem() {
              Text("二.询问受试者")
                .width("100%")
                .height("100%")
                .fontSize("20fp")
            }
            .width("100%")
            .height("60vp")
            ListItem() {
              Text("(1)询问受试者的记忆问题")
                .width("100%")
                .height("40vp")
                .fontSize("15fp")
            }
            .width("100%")
            .height("40vp")
            ListItem()
              .width("100%")
              .height("20vp")
            ListItem() {
              Text("刚才你的配偶、子女等告诉我一些你最近经历的事。你能告诉我有关这些事情的一些情况吗? [有需要可以给提示,如地点,发生、持续和结束时间,参加者以及他们(包括受试者)如何到达现场。]")
                .width("100%")
                .height("80vp")
            }
            .width("100%")
            .height("80vp")
            ListItem()
              .width("100%")
              .height("20vp")
            ListItem() {
              Text("一周以内的事件：")
                .width("100%")
                .height("100%")
            }
            .width("100%")
            .height("30vp")
            ListItem() {
              TextInput()
                .width("100%")
                .height("100%")
            }
            .width("100%")
            .height("40vp")
            ListItem() {
              Row() {
                Text("0")
                  .width("40vp")
                  .height("20vp")
                Checkbox()
                  .width("10vp")
                  .height("20vp")
                Text("大部分正确")
                  .width("100vp")
                  .height("20vp")
              }
            }
            .width("100%")
            .height("40vp")
            ListItem() {
              Row() {
                Text("0.5")
                  .width("40vp")
                  .height("20vp")
                Checkbox()
                  .width("10vp")
                  .height("20vp")
                Text("部分正确")
                  .width("100vp")
                  .height("20vp")
              }
            }
            .width("100%")
            .height("40vp")
            ListItem() {
              Row() {
                Text("1")
                  .width("40vp")
                  .height("20vp")
                Checkbox()
                  .width("10vp")
                  .height("20vp")
                Text("大部分不正确")
                  .width("100vp")
                  .height("20vp")
              }
            }
            .width("100%")
            .height("40vp")
            ListItem() {
              Text("一月以内的事件")
                .width("100%")
                .height("100%")
            }
            .width("100%")
            .height("31.52vp")
            ListItem() {
              TextInput()
                .width("100%")
                .height("100%")
            }
            .width("100%")
            .height("40vp")
            ListItem() {
              Row() {
                Text("0")
                  .width("40vp")
                  .height("20vp")
                  .fontSize("10fp")
                Checkbox()
                  .width("10vp")
                  .height("20vp")
                Text("大部分正确")
                  .width("100vp")
                  .height("20vp")
              }
            }
            .width("100%")
            .height("40vp")
            ListItem() {
              Row() {
                Text("0.5")
                  .width("40vp")
                  .height("20vp")
                  .fontSize("10fp")
                Checkbox()
                  .width("10vp")
                  .height("20vp")
                Text("部分正确")
                  .width("100vp")
                  .height("20vp")
              }
            }
            .width("100%")
            .height("40vp")
            ListItem() {
              Row() {
                Text("1")
                  .width("40vp")
                  .height("20vp")
                  .fontSize("10fp")
                Checkbox()
                  .width("10vp")
                  .height("20vp")
                Text("大部分不正确")
                  .width("100vp")
                  .height("20vp")
              }
            }
            .width("100%")
            .height("40vp")
            ListItem() {
              Text("(2)询问受试者的定向问题(详细记录受试者的答案)")
                .width("100%")
                .height("100%")
                .fontSize("15fp")
            }
            .width("100%")
            .height("40vp")
            ListItem() {
              Row() {
                Text("2-1.今天是几号?")
                  .width("50%")
                  .height("100%")
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                Text("正确")
                  .width("40vp")
                  .height("20vp")
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                Text("不正确")
                  .width("60vp")
                  .height("20vp")
              }
            }
            .width("100%")
            .height("40vp")
            ListItem() {
              Row() {
                Text("2-2.今天是星期几?")
                  .width("50%")
                  .height("100%")
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                Text("正确")
                  .width("40vp")
                  .height("20vp")
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                Text("不正确")
                  .width("60vp")
                  .height("20vp")
              }
            }
            .width("100%")
            .height("40vp")
            ListItem() {
              Row() {
                Text("2-3.今年是哪一年")
                  .width("50%")
                  .height("100%")
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                Text("正确")
                  .width("40vp")
                  .height("20vp")
                Checkbox()
                  .width("20vp")
                  .height("20vp")
                Text("不正确")
                  .width("60vp")
                  .height("20vp")
              }
            }
            .width("100%")
            .height("40vp")
            ListItem()
              .width("100%")
              .height("20vp")
            ListItem()
              .width("100%")
              .height("20vp")
            ListItem()
              .width("100%")
              .height("20vp")
          }
          .width("100%")
          .height("100%")
        }
        .width("100%")
        .height("100%")
        .title("CDR")
        .subTitle("临床痴呆评定表")
        .titleMode(NavigationTitleMode.Mini)
      }
      .width("100%")
      .height("100%")
      .offset({ x: "0vp", y: "0vp" })
      .justifyContent(FlexAlign.Center)
    }
    .width("100%")
    .height("100%")
  }
}