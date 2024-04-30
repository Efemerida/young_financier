import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final BuildContext context;
  final String title;
  final bool isGood;
  final bool isFinal;
  const BottomButton(this.context, {required this.isGood, required this.title, required this.isFinal, super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Color(0xFF43C000);
    if(!isGood) color = Color(0xffe50517);
    return Center(
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: ElevatedButton(
          onPressed: () {
            if(isFinal){
              Navigator.pop(context);
              Navigator.pop(context);
            }
            else{
              Navigator.pop(context);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
