import 'dart:ui';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ricehomepage/generated/assets.dart';
import 'package:rive/rive.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
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
        fontFamilyFallback: ['Arial',"Noto Sans Symbols",'华文细黑','Microsoft YaHei','微软雅黑','Roboto','sans-serif'],
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
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.question,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        color: Colors.black87,
        child: Stack(
          children: [
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 20),
                child: const SizedBox(),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const RiveAnimation.asset(
                fit: BoxFit.cover,
                Assets.assestShapes,
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
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 100, 10, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi~\nTERE IS',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize:
                                  ResponsiveBreakpoints.of(context).isTablet
                                      ? 80
                                      : 120,
                              color: Colors.white,
                              height: 1,
                              letterSpacing: 0,
                            ),
                          ).animate().fadeIn(duration: 1.seconds),
                          Text(
                            'CCRICE',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize:
                                  ResponsiveBreakpoints.of(context).isTablet
                                      ? 100
                                      : 180,
                              color: Colors.white,
                              height: 1,
                             // letterSpacing: 0,
                            ),
                          )
                              .animate(
                                  onPlay: (controller) =>
                                      controller.repeat(reverse: false))
                              .saturate(delay: 0.5.seconds, duration: 1.seconds)
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
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
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
                          height: 50,
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
                          height: 50,
                        ),
                        Padding(
                          padding: ResponsiveBreakpoints.of(context).isTablet
                              ? EdgeInsets.fromLTRB(10, 10, 10, 10)
                              : EdgeInsets.fromLTRB(120, 10, 120, 10),
                          child: BlurryContainer(
                            width: MediaQuery.of(context).size.width,
                            blur: 50,
                            color: Colors.white.withValues(alpha: 180),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              decoration: BoxDecoration(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                                      : 20,
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
                                              child: LinearProgressIndicator(
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
                                              child: LinearProgressIndicator(
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
                                              child: LinearProgressIndicator(
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
                                              child: LinearProgressIndicator(
                                                value: 0.9,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "什么都会一些，又什么都不会",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 100,),
                      ],
                    ),
                  ),
                ],
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
