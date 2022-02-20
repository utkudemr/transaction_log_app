import 'package:flutter/cupertino.dart';
class BaseView<T> extends StatefulWidget {
  final Widget Function(BuildContext context) builder;
  final ValueKey viewKey;
  const BaseView({required this.viewKey, required this.builder}):super(key:viewKey);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();

} 

class _BaseViewState<T> extends State<BaseView<T>> {
  late String pageName;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}


