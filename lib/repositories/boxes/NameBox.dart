import 'dart:io';

import 'package:hive/hive.dart';

class NameBox{

  Future<void> changeName(String name) async {
    var path = Directory.current.path;
    Hive
        .init(path);
    var stringBox = await Hive.openBox<String>('name_box');
    stringBox.put("name", name);
  }

  Future<String?> getName() async {
    var path = Directory.current.path;
    print(path);
    Hive
      .init(path);

    var stringBox = await Hive.openBox<String>('name_box');
    String? name = stringBox.get("name");
    if(name==null) changeName("Владик");
    return name;
  }

}