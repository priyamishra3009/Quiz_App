import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Question extends StatelessWidget {
  final String
      questionText; //this value with never change after initialization due to final keyword

  Question(
      this.questionText); //enclosed in curly bracers : named argument ;  without that : positional argument

  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      margin: EdgeInsets.all(10),    //spacing around container
      //padding is internal spacing inside the container
      //child->padding->border->margin   (from inside to out)
        child: Text(
      questionText,
      style: TextStyle(fontSize: 30, color: Colors.white),
      textAlign: TextAlign.center,
    ));
  }
}
