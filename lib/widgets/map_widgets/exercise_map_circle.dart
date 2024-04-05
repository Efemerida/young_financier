import 'package:flutter/material.dart';



class ExerciseMap extends StatefulWidget {

  const ExerciseMap({super.key});


  @override
  State<StatefulWidget> createState() => _ExerciseMap();
}


class _ExerciseMap extends State<ExerciseMap> {



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: prr,
        child:Container(padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
            child:CustomPaint(
              size: const Size(1, 1),
              painter: CirclePainter(),
              child: const Text(
                  textAlign: TextAlign.center,
                  "type me"),
            )
    )
      );
  }
}

void prr(){
  print("tap");
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