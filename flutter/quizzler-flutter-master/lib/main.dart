import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionNumber = 0;

  List<List> questionContent = [
    [
      'You can lead a cow down stairs but not up stairs.',
      'Approximately one quarter of human bones are in the feet.',
      'A slug\'s blood is green.',
      'A dog is fast'
    ],
    [false, true, true, true]
  ];
  List<Widget> rowList = [];

  List<Widget> appendToRowList(
      int questionNumber, List<List> questionContent, bool question) {
    if (questionContent[1][questionNumber] == question) {
      print(questionContent[1][questionNumber]);
      rowList.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
      return rowList;
    } else {
      print(question);
      print(questionContent[1][questionNumber]);
      rowList.add(Icon(Icons.close, color: Colors.red));
      return rowList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionContent[0][questionNumber],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  bool question = true;
                  appendToRowList(questionNumber, questionContent, question);
                  questionNumber++;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  bool question = false;
                  appendToRowList(questionNumber, questionContent, question);
                  questionNumber++;
                });
              },
            ),
          ),
        ),
        Row(
          children: rowList,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
