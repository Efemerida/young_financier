import 'package:flutter/material.dart';
import 'package:young_financier/models/LessonQuestion.dart';

class ListLesson extends StatelessWidget {
  LessonQuestion lessonQuestion;
  Widget checkButton;

  static int currentAns = 0;

  ListLesson({required this.lessonQuestion, required this.checkButton, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        instruction('Ответье на вопрос'),
        const Padding(padding: EdgeInsets.only(top: 15)),
        questionRow(lessonQuestion.question),
        Expanded(
          child: Center(
            child: Column(
              children: [
                InkWell(
                  onTap: check1,
                  child: listChoice(lessonQuestion.answer1),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 15)),
                InkWell(
                  onTap: check2,
                  child: listChoice(lessonQuestion.answer2),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 15)),
                InkWell(
                  onTap: check3,
                  child: listChoice(lessonQuestion.answer3),
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        checkButton,
      ],
    );
  }

  listChoice(String title) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 15, right: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 2.5,
          color: const Color(0xFFE5E5E5),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 17),
      ),
    );
  }

  questionRow(String question) {
    return Container(
      margin: const EdgeInsets.only(left: 15, bottom: 5),
      child: Row(
        children: [
          const Padding(padding: EdgeInsets.only(right: 15)),
          Text(
            question,
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4B4B4B)),
          )
        ],
      ),
    );
  }


  instruction(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(top: 10, left: 15),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4B4B4B),
          ),
        ),
      ),
    );
  }

  void check1() {
    currentAns = 1;
  }
  void check2() {
    currentAns = 2;
  }
  void check3() {
    currentAns = 3;
  }
}
