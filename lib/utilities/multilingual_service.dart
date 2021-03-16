import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/widgets/multilingual.dart';

String getText(String key,BuildContext context)
{
  String text= Multilingual.of(context).getText(key);
 
  return text;
}
