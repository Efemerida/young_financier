import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:young_financier/repositories/boxes/NameBox.dart';

class MapAppBar extends StatelessWidget implements PreferredSizeWidget {

  NameBox nameBox = NameBox();

  @override
  Widget build(BuildContext context) {

    return
      Container(
          color: Colors.grey,
          padding: EdgeInsets.all(10),
          alignment: Alignment.bottomLeft,
          child:
          const Row(
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(120, 0, 0, 0),
                child:Row(
                    children: [
                      Text("Текущий уровень: "),
                      Text("Новичок")
                    ])
          )
          ]
        )
      );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);

}