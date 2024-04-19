import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:young_financier/repositories/boxes/NameBox.dart';

class ProfilePage extends StatefulWidget{

  ProfilePage({super.key});



  @override
  State<StatefulWidget> createState() => _ProfilePageSate();
}

class _ProfilePageSate extends State<ProfilePage>{

  late final Box box;


  @override
  void initState() {
    super.initState();
    box = Hive.box("name_box");
  }

  _getInfo() {
    box.get("name");
  }


  @override
  Widget build(BuildContext context) {
    String name;

    return Scaffold(
        body: ValueListenableBuilder(
          valueListenable: box.listenable(),
            builder: (context, Box box, widget){
            if(box.isEmpty){
              box.put("name", "Васек");
            }
            return Center(
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
                              Text(box.get("name"))
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
                        const Column(
                            children: [
                              Text("0", textAlign: TextAlign.start,),
                              Text("0", textAlign: TextAlign.start)
                            ]
                        )
                    )
                  ],
                )
            );
            }
        )
    );
  }
}