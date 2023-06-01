import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';
//format doc- shift alt f
//refactor- ctrl shift r

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState(); //adding underscore _ changes it from public to private
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = [
    //2 ways to add const
    //const questions = [ ]   or   questions = const [ ]    jiske saamne add kro wo const(variable or value)
    //Map   questionText is a key....the key could be anything like number string etc..
    {
      'questionText': 'Who is the mother of Bhishma?',
      'answers': [
        {'text': 'Dharti', 'score': 0},
        {'text': 'Varsha', 'score': 0},
        {'text': 'Ganga', 'score': 1},
        {'text': 'Amba', 'score': 0}
      ],
      //Ganga
    },
    {
      'questionText': 'Abhimanyu was whose son?',
      'answers': [
        {'text': 'Yudhisthir', 'score': 0},
        {'text': 'Bheem', 'score': 0},
        {'text': 'Arjun', 'score': 1},
        {'text': 'Nakul', 'score': 0},
        {'text': 'Sahdev', 'score': 0}
      ],
      //Arjun
    },
    {
      'questionText': 'Who was the sister of Krishna Vasudev?',
      'answers': [
        {'text': 'Draupadi', 'score': 0},
        {'text': 'Kunti', 'score': 0},
        {'text': 'Subhadra', 'score': 1},
        {'text': 'Gandhari', 'score': 0},
      ],
      //Shubhadra
    },
    {
      'questionText': 'Who was the son of Bheem?',
      'answers': [
        {'text': 'Abhimanyu', 'score': 0},
        {'text': 'Ghatotkaj', 'score': 1},
        {'text': 'Yudhisthir', 'score': 0},
        {'text': 'Duryodhan', 'score': 0},
      ]
      //Ghatotkaj
    },
    {
      'questionText': 'What was the name of pandava\'s Kingdom?', 
      'answers': [
        {'text': 'Duryodhan', 'score': 0},
        {'text': 'Hastinapur', 'score': 0},
        {'text': 'Dwarka', 'score': 0},
        {'text': 'Indraprastha', 'score': 1},
        {'text': 'Gandhar', 'score': 0},
      ],
      //Indraprastha
    },
    // child: Text(questionText, style: TextStyle(color: Colors.black)),
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      //calls  the build function again
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // List dummy = ['Hello'];
    // dummy.add('Max');      //add modifies the original list
    //List dummy = const [];  now we cant use add function in this
    // questions = [];  this doesnt work if questions is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://i.pinimg.com/564x/da/bb/10/dabb10552fc40af447d8ee0cf3c8a682.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz),
        ),
      ),
    );
  }
}
