import 'package:flutter/material.dart';
import 'package:young_financier/models/LessonQuestion.dart';
import 'package:young_financier/repositories/db_helpers/LessonDatabaseHelper.dart';

import 'components/bottom_button.dart';
import 'components/final_bottom_button.dart';
import 'components/grid_lesson.dart';
import 'components/lesson_app_bar.dart';
import 'components/list_lesson.dart';

class LessonScreen extends StatefulWidget {

  int id;
  LessonScreen({required this.id, Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return LessonScreenState(id: id);
  }
}

class LessonScreenState extends State<LessonScreen> {
  double percent = 0.2;
  int index = 0;
  late LessonDatabaseHelper lessonDb;
  int id;
  int countCorrect = 0;


  late List<LessonQuestion> questions;
  late List<ListLesson> lessons;


  LessonScreenState({required this.id});




  @override
  void initState() {
    super.initState();
    lessonDb = LessonDatabaseHelper();
    lessonDb.initDB().whenComplete(() async {
      questions = await lessonDb.selectLessonQuestionById(id);
      setState(() {});
    });
  }



  @override
  Widget build(BuildContext context) {
    lessons = [ListLesson(lessonQuestion: questions[0],
        checkButton: bottomButton(context, 'CHECK', 0)),
    ListLesson(lessonQuestion: questions[0],
    checkButton: bottomButton(context, 'CHECK', 1)),
    ListLesson(lessonQuestion: questions[0],
    checkButton: bottomButton(context, 'CHECK', 2)),
    ListLesson(lessonQuestion: questions[0],
    checkButton: bottomButton(context, 'CHECK', 3))];

    return Scaffold(
      appBar: LessonAppBar(percent: percent),
      body: lessons[index],
    );
  }

  bottomButton(BuildContext context, String title, int pos) {
    return Center(
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              if(ListLesson.currentAns==questions[0].numCorrect){
                lessons.removeAt(pos);
                percent += 0.2;
                index++;
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return dialog('Great job', true);
                  },
                );
              }
              else{
                index++;
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return dialog('baaad', false);
                  },
                );
              }
              if(index==lessons.length) index = 0;
            });
          },
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF58CC02),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }

  dialog(String title, bool isGood) {
    int color = 0xFFd7ffb8;
    if(!isGood) color = 0xFF7276;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(color: Color(color)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            dialogTitle(title),
            BottomButton(isGood: isGood, context, title: 'CONTINUE'),
          ],
        ),
      ),
    );
  }

  dialogTitle(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.only(left: 15),
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xFF43C000),
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
