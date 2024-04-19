import 'dart:typed_data';

class Lesson{

  int? id;
  String name;
  int complete;
  Uint8List picture;

  Lesson({this.id, required this.name, required this.complete, required this.picture});




  Lesson.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        complete = res["complete"],
        picture = res["picture"];


  Map<String, Object?> toMap() {
    return {'id': id, 'name': name, 'complete': complete, "picture": picture};
  }

}