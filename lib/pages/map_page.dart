import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:young_financier/widgets/map_widgets/exercise_map.dart';

class MapPage extends StatelessWidget{

  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              height: 200,
            child:
              ExerciseMap()
        )
          ],
        )
      )
    );
  }
  void _someFuction() {

  }
}


