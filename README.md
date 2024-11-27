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
