import 'package:flutter/material.dart';



class ExerciseMap extends StatefulWidget {

  const ExerciseMap({super.key});


  @override
  State<StatefulWidget> createState() => _ExerciseMap();
}


class _ExerciseMap extends State<ExerciseMap> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InkWell(
          child: CustomPaint(
            size: Size(20, 20),
            painter: CirclePainter(),
            child: Text("type me"),
          ),
        )
    );
  }
}






class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 15;

    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, 30, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}