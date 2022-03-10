import 'package:flutter/material.dart';
import 'package:transaction_log_app/base/base_view.dart';
import 'package:transaction_log_app/base/widget/base_appbar.dart';
import 'package:transaction_log_app/base/widget/base_button.dart';
import 'package:transaction_log_app/view/widgets/log_list.dart';

class Page3 extends StatefulWidget {
  final String title = "Page3";
  const Page3({Key? key}) : super(key: key);

  @override
  Page3State createState() => Page3State();
}

class Page3State extends State<Page3> {
  late GlobalKey _key;
  late ValueKey logListKey;

  @override
  void initState() {
    _key = GlobalKey();
    logListKey = const ValueKey("LogListPage3");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewKey: ValueKey(widget.title),
        builder: (context) {
          return Scaffold(
              key: _key,
              appBar: BaseAppBar(title: widget.title),
              floatingActionButton: BaseCircleButton(
                key: const ValueKey("Page3NextButton"),
                onPressed: () async {
                  setState(() {
                    
                  });
                },
              ),
              body: LogList(key: logListKey));
        });
  }
}
