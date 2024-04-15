import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:young_financier/widgets/map_widgets/exercise_map_circle.dart';
import 'package:young_financier/widgets/map_widgets/map_appBarr.dart';

class MapPage extends StatelessWidget{

  const MapPage({super.key});


  @override
  Widget build(BuildContext context) {
    List<ExerciseMap> lessons = <ExerciseMap>[ExerciseMap(), ExerciseMap(), ExerciseMap(), ExerciseMap()];
    return Scaffold(
      appBar: MapAppBar(),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 545,
              width: 480,
              child:ListView.builder(
                  padding: const EdgeInsets.all(1),
                  itemCount: lessons.length,
                  itemBuilder: (BuildContext context, int index) {
                    return lessons[index];
                  })
            )
          ]
        )
      )
    );
  }
  void _someFuction() {

  }
}


