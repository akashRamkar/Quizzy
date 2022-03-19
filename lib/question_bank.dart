import 'package:quizzy/questions.dart';

class QuestionBank {
  static int _counter = 0;
  bool resetFlagOn = false;
  List<Questions> _questions = [
    Questions('is parrot green', true),
    Questions('delhi is capital of bhutan', false),
    Questions('Mango is pink', false),
    Questions('flutter is awesome', true),
    Questions('human has 3 eyes', false),
    Questions('Mumbai is capital of Maharashtra', true),
    Questions('plasma is not a state of matter', false),
    Questions('Peacock is beautiful bird', true),
  ];
  List<Questions> getQuestionsList() {
    return _questions;
  }

  void increaseCounter() {
    _counter++;
    if (_counter == _questions.length) {
      _counter = 0;
      resetFlagOn = true;
    }
  }

  bool getAnswerOfQuestionNo(int Qno) {
    return _questions[Qno].getAnswer();
  }

  int getQuestionNo() {
    return _counter;
  }

  String nextQuestion() {
    if (_counter < _questions.length - 1) {
      return _questions[_counter].getCurrentQuestion();
    } else {
      return _questions[_questions.length - 1].getCurrentQuestion();
    }
  }
}
