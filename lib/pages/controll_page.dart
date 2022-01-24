import 'package:dictionary_flutter/values/app_assets.dart';
import 'package:dictionary_flutter/values/app_colors.dart';
import 'package:dictionary_flutter/values/app_style.dart';
import 'package:dictionary_flutter/values/share_keys.dart';
import 'package:dictionary_flutter/widgets/app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class ControllPage extends StatefulWidget {
  const ControllPage({Key? key}) : super(key: key);

  @override
  _ControllPageState createState() => _ControllPageState();
}

class _ControllPageState extends State<ControllPage> {
  double sliderValue = 5;
  @override
  void defaultInitState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int length = prefs.getInt(SharedKey.counter) ?? 5;
    setState(() {
      sliderValue = length.toDouble();
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    defaultInitState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.secondColor,
        appBar: MyAppBar(
          titleContent: 'Your control',
          leading: InkWell(
            child: Image.asset(AppAssets.leftArrow),
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setInt(SharedKey.counter, sliderValue.toInt());
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            const SizedBox(
              width: double.infinity,
            ),
            const Text(
              'How much a number word  at once?',
              style: TextStyle(
                fontSize: 24,
                color: AppColor.primaryColor,
              ),
            ),
            const Spacer(),
            Text(
              '${sliderValue.toInt()}',
              textAlign: TextAlign.center,
              style: AppStyles.h1.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
              ),
            ),
            const Spacer(),
            Slider(
              value: sliderValue,
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              },
              activeColor: AppColor.primaryColor,
              inactiveColor: AppColor.primaryColor,
              min: 1,
              max: 100,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Text(
                'Slide to set',
                textAlign: TextAlign.left,
                style: AppStyles.h5.copyWith(
                  color: AppColor.textColor,
                ),
              ),
            ),
            const Spacer(),
            const Spacer(),
            const Spacer()
          ],
        ));
  }
}
