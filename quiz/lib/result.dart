import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText = 'You did it!';
    if (resultScore == 5) {
      resultText =
          'You did it! Congratulations on your remarkable achievement of scoring full marks!';
    } else if (resultScore < 5 && resultScore >= 3) {
      resultText =
          'You did it! You are incredibly close to achieving full marks; you\'re just a step away!';
    } else {
      resultText =
          'You did it! By investing more effort and dedicating yourself to the task at hand, you will be able to make significant progress.';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            child: Text('Restart Quiz!', style: TextStyle(color: Colors.black,fontSize: 17)),
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
