import 'package:flutter/cupertino.dart';

class TraceLogger{
  static late String pageName;
  static void log(String actionName){
    debugPrint("$pageName  -  $actionName");
  }
}