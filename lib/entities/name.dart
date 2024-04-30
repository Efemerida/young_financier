
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Name extends HiveObject{

  Name({required this.name});

  @HiveField(0)
  String name;
}