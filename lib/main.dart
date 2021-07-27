import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
          backgroundColor: Colors.green,
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: QuizPage(),
        ),
      ),
    );
  }
}

// widget containing question and answer section
class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // score keeping list of icons
  List<Icon> scoreKeeper = [
    Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(Icons.close, color: Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 100.0), // padding from the top of the screen
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // container for True button
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        scoreKeeper.add(
                          Icon(Icons.check,
                              color: Colors
                                  .green), // when pressed add the Icon check to the scoreKeeper list
                        );
                      });
                    },
                    child: Text(
                      "True",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                SizedBox(
                  // empty space in between true and false
                  width: 40.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        scoreKeeper.add(
                          Icon(Icons.close,
                              color: Colors
                                  .red), // when pressed add the Icon close in the scoreKeeper list
                        );
                      });
                    },
                    child: Text("False", style: TextStyle(color: Colors.red)),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: scoreKeeper, // score keeping
          ),
        ],
      ),
    );
  }
}
