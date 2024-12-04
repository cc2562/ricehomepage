# ricehomepage 米饭个人主页

一个基于Flutter for web制作的个人主页。

## 特征
- 流畅的背景动画和交互动画
- 响应式设计，支持桌面、平板、手机
- 编译后完全由html css js构成 无须额外依赖
- 轻量，仅依赖Flutter for web
- 采用先进的Canvakit实现网页渲染
- 使用Rive制作动画

## 使用以下包

- **responsive_framework**：
    - 版本：^1.5.1
    - pub.dev链接：https://pub.dev/packages/responsive_framework
    - 非常感谢其开发者构建的出色框架，通过它我们能够轻松实现应用在不同设备屏幕尺寸下的良好适配，打造出优秀的响应式布局效果。

- **blurrycontainer**：
    - 版本：^2.1.0
    - pub.dev链接：https://pub.dev/packages/blurrycontainer
    - 让实现模糊效果变得更简单。

- **flutter_animate**：
    - 版本：^4.5.2
    - pub.dev链接：https://pub.dev/packages/flutter_animate
    - 借助其强大且便捷的动画功能，制作出了渐变的标题颜色。

- **rive**：
    - 版本：^0.13.18
    - pub.dev链接：https://pub.dev/packages/rive
    - 实现了背景动画效果。

- **font_awesome_flutter**：
    - 版本：^10.8.0
    - pub.dev链接：https://pub.dev/packages/font_awesome_flutter
    - 提供了丰富的图标库，用于在应用中实现。

- **url_launcher**：
    - 版本：^6.3.1
    - pub.dev链接：https://pub.dev/packages/url_launcher
    - 实现了网页跳转的功能。

向以上所有Flutter包的相关开发者和贡献者们表示衷心的感谢！

> 本网页设计初期灵感参考了[https://flag.moe/](https://flag.moe/)的设计

## 如何使用

1. 克隆整个项目到本地
2. 运行`flutter pub get`
3. 更具需求更改`main.dart`中的相关内容
4. 使用命令`flutter build web --web-renderer canvaskit --no-web-resources-cdn`进行构建

## 如何使用友情链接功能
1. 配置`config/links.json`文件
2. 按照以下模板配置
```json
[
    {
        "link_id": "1", //id可以随意填写
        "link_url": "https://www.ccrice.com",
        "link_name": "CC米饭",
        "link_image": "图像直链",
        "link_target": "_blank", //目前没有作用 可不填
        "link_description": "是CC米饭的博客~" //描述
    }
]
```

## 个性化配置

从当前版本开始，米饭的个人主页支持简单的个性化配置啦 

只需要修改`config/init.json`文件即可

按钮的图标使用**font awesome**，你可以在这里找到所有的图标：[https://fontawesome.com/icons](https://fontawesome.com/icons)
使用图标时不需要加上前缀，例如`fa-github`只需要填写`github`即可

```json
{
  "name": "CCRICE",
  "title": "Hi~\nTHERE IS",
  "subtitle": "一个普通的大学生",
  "description": "喜欢玩游戏、看动漫，热衷于尝试各种新鲜的东西。会些一些简单的代码，目前基本掌握的编程语言大概只有Dart和与她配套的Flutter~",
  "backgroundImage":"assest/bg.jpg", //背景图片 如果是其他域名的链接需要注意CORS限制
  "blogButton": [
    {
      "name":"小世界",
      "url": "https://world.ccrice.com",
      "icon": "blog", //图标使用font awesome中的图标名称，不带前缀
      "iconColor": "0xFFFFFFFF",
      "backgroundColor": "0xff7ebea5",
      "textColor": "0xFFFFFFFF"
    },
    {
      "name":"小仓库",
      "url": "https://box.ccrice.com",
      "icon": "boxArchive",
      "iconColor": "0xFFFFFFFF",
      "backgroundColor": "0xff745399",
      "textColor": "0xFFFFFFFF"
    }
  ],
  "footer": "Copyright © 2024 CCRICE. All Rights Reserved.",
  "ability": [
    {
      "name": "Flutter",
      "level": "0.8"  //0-1之间的数字
    },
    {
      "name": "PHP",
      "level": "0.6"
    }
  ]
}
```

## 预构建版本

你可以在Release页面找到预构建版本,分为canvaskit和skwasm版本，两个版本唯一区别是渲染器不同，你可以根据你的需求选择使用哪一个。

总的来说，skwasm版本性能可能更好，但会增加文件大小，wasm版本兼容性更好。

关于渲染器的详细介绍请查看Flutter官方文档：[https://docs.flutter.cn/platform-integration/web/renderers](https://docs.flutter.cn/platform-integration/web/renderers)

## 关于CORS的问题
在配置友情链接图片的时候可能会遇到CORS问题，目前的解决办法是把友链的图片下载到本地。你可以先按照原来的方法配置好links.json文件，然后把图片下载到本地，然后把图片的路径改为本地的路径，
之后使用script文件夹中的downimg.py脚本，自动把配置文件中的图片下载到本地并且自动修改图片链接。