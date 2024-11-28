import 'dart:ui';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:enhanced_future_builder/enhanced_future_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motion/motion.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ricehomepage/generated/assets.dart';
import 'package:ricehomepage/linkcard.dart';
import 'package:ricehomepage/logic.dart';
import 'package:rive/rive.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  await Motion.instance.initialize();
  Motion.instance.setUpdateInterval(60.fps);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CC米饭的空间站',
      theme: ThemeData(
        fontFamily: 'healthy',
        fontFamilyFallback: [
          'Arial',
          "Noto Sans Symbols",
          '华文细黑',
          'Microsoft YaHei',
          '微软雅黑',
          'Roboto',
          'sans-serif'
        ],
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      builder: (context, child) {
        return ResponsiveBreakpoints.builder(
          child: MyHomePage(title: 'Flutter Demo Home Page'),
          breakpoints: [
            const Breakpoint(start: 0, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> LaunchUrl(String url) async {
    var thurl = Uri.parse(url);
    if (!await launchUrl(thurl)) {
      throw Exception('Could not launch $thurl');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    Future<void> showPermissionRequestDialog(BuildContext context,
        {required Function() onDone}) async {
      return showDialog<void>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text('权限申请'),
                content: const Text(
                    '看起来你正在使用ios 13+版本浏览这个网站，您需要授予陀螺仪访问权限\n授予后网站会有更炫酷的效果'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('拒绝'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Motion.instance.requestPermission();
                    },
                    child: const Text('同意'),
                  ),
                ],
              ));
    }

    if (Motion.instance.isPermissionRequired &&
        !Motion.instance.isPermissionGranted) {
      showPermissionRequestDialog(
        context,
        onDone: () {
          setState(() {});
        },
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
            color: Colors.black87,
            image: DecorationImage(
                image: AssetImage(Assets.assestBg), fit: BoxFit.cover)),
        child: Stack(
          children: [
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 20),
                child: Container(
                  color: Colors.black.withValues(alpha: 100),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const RiveAnimation.asset(
                fit: BoxFit.cover,
                Assets.assestBgri,
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                child: const SizedBox(),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: ResponsiveBreakpoints.of(context).isTablet
                            ? EdgeInsets.fromLTRB(20, 100, 20, 0)
                            : EdgeInsets.fromLTRB(120, 100, 120, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi~\nTERE IS',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize:
                                    ResponsiveBreakpoints.of(context).isTablet
                                        ? 50
                                        : 120,
                                color: Colors.white,
                                height: 1,
                                letterSpacing: 8,
                              ),
                            ).animate().fadeIn(duration: 1.seconds),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'CCRICE',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize:
                                    ResponsiveBreakpoints.of(context).isTablet
                                        ? 70
                                        : 180,
                                color: Colors.white,
                                height: 1,
                                letterSpacing: 8,
                              ),
                            )
                                .animate(
                                    onPlay: (controller) =>
                                        controller.repeat(reverse: false))
                                .saturate(
                                    delay: 0.5.seconds, duration: 0.5.seconds)
                                .then() // set baseline time to previous effect's end time
                                .tint(color: const Color(0xFF80DDFF))
                                .then(delay: 1.seconds)
                                .tint(color: const Color(0xffaacf53))
                                .then(delay: 1.seconds)
                                .tint(color: Color(0xffeb6ea5))
                                .then(delay: 1.seconds)
                                .tint(color: Colors.white)
                          ],
                        )),
                    Container(
                      padding: ResponsiveBreakpoints.of(context).isTablet
                          ? EdgeInsets.fromLTRB(10, 0, 10, 0)
                          : EdgeInsets.fromLTRB(120, 0, 120, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '一名普通的大学生',
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              height: 1,
                              letterSpacing: 0,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '喜欢玩游戏、看动漫，热衷于尝试各种新鲜的东西。会些一些简单的代码，目前基本掌握的编程语言大概只有Dart和与她配套的Flutter',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              letterSpacing: 0,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 50,
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    LaunchUrl('https://world.ccrice.com');
                                   
                                  },
                                  label: Text("小世界"),
                                  icon: FaIcon(
                                    FontAwesomeIcons.blog,
                                    color: Colors.white,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Color(0xff7ebea5),
                                    //change text color of button
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                height: 50,
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    LaunchUrl('https://box.ccrice.com');
                                  },
                                  label: Text("小仓库"),
                                  icon: FaIcon(
                                    FontAwesomeIcons.boxArchive,
                                    color: Colors.white,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Color(0xff745399),
                                    //change text color of button
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                height: 50,
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    LaunchUrl('https://github.com/cc2562');
                                  },
                                  label: Text("Github"),
                                  icon: FaIcon(
                                    FontAwesomeIcons.github,
                                    color: Colors.white,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.black87,
                                    //change text color of button
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          //技能点
                          Padding(
                            padding: ResponsiveBreakpoints.of(context).isTablet
                                ? EdgeInsets.fromLTRB(10, 10, 10, 10)
                                : ResponsiveBreakpoints.of(context).isDesktop
                                    ? EdgeInsets.fromLTRB(120, 10, 120, 10)
                                    : EdgeInsets.fromLTRB(400, 10, 400, 10),
                            child: Motion.elevated(
                              elevation: 99,
                              glare: false,
                              filterQuality: FilterQuality.high,
                              controller: MotionController(damping: 1),
                              child: BlurryContainer(
                                width: MediaQuery.of(context).size.width,
                                blur: 0,
                                color: Colors.black54.withValues(alpha: 180),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "技能点",
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.white),
                                      ),
                                      MediaQuery.removePadding(
                                        context: context,
                                        child: GridView(
                                          physics: NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount:
                                                      ResponsiveBreakpoints.of(
                                                                  context)
                                                              .smallerThan('4K')
                                                          ? 1
                                                          : 2,
                                                  childAspectRatio:
                                                      ResponsiveBreakpoints.of(
                                                                  context)
                                                              .isTablet
                                                          ? 10
                                                          : 15,
                                                  crossAxisSpacing: 20,
                                                  mainAxisSpacing: 0),
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Flutter",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                SizedBox(
                                                  child:
                                                      LinearProgressIndicator(
                                                    value: 0.7,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "PHP",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                  child:
                                                      LinearProgressIndicator(
                                                    value: 0.5,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Python",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                  child:
                                                      LinearProgressIndicator(
                                                    value: 0.3,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "玩游戏",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                  child:
                                                      LinearProgressIndicator(
                                                    value: 0.9,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "什么都会一些，又什么都不会",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //友情链接
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: ResponsiveBreakpoints.of(context).isTablet
                                ? EdgeInsets.fromLTRB(10, 10, 10, 10)
                                : ResponsiveBreakpoints.of(context).isDesktop
                                    ? EdgeInsets.fromLTRB(120, 10, 120, 10)
                                    : EdgeInsets.fromLTRB(400, 10, 400, 10),
                            child: Motion.elevated(
                              elevation: 99,
                              glare: false,
                              filterQuality: FilterQuality.high,
                              controller: MotionController(damping: 1),
                              child: BlurryContainer(
                                width: MediaQuery.of(context).size.width,
                                blur: 0,
                                color: Colors.black54.withValues(alpha: 180),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "好朋友",
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.white),
                                      ),
                                      MediaQuery.removePadding(
                                        context: context,
                                        child:EnhancedFutureBuilder(
                                            future: getLinkList(),
                                            rememberFutureResult: true,
                                            whenDone: (List linklist){
                                              return  GridView.builder(
                                                physics: NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount:
                                                    ResponsiveBreakpoints.of(
                                                        context)
                                                        .isTablet
                                                        ? 2
                                                        : ResponsiveBreakpoints
                                                        .of(
                                                        context)
                                                        .isDesktop
                                                        ? 3
                                                        : 4,
                                                    childAspectRatio:
                                                    ResponsiveBreakpoints.of(
                                                        context)
                                                        .isTablet
                                                        ? 2
                                                        : 3,
                                                    crossAxisSpacing: 10,
                                                    mainAxisSpacing: 10),
                                                itemBuilder: (BuildContext context, int index) {
                                                  return linkcard(data: linklist[index],);
                                                },
                                                itemCount: linklist.length,
                                              );
                                            },
                                            whenNotDone: Text("Loading")),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 180,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                width: MediaQuery.of(context).size.width,
                height: 80,
                //color: Colors.white.withValues(alpha: 180),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                        child: Text(
                      "Copyright © 2024 CC米饭",
                      style: TextStyle(color: Colors.white),
                    )),
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "由Flutter强力驱动",
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
