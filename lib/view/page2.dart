import 'package:flutter/material.dart';
import 'package:transaction_log_app/base/base_view.dart';
import 'package:transaction_log_app/base/widget/base_appbar.dart';
import 'package:transaction_log_app/base/widget/base_button.dart';
import 'package:transaction_log_app/view/page3.dart';
import 'package:transaction_log_app/view/widgets/log_list.dart';

class Page2 extends StatefulWidget {
  final String title = "Page2";
  const Page2({Key? key}) : super(key: key);

  @override
  Page2State createState() => Page2State();
}

class Page2State extends State<Page2> {
  late GlobalKey _key;
  late ValueKey logListKey;

  @override
  void initState() {
    _key = GlobalKey();
    logListKey = const ValueKey("LogListPage2");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewKey: ValueKey(widget.title),
        builder: (context) {
          return Scaffold(
              key: _key,
              appBar: BaseAppBar(
                title: widget.title,
                leadingFunction: () async {},
              ),
              floatingActionButton: BaseCircleButton(
                key: const ValueKey("Page2NextButton"),
                onPressed: () async {
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const Page3(), //pass any arguments
                          settings: const RouteSettings(name: "page3")));
                  setState(() {});
                },
              ),
              body: LogList(key: logListKey));
        });
  }
}
