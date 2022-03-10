import 'package:flutter/cupertino.dart';
import 'package:transaction_log_app/base/widget/base_button.dart';
import 'package:transaction_log_app/helper/local_storage_helper.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension LogExtension on BuildContext {
  void log(String actionName) {
    var pageName = ModalRoute.of(this)!.settings.name!;
    debugPrint("$pageName  -  $actionName");
    var logDate = DateTime.now();
    SharedPreferenceService.instance
        ?.saveStringList("traceLog", "$logDate  |  $pageName  |  $actionName");
  }
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;
}

extension ButtonSizeExtension on BuildContext {
  double get floatingActionButton => mediaQuery.size.height / 30;
}

extension ButtonPaddingExtension on State<BaseButton> {
  EdgeInsetsGeometry? get customPadding {
    switch (widget.outLineType.runtimeType) {
      case CircleBorder:
        return EdgeInsets.all(context.floatingActionButton);
      default:
        EdgeInsets.zero;
    }
  }
}
