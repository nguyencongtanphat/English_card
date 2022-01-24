import 'package:dictionary_flutter/values/app_colors.dart';
import 'package:dictionary_flutter/values/app_style.dart';
import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  final int? index;
  final Color? backGroundColor;
  final Color? textColor;
  const Index({Key? key, this.index, this.textColor, this.backGroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backGroundColor ?? AppColor.lighBlue,
      ),
      child: Text(
        index.toString(),
        style: AppStyles.h4.copyWith(
          fontWeight: FontWeight.bold,
          color: textColor ?? AppColor.greyText,
        ),
      ),
    );
  }
}
