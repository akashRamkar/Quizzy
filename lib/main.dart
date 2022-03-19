import 'package:flutter/material.dart';
import 'package:quizzy/question_bank.dart';

void main() {
  runApp(const MyApp());
}

QuestionBank bank = QuestionBank();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Icon> solution = [];
  /*
  *
  *   Icon(
      Icons.check,
      color: Colors.white,
    ),
    * */
  void updateIcons(bool expectedAnswer) {
    if (bank.resetFlagOn == true) {
      solution.clear();
      bank.resetFlagOn = false;
    }
    if (expectedAnswer == true) {
      solution.add(const Icon(
        Icons.check,
        color: Colors.green,
        size: 28,
      ));
    } else {
      solution.add(Icon(
        Icons.clear,
        color: Colors.red,
        size: 28,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizzy App',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 100,
                          // color: Colors.green,

                          child: Center(
                            child: Text(
                              bank.nextQuestion(),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 28.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 230,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 100,
                          color: Colors.green,
                          child: TextButton(
                            onPressed: () {
                              setState(
                                () {
                                  if (bank.getAnswerOfQuestionNo(
                                          bank.getQuestionNo()) ==
                                      true) {
                                    //do something
                                    updateIcons(true);
                                  } else {
                                    updateIcons(false);
                                  }
                                  bank.increaseCounter();
                                },
                              );
                            },
                            child: Text(
                              'True',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 100,
                          color: Colors.red,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                if (bank.getAnswerOfQuestionNo(
                                        bank.getQuestionNo()) ==
                                    false) {
                                  //do something
                                  updateIcons(true);
                                } else {
                                  updateIcons(false);
                                }
                                bank.increaseCounter();
                              });
                            },
                            child: Text(
                              'False',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: solution,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
