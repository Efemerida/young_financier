import 'package:sqflite/sqflite.dart';

import 'package:young_financier/models/lesson.dart';
import '../../models/lesson_question.dart';

class LessonDatabaseHelper {
  static final LessonDatabaseHelper _lessonDatabaseHelper = LessonDatabaseHelper
      ._();

  LessonDatabaseHelper._();

  late Database db;

  factory LessonDatabaseHelper() {
    return _lessonDatabaseHelper;
  }

  static Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  initDB() async {
    var pathFolder = await getDatabasesPath();
    String path = pathFolder + 'finance4.db';
    db = await openDatabase(
      onConfigure: _onConfigure,
      path,
      onCreate: (database, version) async {
        await database.execute(
          """
            CREATE TABLE lessons (
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
              name TEXT NOT NULL,
              complete INTEGER NOT NULL,
              picture BLOB NOT NULL
            )
          """,
        );
        await database.execute(
        """
            CREATE TABLE lesson_questions (
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
              question TEXT NOT NULL,
              answer1 TEXT NOT NULL,
              answer2 TEXT NOT NULL,
              answer3 TEXT NOT NULL,
              answer4 TEXT NOT NULL,
              numCorrect INTEGER NOT NULL,
              lesson_id INTEGER NOT NULL
            )
          """,);
      },
      version: 1,
    );
  }

  dropDB() async{
    db.execute("DROP TABLE IF EXISTS tableName");
  }

  Future<int> insertLesson(Lesson lesson) async {
    return await db.insert("lessons", lesson.toMap());
  }

  Future<int> insertLessonQuestion(LessonQuestion lessonQuestion) async {
    return await db.insert("lesson_questions", lessonQuestion.toMap());
  }

  Future<List<Lesson>> selectLessons() async {
    List<Map<String, Object?>> list = await db.query('lessons');
    return list
        .map((e) => Lesson.fromMap(e))
        .toList();
  }

  Future<Lesson> selectLessonById(int id) async {
    List<Map<String, Object?>> list = await db.rawQuery('select * from lessons where id = $id');
    return Lesson.fromMap(list.first);
  }

  Future<List<LessonQuestion>> selectLessonQuestionById(int id) async {
    List<Map<String, Object?>> list = await db.rawQuery('select * from lesson_questions where lesson_id = $id');
    return list
        .map((e) => LessonQuestion.fromMap(e))
        .toList();
  }

  Future<void> deleteAllData() async{
    db.rawDelete("delete from lessons");
    db.rawDelete("delete from lesson_questions");
  }

  Future<void> completeLesson(Lesson lesson) async{
    db.rawUpdate("update lessons set complete = ${lesson.complete} "
        "where id = ${lesson.id}");
  }
}