import 'package:flutter/material.dart';

class ButtonWidget2 extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget2({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: StadiumBorder(),
      onPrimary: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
    ),
    child: Text(text),
    onPressed: onClicked,
  );
}