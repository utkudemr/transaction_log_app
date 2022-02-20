import 'package:flutter/material.dart';
import 'package:transaction_log_app/view/home_page.dart';
import 'package:transaction_log_app/view/page2.dart';



class RouterManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'home':
        return MaterialPageRoute(settings:settings,builder: (_) => const HomePage(key:Key("Home")));
      case 'page2':
        return MaterialPageRoute(settings:settings,builder: (_) => const Page2(key:Key("Page2")));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
