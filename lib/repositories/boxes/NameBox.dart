import 'dart:io';

import 'package:hive/hive.dart';

class NameBox{


  NameBox(){
  }


  Future<void> changeName(String name) async {
    var stringBox = await Hive.openBox<String>('name_box');
    stringBox.put("name", name);
    stringBox.close();
  }

  Future<void> setCountHotDay(int count) async {
    var box = await Hive.openBox<int>('name_box');
    box.put("count", count);
    box.close();
  }

  Future<int> getCountHotDay() async {
    var box = await Hive.openBox<int>('name_box');
    int? count = box.get("count");
    if(count==null) return 0;
    return count;
  }

  Future<void> setLastDay() async {
    var box = await Hive.openBox<DateTime>('name_box');
    box.put("date", DateTime.now());
    box.close();
  }

  Future<DateTime> getLastDay() async {
    var box = await Hive.openBox<DateTime>('name_box');
    DateTime? date = box.get("date");
    if(date!=null) return date;
    await setLastDay();
    return DateTime.now();
  }

  Future<String?> getName() async {
    var stringBox = await Hive.openBox<String>('name_box');
    String? name = stringBox.get("name");
    if(name==null) changeName("Владик");
    stringBox.close();
    return name;
  }

}