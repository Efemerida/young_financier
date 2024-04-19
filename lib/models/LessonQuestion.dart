import 'dart:typed_data';

class LessonQuestion{

  int? id;
  String question;
  String answer1;
  String answer2;
  String answer3;
  String answer4;
  int numCorrect;
  int lesson_id;


  LessonQuestion({this.id, required this.question, required this.answer1,
    required this.answer2, required this.answer3,
    required this.answer4, required this.numCorrect, required this.lesson_id});

  LessonQuestion.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        question = res["question"],
        answer1 = res["answer1"],
        answer2 = res["answer2"],
        answer3 = res["answer3"],
        answer4 = res["answer4"],
        lesson_id = res["lesson_id"],
      numCorrect = res["numCorrect"];


  Map<String, Object?> toMap() {
    return {'id': id, 'question': question, 'answer1': answer1, "answer2": answer2,
      'answer3': answer3, 'answer4': answer4, 'lesson_id': lesson_id, "numCorrect": numCorrect};
  }

}