import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class StatAppBar extends StatelessWidget implements PreferredSizeWidget {
  StatAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(65);


  late final Box box;



  @override
  Widget build(BuildContext context) {
    box = Hive.box("name_box");
    int? count = box.get("count");
    if(count==null) {
      box.put("count", 0);
      count = 1;
    }

      return AppBar(
        toolbarHeight: 120,
        backgroundColor: Colors.white,
        elevation: 1.5,
        title: Row(
          children: [
            const Padding(padding: EdgeInsets.all(20)),
            streak(count),
          ],
        ),
      );
    }
  }
  Widget streak(int n) {
    return Row(
      children: [
        Image.asset(
          'assets/images/streak.png',
          width: 24,
        ),
        const Padding(
          padding: EdgeInsets.all(4),
        ),
        Text(
          '$n',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFFFF9600),
          ),
        )
      ],
    );
  }


  Widget flag() {
    return Container(
      margin: const EdgeInsets.only(left: 15, top: 18, bottom: 18),
      decoration: BoxDecoration(
        image: const DecorationImage(
          fit: BoxFit.scaleDown,
          image: AssetImage('assets/images/korea-flag-transparent.png'),
          // fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 2.5,
          color: const Color(0xFFE5E5E5),
        ),
        color: Colors.grey.shade100,
      ),
      child: null /* add child content here */,
    );
  }

