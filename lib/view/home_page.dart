import 'package:flutter/material.dart';
import 'package:transaction_log_app/base/base_view.dart';
import 'package:transaction_log_app/base/widget/base_appbar.dart';
import 'package:transaction_log_app/base/widget/base_button.dart';
import 'package:transaction_log_app/helper/local_storage_helper.dart';
import 'package:transaction_log_app/view/page2.dart';
import 'package:transaction_log_app/view/widgets/log_list.dart';

class HomePage extends StatefulWidget {
  final String title = "HomePage";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  late ValueKey logListKey;
  @override
  void initState() {
    SharedPreferenceService.instance?.getStringList("traceLog");
    logListKey = const ValueKey("LogListPage2");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewKey: ValueKey(widget.title),
        builder: (context) {
          return Scaffold(
              appBar:
                  BaseAppBar(leadingIconIsActive: false, title: widget.title),
              floatingActionButton: BaseCircleButton(
                key: const ValueKey("HomePageNextButton"),
                onPressed: () async {
                 await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const Page2(), //pass any arguments
                          settings: const RouteSettings(name: "page2")));
                  setState(() {});
                },
              ),
              body: LogList(
                key: ValueKey(logListKey),
              ));
        });
  }
}
