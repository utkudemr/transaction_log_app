import 'package:flutter/material.dart';
import 'package:transaction_log_app/base/extension/context_extension.dart';

class BaseIconButtons extends StatefulWidget {
  final Icon icon;
  final VoidCallback onPressed;
  final ValueKey buttonKey;
  const BaseIconButtons({required this.buttonKey,required this.icon,required this.onPressed}) : super(key: buttonKey);
  @override
  State<StatefulWidget> createState() =>BaseIconButtonState();
}

class BaseIconButtonState extends State<BaseIconButtons>{
   @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: baseButtonOnPressed, icon:widget.icon,key: widget.buttonKey);
  }

  void baseButtonOnPressed(){
     context.log(widget.buttonKey.value);
     widget.onPressed();
  }  
}

