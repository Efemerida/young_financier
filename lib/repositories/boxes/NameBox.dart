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

  Future<String?> getName() async {
    var stringBox = await Hive.openBox<String>('name_box');
    String? name = stringBox.get("name");
    if(name==null) changeName("Владик");
    stringBox.close();
    return name;
  }

}