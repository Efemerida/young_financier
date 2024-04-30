import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:young_financier/models/lesson.dart';

import '../../repositories/db_helpers/lesson_database_helper.dart';

class ProfilePage extends StatefulWidget{

  ProfilePage({super.key});



  @override
  State<StatefulWidget> createState() => _ProfilePageSate();
}

class _ProfilePageSate extends State<ProfilePage>{

  late final Box box;
  late LessonDatabaseHelper lessonDb = LessonDatabaseHelper();


  int countCompleteLessons = 0;
  int countHotDays = 0;


  @override
  void initState() {
    super.initState();
    box = Hive.box("name_box");
    lessonDb.selectLessons().whenComplete(() async {
    List<Lesson> lessons = await lessonDb.selectLessons();
    for (var element in lessons) {
      countCompleteLessons+=element.complete;
    }
    countHotDays = box.get("count");

    setState(() {
    });
    });


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
          valueListenable: box.listenable(),
            builder: (context, Box box, widget){
              if(box.isEmpty){
                box.put("name", "Neo");
              }
            return Center(
                child:
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 60),
                        alignment: Alignment.center,
                        child:Column(
                            children:[
                              Container(
                                  padding: const EdgeInsets.all(0),
                                  height: 120,
                                  child:Image.asset("assets/images/ava.webp", fit:BoxFit.fill)
                              ),
                              Text(box.get("name"))
                            ])
                    ),
                    Container(
                        padding: const EdgeInsets.fromLTRB(40, 40, 0, 0),
                        alignment: Alignment.center,
                        child:
                              Text("Пройдено уроков: ${countCompleteLessons}", textAlign: TextAlign.start),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(40, 40, 0, 0),
                      alignment: Alignment.center,
                      child:
                      Text("Ударных дней: ${countHotDays}", textAlign: TextAlign.start),
                    )
                  ],
                )
            );
            }
        )
    );
  }
}