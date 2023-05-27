import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              Colors.blue, // Use a Color object for a specific shade of blue
        ),
        child: Text(answerText, style: TextStyle(color: Colors.black)),
        onPressed: () {
          //The error is occurring because the onPressed property of the ElevatedButton is expecting a function or callback, but you have passed selectHandler directly.
          selectHandler(); // Call the selectHandler function
        },
      ),
    );
  }
}
