import 'package:flutter/material.dart';
import 'package:transaction_log_app/view/home_page.dart';

import 'helper/local_storage_helper.dart';
import 'helper/router.dart';

void main() async{
  await SharedPreferenceService.instance?.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: RouterManager.generateRoute,
      initialRoute: 'home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
