import 'dart:convert';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class linkcard extends StatefulWidget {
  const linkcard({super.key,required this.data});
  final Map data;
  @override
  State<linkcard> createState() => _linkcardState();
}

class _linkcardState extends State<linkcard> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> myAnimation;
  late Map dataMap;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // print(widget.data['link_name']);
    //dataMap  =json.decode(widget.data);
   // print(dataMap);
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    myAnimation = Tween<double>(begin: 0, end: 200).animate(controller);
  }

  
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void _hover(bool isHovered) {
    if (isHovered) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }



  @override
  Widget build(BuildContext context) {
    String name=widget.data['link_name'];
    return InkWell(
      onHover: (v){
        _hover(v);
        controller.addListener(
                (){
              setState(() {
                myAnimation.value;
              });
            }
        );
      },
      onTap: () async {
        var thurl = Uri.parse(widget.data['link_url']);
        if (!await launchUrl(thurl)) {
        throw Exception('Could not launch $thurl');
        }
      },
      borderRadius: BorderRadius.circular(20),
      child:  BlurryContainer(
        color: Colors.purple.withAlpha(myAnimation.value.toInt()),
        child:Container(
          child: Flex(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 2,
                child: CircleAvatar(
                  child: Text(name.substring(0,1)),
                  foregroundImage: NetworkImage(widget.data['link_image']),
                  radius: 40,
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                flex: 3,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.data['link_name'],
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors
                              .white),
                    ),
                    Text(
                      widget.data['link_description']==""?"没有简介欸~" : widget.data['link_description'],
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors
                              .white60),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
