import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
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
  List questions = [   
       //2 ways to add const
       //const questions = [ ]   or   questions = const [ ]    jiske saamne add kro wo const(variable or value)
      //Map   questionText is a key....the key could be anything like number string etc..
      {
        'questionText': 'Who is the mother of Bhishma?',
        'answers': ['Dharti', 'Varsha', 'Ganga', 'Amba'],
        //Ganga
      },
      {
        'questionText': 'Abhimanyu was whose son?',
        'answers': ['Yudhisthir', 'Bheem', 'Arjun', 'Nakul', 'Sahdev'],
        //Arjun
      },
      {
        'questionText': 'Who was the sister of Krishna Vasudev?',
        'answers': ['Draupadi', 'Kunti', 'Subhadra', 'Gandhari'],
        //Shubhadra
      },
      {
        'questionText': 'Who was the son of Bheem?',
        'answers': ['Abhimanyu', 'Ghatotkaj', 'Yudhisthir', 'Duryodhan'],
        //Ghatotkaj
      },
      {
        'questionText': 'What was the name of pandava\'s Kingdom?',
        'answers': ['Hastinapur', 'Dwarka', 'Indraprastha', 'Gandhar'],
        //Indraprastha
      },
    ];
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      //calls  the build function again
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if(_questionIndex < questions.length){
       print('We have more questions!');
     }
     else{
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
        body: _questionIndex < questions.length ?  Column(   //ternary expression
          children: [
            Question(
              questions[_questionIndex]['questionText'],   //enclose in square bracket if you need to access some specific key
            ),
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {       // ...spread operator
              return Answer(_answerQuestion, answer);
            }).toList()
            // Answer(_answerQuestion), //forward pointer so no parenthesis
            // Answer(_answerQuestion),
            // Answer(_answerQuestion),
            // ElevatedButton(
            //   child: Text('Answer 2'),
            //   onPressed: () => print('Answer 2 chosen!'),
            // ),
            // ElevatedButton(
            //   child: Text('Answer 3'),
            //   onPressed: () => print('Answer 3 chosen!'),
            // ),
          ],
        ) : Center(child: Text('You did it!'),),
      ),
    );
  }
}
