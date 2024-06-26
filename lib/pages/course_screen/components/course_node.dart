import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../lesson_screen/lesson_screen.dart';

class CourseNode extends StatelessWidget {
  final String name;
  Uint8List? image;
  Color? color;
  int isComplete;
  int id;
  final Function() onUpdate;


  CourseNode(this.name,
      {required this.onUpdate,this.image, this.color, required this.id, required this.isComplete, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => LessonScreen(id:id),
              ),
            ).then((result) {

                onUpdate();

            });;
          },
          child: node(),
        ),
        const Padding(padding: EdgeInsets.all(5)),
        courseName(),
      ],
    );
  }

  node() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            progressCircle(),
            CircleAvatar(
              backgroundColor: color ?? const Color(0xFF2B70C9),
              radius: 37,
            ),
            Image.memory(
              image!,
              width: 42,
            )
          ],
        ),
      ],
    );
  }

  progressCircle() {
    return Transform.rotate(
      angle: 2.7,
      child: CircularPercentIndicator(
        radius: 55.0,
        lineWidth: 10.0,
        percent: 1,
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: const Color(0x00c0c0c0),
        backgroundColor: isComplete == 1? const Color(0xFF12AB1B) : const Color(0x737373FF),
      ),
    );
  }

  courseName() {
    return Text(name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18));
  }
}
