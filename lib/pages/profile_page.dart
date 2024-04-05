import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget{

  const ProfilePage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
            Row(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child:Column(
                      children:[
                        Container(
                            padding: EdgeInsets.all(20),
                            height: 120,
                            child:Image.asset("assets/images/ava.png", fit:BoxFit.fill)
                        ),
                        Text("Name")
                    ])
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40, 40, 0, 0),
                  alignment: Alignment.topRight,
                  child:
                    Column(
                      children: [
                        Text("Current level", textAlign: TextAlign.start,),
                        Text("Counts of lessons", textAlign: TextAlign.start)
                      ]
                    )
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(40, 40, 0, 0),
                    alignment: Alignment.topRight,
                    child:
                    Column(
                        children: [
                          Text("0", textAlign: TextAlign.start,),
                          Text("0", textAlign: TextAlign.start)
                        ]
                    )
                )
              ],
            )
        )
    );
  }
}