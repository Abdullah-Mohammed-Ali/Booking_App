import 'package:flutter/material.dart';

class ButtonWidget3 extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget3({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    width: 120,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(

        shape: StadiumBorder(),
        backgroundColor: Colors.teal,
        onPrimary: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
      ),
      child: Text(text , style: TextStyle(fontSize: 11),),
      onPressed: onClicked,
    ),
  );
}