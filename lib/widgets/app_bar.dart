import 'package:dictionary_flutter/values/app_colors.dart';
import 'package:dictionary_flutter/values/app_style.dart';
import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  final String titleContent;
  final Widget leading;
  MyAppBar(
      {Key? key,
      required this.titleContent,
      required this.leading,
      double elevation = 0,
      foregroundColor = AppColor.textColor,
      backgroundColor = AppColor.secondColor})
      : super(
          key: key,
          title: Text(
            titleContent,
            style: TextStyle(
              fontSize: 36,
              fontFamily: FontFamily.sen,
            ),
          ),
          leading: leading,
          elevation: elevation,
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
        );
}
