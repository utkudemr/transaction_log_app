import 'package:flutter/material.dart';
import 'base_button.dart';

class BaseAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Future Function()? leadingFunction;
  final bool leadingIconIsActive;

  const BaseAppBar(
      {Key? key,
      required this.title,
      this.leadingFunction,
      this.leadingIconIsActive = true})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return BaseAppBarState();
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class BaseAppBarState extends State<BaseAppBar> {
  final String appBarButtonName = "BackButton";
  late final String buttonKeyValue;
  @override
  void initState() {
    buttonKeyValue = "${widget.title}$appBarButtonName";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: Key(widget.title),
      centerTitle: true,
      leading: Visibility(
        visible: widget.leadingIconIsActive,
        child: BaseIconButton(
            key: ValueKey(buttonKeyValue),
            onPressed: () async => await leadingFunction()),
      ),
      title: Text(widget.title),
    );
  }

  Future leadingFunction() async {
    if (widget.leadingFunction != null) {
      await widget.leadingFunction!();
    }
    Navigator.pop(context, 'Yep!');
  }
}
