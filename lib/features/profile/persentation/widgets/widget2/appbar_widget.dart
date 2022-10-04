import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


AppBar buildAppBar(BuildContext context) {
  final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  final icon = CupertinoIcons.moon_stars;

  return AppBar(
    automaticallyImplyLeading: false,

    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [

    ],
  );
}
