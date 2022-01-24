import 'package:dictionary_flutter/models/english_today.dart';
import 'package:dictionary_flutter/values/app_assets.dart';
import 'package:dictionary_flutter/values/app_colors.dart';
import 'package:dictionary_flutter/values/app_style.dart';
import 'package:dictionary_flutter/widgets/app_bar.dart';
import 'package:dictionary_flutter/widgets/index.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  List<EnglishToday> words;
  FavoritesPage({Key? key, required this.words}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState(words);
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<EnglishToday> words;
  _FavoritesPageState(this.words);
  @override
  Widget build(BuildContext context) {
    List<EnglishToday> favoritesWords =
        words.where((e) => e.isFavorite == true).toList();

    return Scaffold(
      backgroundColor: AppColor.secondColor,
      appBar: MyAppBar(
        titleContent: 'Your Favorites',
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(AppAssets.leftArrow),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                color: index % 2 == 0
                    ? AppColor.primaryColor
                    : AppColor.secondColor,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(3, 6),
                    blurRadius: 3,
                  )
                ]),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            padding: const EdgeInsets.all(8),
            child: ListTile(
              trailing: Icon(
                Icons.favorite,
                color: favoritesWords[index].isFavorite!
                    ? Colors.red
                    : Colors.grey,
              ),
              leading: Index(
                index: index + 1,
                backGroundColor: index % 2 == 0
                    ? AppColor.secondColor
                    : AppColor.primaryColor,
                textColor: index % 2 == 0
                    ? AppColor.primaryColor
                    : AppColor.secondColor,
              ),
              title: Text(
                favoritesWords[index].noun!,
                style: AppStyles.h4.copyWith(
                    color: index % 2 != 0 ? AppColor.textColor : Colors.white),
              ),
              subtitle: Text(
                words[index].quote ??
                    '"thinks of all the beauty still left around you and be happy."',
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          );
        },
        itemCount: favoritesWords.length,
      ),
    );
  }
}
