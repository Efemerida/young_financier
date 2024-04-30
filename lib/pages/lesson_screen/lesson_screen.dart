import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:young_financier/models/lesson.dart';
import 'package:young_financier/models/lesson_question.dart';
import 'package:young_financier/repositories/db_helpers/lesson_database_helper.dart';

import 'components/bottom_button.dart';
import 'components/lesson_app_bar.dart';
import 'components/list_lesson.dart';

class LessonScreen extends StatefulWidget {

  int id;
  LessonScreen({required this.id, super.key});


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
  double countCorrect = 0;


  late List<LessonQuestion> questions;
  late List<ListLesson> lessons = [];
  List<int> countPage = [];


  LessonScreenState({required this.id});




  @override
  void initState() {
    super.initState();
    lessonDb = LessonDatabaseHelper();
    lessonDb.initDB().whenComplete(() async {
      questions = await lessonDb.selectLessonQuestionById(id);

      for(int i = 0; i < questions.length; i++){
        lessons.add(ListLesson(lessonQuestion: questions[i],
            checkButton: bottomButton(context, 'Проверить', i)));
      }
      countCorrect = 0.8/lessons.length;
      setState(() {});

    });

  }



  @override
  Widget build(BuildContext context) {


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
            if(ListLesson.currentAns!=0) {
              setState(() {
                if (ListLesson.currentAns == questions[pos].numCorrect) {
                  if (lessons.length == 1) {

                    Box box = Hive.box("name_box");
                    DateTime? date = box.get("date");
                    if(date==null) {
                      box.put("date", DateTime.now());
                      box.put("count", 1);
                    }
                    else{
                      if(date.difference(DateTime.now()).inDays < 2 && date.difference(DateTime.now()).inDays > 1){
                        box.put("date", DateTime.now());
                        int count = box.get("count");
                        count+=1;
                        box.put("count", count);


                      }
                      else if(date.difference(DateTime.now()).inDays > 2){
                        box.put("date", DateTime.now());
                        box.put("count", 1);
                      }
                    }

                    lessonDb.selectLessonById(id).whenComplete(() async {
                      Lesson ls = await lessonDb.selectLessonById(id);
                      ls.complete = 1;
                      ByteData bytes = await rootBundle.load(
                          "assets/images/ant.png");
                      ls.picture = bytes.buffer.asUint8List();
                      lessonDb.completeLesson(ls);
                    });


                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return dialog('Ты хорошо поработал!', true, true);
                      },
                    );
                  }
                  else {
                    lessons.removeAt(0);
                    percent += countCorrect;

                      setState(() {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return dialog('Правильно!', true, false);
                          },
                        );
                      });
                  }
                }
                else {
                  ListLesson tmp = lessons[0];
                  lessons.removeAt(0);
                  lessons.add(tmp);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialog('Ошибка(', false, false);
                    },
                  );
                }
                ListLesson.currentAns = 0;
              });
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF58CC02),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  dialog(String title, bool isGood, bool isFinal) {
    Color color = const Color(0xFFd7ffb8);
    if(!isGood) color = const Color(0xffe37676);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(color: color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            dialogTitle(title, isGood),
            BottomButton(isGood: isGood, context, title: 'Дальше', isFinal: isFinal,),
          ],
        ),
      ),
    );
  }

  dialogTitle(String text, bool isGood) {
    Color color = Color(0xFF43C000);
    if(!isGood) color = Color(0xffe50517);
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.only(left: 15),
        child: DefaultTextStyle(
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: color,
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
