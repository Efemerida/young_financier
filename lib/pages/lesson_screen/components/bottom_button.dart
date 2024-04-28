import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final BuildContext context;
  final String title;
  final bool isGood;
  const BottomButton(this.context, {required this.isGood, required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int color = 0xFF58CC02;
    if(!isGood) color = 0xFF0000;
    return Center(
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(color),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
