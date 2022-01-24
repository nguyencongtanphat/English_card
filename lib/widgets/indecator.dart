import 'package:dictionary_flutter/values/app_colors.dart';
import 'package:flutter/material.dart';

class Indecator extends StatelessWidget {
  final bool isActive;
  final Size size;
  const Indecator({Key? key, required this.isActive, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: isActive ? size.width * 1 / 5 : 24,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: isActive ? AppColor.primaryColor : AppColor.lightGrey,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(3, 6),
              blurRadius: 3,
            )
          ]),
    );
  }
}
