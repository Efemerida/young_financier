import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:young_financier/models/lesson.dart';
import 'package:young_financier/models/lesson_question.dart';
import 'package:young_financier/repositories/db_helpers/lesson_database_helper.dart';

import 'components/course_node.dart';



class CourseTree extends StatefulWidget{

  const CourseTree({super.key});

  @override
  State<StatefulWidget> createState() => _CourseTree();
}



class _CourseTree extends State<CourseTree> {

  late LessonDatabaseHelper lessonDb;
  List<Lesson>? lessons;





  @override
  void initState() {
    super.initState();



    this.lessonDb = LessonDatabaseHelper();
    this.lessonDb.initDB().whenComplete(() async {
      // await lessonDb.deleteAllData();

      lessons = await lessonDb.selectLessons();
      print(lessons);
      if(lessons!.isEmpty) {
        ByteData bytes1 = await rootBundle.load("assets/images/intro.png");
        lessonDb.insertLesson(Lesson(name: "Введение",
            complete: 0,
            picture: bytes1.buffer.asUint8List()));

        lessons = await lessonDb.selectLessons();
        lessonDb.insertLessonQuestion(LessonQuestion(
            question: "Что такое деньги?",
            answer1: "Бумажные купюры",
            answer2: "Монеты",
            answer3: "Все вышеперечисленное",
            answer4: "Ответ4",
            numCorrect: 3,
            lesson_id: lessons![0].id!));
        lessonDb.insertLessonQuestion(LessonQuestion(
            question: "Что можно купить на деньги?",
            answer1: "Еду",
            answer2: "Игрушки",
            answer3: "Оба варианта",
            answer4: "Ответ4",
            numCorrect: 3,
            lesson_id: lessons![0].id!));
        lessonDb.insertLessonQuestion(LessonQuestion(
            question: "Что такое сбережения?",
            answer1: "Деньги, которые ты тратишь",
            answer2: "Деньги, которые ты хранишь",
            answer3: "Деньги, которые ты зарабатываешь",
            answer4: "Ответ4",
            numCorrect: 2,
            lesson_id: lessons![0].id!));
        lessonDb.insertLessonQuestion(LessonQuestion(
            question: "Почему важно тратить деньги с умом?",
            answer1: "Чтобы у тебя было больше денег",
            answer2: "Чтобы не попасть в долги",
            answer3: "Все вышеперечисленное",
            answer4: "Ответ4",
            numCorrect: 3,
            lesson_id: lessons![0].id!));


        ByteData bytes2 = await rootBundle.load("assets/images/money.png");
        lessonDb.insertLesson(Lesson(name: "Финансы",
            complete: 0,
            picture: bytes2.buffer.asUint8List()));

        lessons = await lessonDb.selectLessons();
        lessonDb.insertLessonQuestion(LessonQuestion(
            question: "Почему важно быть финансово грамотным?",
            answer1: "Чтобы принимать правильные решения о своих деньгах",
            answer2: "Чтобы избежать финансовых проблем",
            answer3: "Оба варианта",
            answer4: "Ответ4",
            numCorrect: 3,
            lesson_id: lessons![1].id!));
        lessonDb.insertLessonQuestion(LessonQuestion(
            question: "Что такое финансовая цель?",
            answer1: "То, чего ты хочешь достичь со своими деньгами",
            answer2: "То, на что ты тратишь свои деньги",
            answer3: "То, сколько денег у тебя есть",
            answer4: "Ответ4",
            numCorrect: 1,
            lesson_id: lessons![1].id!));
        lessonDb.insertLessonQuestion(LessonQuestion(
            question: "Почему важно планировать своё финансовое будущее?",
            answer1: "Чтобы у тебя было достаточно денег на пенсии",
            answer2: "Чтобы ты мог достичь своих финансовых целей",
            answer3: "Оба варианта",
            answer4: "Ответ4",
            numCorrect: 3,
            lesson_id: lessons![1].id!));
        lessonDb.insertLessonQuestion(LessonQuestion(
            question: "Что такое потребности?",
            answer1: "Вещи, которые тебе нужны для выживания",
            answer2: "Вещи, которые ты хочешь, но не нуждаешься в них",
            answer3: "Оба варианта",
            answer4: "Ответ4",
            numCorrect: 1,
            lesson_id: lessons![1].id!));
        lessonDb.insertLessonQuestion(LessonQuestion(
            question: "Что такое желания?",
            answer1: "Вещи, которые тебе нужны для выживания",
            answer2: "Вещи, которые ты хочешь, но не нуждаешься в них",
            answer3: "Оба варианта",
            answer4: "Ответ4",
            numCorrect: 2,
            lesson_id: lessons![1].id!));


        ByteData bytes3 = await rootBundle.load("assets/images/bank.png");
        lessonDb.insertLesson(Lesson(
            name: "Банк", complete: 0, picture: bytes3.buffer.asUint8List()));

        lessons = await lessonDb.selectLessons();
        lessonDb.insertLessonQuestion(LessonQuestion(
            question: "Что такое банк?",
            answer1: "Место, где хранят деньги",
            answer2: "Магазин, где продают еду",
            answer3: "Школа, где учатся дети",
            answer4: "Ответ4",
            numCorrect: 1,
            lesson_id: lessons![2].id!));
        lessonDb.insertLessonQuestion(LessonQuestion(
            question: "Почему важно хранить деньги в банке?",
            answer1: "Чтобы они были в безопасности",
            answer2: "Чтобы купить игрушки",
            answer3: "Чтобы подружиться",
            answer4: "Ответ4",
            numCorrect: 1,
            lesson_id: lessons![2].id!));
        lessonDb.insertLessonQuestion(LessonQuestion(
            question: "Как называется человек, который работает в банке?",
            answer1: "Доктор",
            answer2: "Кассир",
            answer3: "Учитель",
            answer4: "Ответ4",
            numCorrect: 2,
            lesson_id: lessons![2].id!));
        lessonDb.insertLessonQuestion(LessonQuestion(
            question: "Что можно делать в банке?",
            answer1: "Снимать деньги",
            answer2: "Положить деньги",
            answer3: "И то, и другое",
            answer4: "Ответ4",
            numCorrect: 3,
            lesson_id: lessons![2].id!));
        lessonDb.insertLessonQuestion(LessonQuestion(
            question: "Чем пользуются люди, чтобы снять деньги в банке?",
            answer1: "Банковской картой",
            answer2: "Паспортом",
            answer3: "Оба варианта",
            answer4: "Ответ4",
            numCorrect: 3,
            lesson_id: lessons![2].id!));


        ByteData bytes4 = await rootBundle.load("assets/images/saving.png");
        lessonDb.insertLesson(Lesson(
            name: "Вклады", complete: 0, picture: bytes4.buffer.asUint8List()));

        lessons = await lessonDb.selectLessons();
        lessonDb.insertLessonQuestion(LessonQuestion(
            question: "Что такое вклад?",
            answer1: "Деньги, которые ты даешь банку",
            answer2: "Деньги, которые банк дает тебе",
            answer3: "Деньги, которые ты хранишь в кармане",
            answer4: "Ответ4",
            numCorrect: 1,
            lesson_id: lessons![3].id!));
        lessonDb.insertLessonQuestion(LessonQuestion(
            question: "Для чего можно использовать вклады?",
            answer1: "Купить игрушки",
            answer2: "Сберечь деньги на будущее",
            answer3: "Потратить на конфеты",
            answer4: "Ответ4",
            numCorrect: 1,
            lesson_id: lessons![3].id!));
        lessonDb.insertLessonQuestion(LessonQuestion(
            question: "Что происходит с деньгами, которые ты вносишь на вклад?",
            answer1: "Банк хранит их в сейфе",
            answer2: "Банк использует их для помощи другим людям",
            answer3: "Банк тратит их на свои нужды",
            answer4: "Ответ4",
            numCorrect: 2,
            lesson_id: lessons![3].id!));
        lessonDb.insertLessonQuestion(LessonQuestion(
            question: "Какая часть твоего вклада растет со временем?",
            answer1: "Вся сумма",
            answer2: "Только часть, которую ты внес",
            answer3: "Ничего",
            answer4: "Ответ4",
            numCorrect: 3,
            lesson_id: lessons![3].id!));


        ByteData bytes5 = await rootBundle.load("assets/images/get.png");
        lessonDb.insertLesson(Lesson(
            name: "Кредит", complete: 0, picture: bytes5.buffer.asUint8List()));

        lessons = await lessonDb.selectLessons();
        lessonDb.insertLessonQuestion(LessonQuestion(
            question: "Что такое кредит?",
            answer1: "Деньги, которые ты даешь банку",
            answer2: "Деньги, которые банк дает тебе",
            answer3: "Деньги, которые ты хранишь в кармане",
            answer4: "Ответ4",
            numCorrect: 2,
            lesson_id: lessons![4].id!));
        lessonDb.insertLessonQuestion(LessonQuestion(
            question: "Для чего можно использовать кредиты?",
            answer1: "Купить дом",
            answer2: "Сходить в кино",
            answer3: "Купить леденец",
            answer4: "Ответ4",
            numCorrect: 1,
            lesson_id: lessons![4].id!));
        lessonDb.insertLessonQuestion(LessonQuestion(
            question: "Что нужно сделать, чтобы получить кредит?",
            answer1: "Попросить у банка",
            answer2: "Написать письмо",
            answer3: "Собрать все свои сбережения",
            answer4: "Ответ4",
            numCorrect: 1,
            lesson_id: lessons![4].id!));
        lessonDb.insertLessonQuestion(LessonQuestion(
            question: "Что такое процентная ставка по кредиту?",
            answer3: "Сколько денег ты должен заплатить банку за пользование кредитом",
            answer2: "Сколько денег банк дает тебе взаймы",
            answer1: "Скорость, с которой растет твой долг",
            answer4: "Ответ4",
            numCorrect: 3,
            lesson_id: lessons![4].id!));
      }
      setState(() {});
    }
    );
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: lessonDb.selectLessons(),
        builder: (BuildContext context, AsyncSnapshot<List<Lesson>> snapshot){
    if (snapshot.hasData && lessons!=null) {
      return ListView.builder(
          itemCount: snapshot.data?.length,
          itemBuilder: (context, position) {
            return Padding(padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: CourseNode(
              id: lessons![position].id!,
              snapshot.data![position].name,
              image: snapshot.data![position].picture,
              isComplete:snapshot.data![position].complete,
              color: snapshot.data![position].complete==1? const Color(0xFF12AB1B) : const Color(0xFFCE82FF),
            ));
          });
    }
    else {
      return const Center(child: CircularProgressIndicator());
    }

        });
  }
}
