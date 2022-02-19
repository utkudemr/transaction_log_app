import 'package:flutter/material.dart';
import 'package:transaction_log_app/helper/logger.dart';

class BaseButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ValueKey buttonKey;
  const BaseButton({required this.buttonKey,required this.text,required this.onPressed}) : super(key: buttonKey);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: baseButtonOnPressed, child: Text(text));
  }

   void baseButtonOnPressed(){
     TraceLogger.log(buttonKey.value);
     onPressed;
   }  
  

}