import 'package:flutter/material.dart';
import 'package:transaction_log_app/base/extension/context_extension.dart';

class BaseButton extends StatefulWidget {
  @mustCallSuper
  final Widget? buttonWidget;

  final Future Function() onPressed;
  final ValueKey buttonKey;
  final Color? buttonColor;
  @mustCallSuper
  final OutlinedBorder? outLineType;

  @mustCallSuper
  final EdgeInsetsGeometry buttonPadding;

  const BaseButton(
      {required this.buttonKey,
      required this.buttonWidget,
      required this.onPressed,
      this.buttonColor,
      this.outLineType = const BeveledRectangleBorder(),
      this.buttonPadding = EdgeInsets.zero})
      : super(key: buttonKey);
  @override
  State<StatefulWidget> createState() => BaseButtonState();
}

class BaseButtonState extends State<BaseButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed:()async=> await baseButtonOnPressed(),
        style: ElevatedButton.styleFrom(
            primary: widget.buttonColor,
            shape: widget.outLineType,
            padding: customPadding,
            elevation: 0,
            onPrimary: Colors.black,
            splashFactory: InkRipple.splashFactory,
            textStyle: const TextStyle(color: Colors.white)),
        child: widget.buttonWidget);
  }

  Future baseButtonOnPressed() async{
      context.log(widget.buttonKey.value);
      await widget.onPressed();
  }
}

class BaseCircleButton extends BaseButton {
  const BaseCircleButton(
      {required ValueKey key,
      Color? color = Colors.blue,
      Widget? buttonWidget,
      required Future Function() onPressed})
      : super(
            buttonKey: key,
            buttonColor: color,
            buttonWidget: buttonWidget,
            onPressed: onPressed);

  @override
  CircleBorder get outLineType => const CircleBorder();

  @override
  Widget? get buttonWidget =>
      const Icon(Icons.arrow_right_alt_rounded, color: Colors.white);
}

class BaseIconButton extends BaseButton {
  const BaseIconButton(
      {required ValueKey key,
      Widget? buttonWidget,
      required Future Function() onPressed})
      : super(buttonKey: key, buttonWidget: buttonWidget, onPressed: onPressed);

  @override
  Widget? get buttonWidget => const Icon(Icons.arrow_back, color: Colors.white);
}
