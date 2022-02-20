import 'package:flutter/material.dart';
import 'package:transaction_log_app/base/base_view.dart';
import 'package:transaction_log_app/base/widget/base_button.dart';

class Page2 extends StatelessWidget {
  final String title = "Page2";
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewKey: ValueKey(title),
        builder: (context) {
          return Scaffold(
              appBar: AppBar(title: Text(title)),
              floatingActionButton: BaseButton(
                buttonKey: const ValueKey("Page2NextButton"),
                text: "--> Page3",
                onPressed: () {
                 
                },
              ),
              body: Center(child: Text(title)));
        });
  }
}
