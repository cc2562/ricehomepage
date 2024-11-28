import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:web/web.dart';

import 'package:ricehomepage/generated/assets.dart';

Future<List> getLinkList() async {
  final String linkJsonFile = await rootBundle.loadString(Assets.configLinks);
  //var linkJsonFile =File(Assets.configLinks);
  List jsonList =await json.decode(linkJsonFile);
  //print(jsonList[0].toString());
  return jsonList;

}