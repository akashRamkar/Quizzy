class Questions {
  String question = '';
  bool answer = false;
  Questions(String q, bool ans) {
    question = q;
    answer = ans;
  }
  bool getAnswer() {
    return this.answer;
  }

  String getCurrentQuestion() {
    return this.question;
  }
}
