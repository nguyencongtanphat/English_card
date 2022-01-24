import 'package:flutter/material.dart';
import '../values/app_style.dart';
import '../values/app_colors.dart';
import '../values/app_assets.dart';
import './home_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text('Welcom to', style: AppStyles.h3),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Text(
                        'English',
                        style: AppStyles.h2.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColor.greyText,
                            height: 1.5),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Text(
                          'Qoutes"',
                          textAlign: TextAlign.right,
                          style: AppStyles.h4.copyWith(height: 0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 135.0),
                  child: RawMaterialButton(
                    fillColor: AppColor.lighBlue,
                    shape: const CircleBorder(),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: Image.asset(AppAssets.rightArrow),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
