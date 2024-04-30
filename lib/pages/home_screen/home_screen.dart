import 'package:flutter/material.dart';

import '../course_screen/course_tree.dart';
import 'components/stat_app_bar.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StatAppBar(),
      body: const CourseTree(),
      );
  }



}
