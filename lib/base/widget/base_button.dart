import 'package:flutter/material.dart';


class BaseButton extends StatefulWidget{
  final String text;
  final VoidCallback onPressed;
  final ValueKey buttonKey;
  const BaseButton({required this.buttonKey,required this.text,required this.onPressed}) : super(key: buttonKey);
  @override
  State<StatefulWidget> createState() =>BaseButtonState();
}

class BaseButtonState extends State<BaseButton>{
   @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: baseButtonOnPressed, child: Text(widget.text));
  }

   void baseButtonOnPressed(){
     context.log(widget.buttonKey.value);
     widget.onPressed();
   }  
}

extension on BuildContext {
  void log(String actionName){
    var pageName=ModalRoute.of(this)!.settings.name!;
    debugPrint("$pageName  -  $actionName");
  }
}
