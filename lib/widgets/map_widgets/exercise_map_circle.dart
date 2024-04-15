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
        child: Row(
          children: [
            Container(
                padding: EdgeInsets.fromLTRB(30, 30, 0, 30),
              child:CustomPaint(
                size: const Size(1, 1),
                painter: CirclePainterGreen(),
                  child:
                  CustomPaint(
                    size: Size(1,1),
                    painter: CirclePainterWhite(),
                  )

              )
          ),
            Container(
            padding: EdgeInsets.fromLTRB(40, 15, 0, 15),
            child: Column(
              children: [
                Text("Урок 1",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black54
                ),),
                Text("Акции")])
            )
          ]
        )
      );
  }
}

void prr(){
  print("tap");
}





class CirclePainterGreen extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 15;
    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, 20, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CirclePainterWhite extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 15;
    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, 15, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}