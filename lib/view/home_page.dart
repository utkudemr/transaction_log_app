import 'package:flutter/material.dart';
import 'package:transaction_log_app/base/base_view.dart';
import 'package:transaction_log_app/base/widget/base_button.dart';

class HomePage extends StatelessWidget {
  final String title = "HomePage";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewKey: ValueKey(title),
        builder: (context) {
          return Scaffold(
              appBar: AppBar(title: Text(title)),
              floatingActionButton: BaseButton(
                buttonKey: const ValueKey("NextButton"),
                text: "--> Page2",
                onPressed: () {
                  debugPrint("pageName");
                },
              ),
              body: Center(child: Text(title)));
        });
  }
}
