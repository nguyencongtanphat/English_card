import 'package:dictionary_flutter/values/app_colors.dart';
import 'package:dictionary_flutter/values/app_style.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final double width;
  final Color backGroundcolor;
  final Color textColor;
  const AppButton(
      {Key? key,
      required this.label,
      required this.onTap,
      required this.width,
      required this.backGroundcolor,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: backGroundcolor,
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
      child: InkWell(
        splashColor: Colors.black26,
        onTap: onTap,
        child: Container(
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            label,
            style: AppStyles.h4.copyWith(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
