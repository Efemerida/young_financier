import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:young_financier/models/Lesson.dart';
import 'package:young_financier/models/LessonQuestion.dart';
import 'package:young_financier/repositories/db_helpers/LessonDatabaseHelper.dart';

import 'components/course_node.dart';
import 'components/double_course_node.dart';
import 'components/triple_course_node.dart';


class CourseTree extends StatefulWidget{

  CourseTree({super.key});

  @override
  State<StatefulWidget> createState() => _CourseTree();
}



class _CourseTree extends State<CourseTree> {

  late LessonDatabaseHelper lessonDb;
  List<Lesson>? lessons = null;

  @override
  void initState() {
    super.initState();
    this.lessonDb = LessonDatabaseHelper();
    this.lessonDb.initDB().whenComplete(() async {
      // await lessonDb.dropDB();
      await lessonDb.deleteAllData();
      ByteData bytes = await rootBundle.load("assets/images/egg.png");
      lessonDb.insertLesson(Lesson(name: "Введение", complete: 0, picture: bytes.buffer.asUint8List()));
      lessons = await lessonDb.selectLessons();
      lessonDb.insertLessonQuestion(LessonQuestion(question:"Вопрос", answer1:"Ответ1",
          answer2:"Ответ2", answer3:"Ответ3", answer4:"Ответ4", numCorrect:2, lesson_id:lessons![0].id!));
      lessonDb.insertLessonQuestion(LessonQuestion(question:"Вопрос222", answer1:"Ответ1",
          answer2:"Ответ2", answer3:"Ответ3", answer4:"Ответ4", numCorrect:2, lesson_id:lessons![0].id!));
      List ques = await lessonDb.selectLessonQuestionById(lessons![0].id!);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: this.lessonDb.selectLessons(),
        builder: (BuildContext context, AsyncSnapshot<List<Lesson>> snapshot){
    if (snapshot.hasData && lessons!=null) {
      print("object");
      print(snapshot.data?[0].complete);
      return ListView.builder(
          itemCount: snapshot.data?.length,
          itemBuilder: (context, position) {
            return Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: CourseNode(
              id: lessons![position].id!,
              snapshot.data![position].name,
              image: snapshot.data![position].picture,
              isComplete:snapshot.data![position].complete,
              color: snapshot.data![position].complete==1? Color(0xFF12AB1B) : Color(0xFFCE82FF),
            ));
          });
    }
    else {
      return Center(child: CircularProgressIndicator());
    }

        });

    //   SingleChildScrollView(
    //   child: Column(
    //     children: [
    //       const Padding(padding: EdgeInsets.all(10)),
    //       CourseNode(
    //         'Basic',
    //         crown: 1,
    //       ),
    //       const Padding(padding: EdgeInsets.all(10)),
    //       DoubleCourseNode(
    //         CourseNode(
    //           'Greetings',
    //           image: 'assets/images/hand.png',
    //           color: Colors.yellow,
    //           percent: 0.5,
    //           crown: 1,
    //         ),
    //         CourseNode(
    //           'Introduction',
    //           image: 'assets/images/pen.png',
    //           color: const Color(0xFFCE82FF),
    //           crown: 2,
    //         ),
    //       ),
    //       const Padding(padding: EdgeInsets.all(10)),
    //       DoubleCourseNode(
    //         CourseNode(
    //           'Animals',
    //           image: 'assets/images/fish.png',
    //           color: Colors.green,
    //           percent: 0.2,
    //           crown: 3,
    //         ),
    //         CourseNode(
    //           'Colors',
    //           image: 'assets/images/bucket.png',
    //           color: Colors.blue,
    //           crown: 1,
    //         ),
    //       ),
    //       const Padding(padding: EdgeInsets.all(10)),
    //       CourseNode(
    //         'Sentence',
    //         image: 'assets/images/bandages.png',
    //         color: Colors.redAccent,
    //         crown: 4,
    //       ),
    //       const Padding(padding: EdgeInsets.all(10)),
    //       TripleCourseNode(
    //         CourseNode(
    //           'Clothing',
    //           image: 'assets/images/heel.png',
    //           color: Colors.yellow.shade500,
    //         ),
    //         CourseNode(
    //           'Tools',
    //           image: 'assets/images/hammer.png',
    //           color: Colors.grey,
    //           percent: 0.7,
    //         ),
    //         CourseNode(
    //           'Emotions',
    //           image: 'assets/images/emotion.png',
    //           color: Colors.blue,
    //           crown: 2,
    //         ),
    //       ),
    //       const Padding(padding: EdgeInsets.all(10)),
    //       DoubleCourseNode(
    //         CourseNode(
    //           'Daily',
    //           image: 'assets/images/dumbbell.png',
    //           color: Colors.purple.shade200,
    //           percent: 0.2,
    //         ),
    //         CourseNode(
    //           'Travel',
    //           image: 'assets/images/tree.png',
    //           color: Colors.pink,
    //         ),
    //       ),
    //       const Padding(padding: EdgeInsets.only(bottom: 15)),
    //     ],
    //   ),
    // );
  }
}
