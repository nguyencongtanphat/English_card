import 'package:dictionary_flutter/packages/quote/quote.dart';
import 'package:dictionary_flutter/packages/quote/quote_model.dart';
import 'package:dictionary_flutter/pages/all_words_page.dart';
import 'package:dictionary_flutter/pages/controll_page.dart';
import 'package:dictionary_flutter/pages/favorites_page.dart';
import 'package:dictionary_flutter/values/share_keys.dart';
import 'package:dictionary_flutter/widgets/app_bar.dart';
import 'package:dictionary_flutter/widgets/app_button.dart';
import 'package:dictionary_flutter/widgets/indecator.dart';
import 'package:dictionary_flutter/widgets/index.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../values/app_style.dart';
import '../values/app_colors.dart';
import '../values/app_assets.dart';
import '../models/english_today.dart';
import 'package:english_words/english_words.dart';
import '../widgets/app_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:like_button/like_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late PageController _pageController;
  List<EnglishToday> words = [];
  String quote = Quotes().getRandom().content!;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<int> fixedListRamdom({int len = 1, int max = 120, int min = 1}) {
    if (len > max || len < min) {
      return [];
    }
    List<int> newList = [];

    Random random = Random();
    int count = 1;
    while (count <= len) {
      int val = random.nextInt(max);
      if (newList.contains(val)) {
        continue;
      } else {
        newList.add(val);
        count++;
      }
    }
    return newList;
  }

  EnglishToday getQuote(String noun) {
    Quote? quote;
    quote = Quotes().getByWord(noun);
    return EnglishToday(
      noun: noun,
      id: quote?.id,
      quote: quote?.content,
    );
  }

  getEnglishToday() async {
    List<String> newList = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int length = prefs.getInt(SharedKey.counter) ?? 5;
    List<int> rans = fixedListRamdom(len: length, max: nouns.length);
    rans.forEach((index) {
      newList.add(nouns[index]);
    });
    setState(() {
      words = newList.map((e) => getQuote(e)).toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(viewportFraction: 0.90);
    getEnglishToday();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColor.secondColor,
      drawer: Drawer(
        backgroundColor: AppColor.lighBlue,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: AutoSizeText(
                    'Management',
                    maxLines: 1,
                    style: AppStyles.h3.copyWith(
                      color: AppColor.textColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: AppButton(
                      backGroundcolor: Colors.white,
                      textColor: AppColor.textColor,
                      width: double.infinity,
                      label: 'Favorites',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FavoritesPage(
                              words: words,
                            ),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: AppButton(
                      backGroundcolor: Colors.white,
                      textColor: AppColor.textColor,
                      width: double.infinity,
                      label: 'Your Controll',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ControllPage()),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
      //MyDrawer(title:'Management',listItem:[
      //{"label":"Favorites","action":(){
      // Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                     builder: (context) => FavoritesPage(
      //                       words: words,
      //                     ),
      //                   ),
      //                 );
      //}},])
      appBar: MyAppBar(
        titleContent: 'English Tody',
        leading: InkWell(
          child: Image.asset(AppAssets.menu),
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              getEnglishToday();
            });
          },
          child: Image.asset(AppAssets.exchange),
          backgroundColor: AppColor.primaryColor),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              alignment: Alignment.centerLeft,
              height: size.height * 1 / 10,
              child: Text(
                quote,
                style: AppStyles.h5
                    .copyWith(fontSize: 12, color: AppColor.textColor),
              ),
            ),
            SizedBox(
              height: size.height * 2 / 3,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemCount: words.length,
                itemBuilder: (context, index) {
                  //set quote for each  noun
                  String quoteDefault =
                      '"thinks of all the beauty still left around you and be happy."';
                  String quote = words[index].quote != null
                      ? words[index].quote!
                      : quoteDefault;
                  //handle click like button
                  onLikeButtonTapped(bool isLiked) async {
                    setState(() {
                      words[index].isFavorite = !words[index].isFavorite!;
                    });
                    return words[index].isFavorite;
                  }

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(24),
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {
                          onLikeButtonTapped(words[index].isFavorite!);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Index(
                                    index: index + 1,
                                    textColor: AppColor.primaryColor,
                                  ),
                                  LikeButton(
                                    size: 42,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    onTap: onLikeButtonTapped,
                                    circleColor: const CircleColor(
                                        start: Color(0xFF610101),
                                        end: Color(0xffB80202)),
                                    bubblesColor: const BubblesColor(
                                      dotPrimaryColor: Colors.red,
                                      dotSecondaryColor: Color(0xFFFC1919),
                                    ),
                                    likeBuilder: (bool isLiked) {
                                      return Icon(
                                        Icons.favorite,
                                        color: words[index].isFavorite!
                                            ? Colors.red
                                            : Colors.white,
                                        size: 42,
                                      );
                                    },
                                  ),
                                ],
                              ),
                              AutoSizeText.rich(
                                TextSpan(
                                  text: words[index].noun?[0],
                                  children: [
                                    TextSpan(
                                      text: words[index].noun?.substring(1),
                                      style: const TextStyle(
                                        fontSize: 56,
                                        shadows: [BoxShadow()],
                                      ),
                                    )
                                  ],
                                ),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: FontFamily.sen,
                                    fontSize: 89,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      BoxShadow(
                                        color: Colors.black38,
                                        offset: Offset(3, 6),
                                        blurRadius: 6,
                                      )
                                    ]),
                                maxLines: 1,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: AutoSizeText(
                                  quote,
                                  minFontSize: 12,
                                  maxFontSize: 26,
                                  maxLines: 8,
                                  style: AppStyles.h4.copyWith(
                                    letterSpacing: 1,
                                    color: AppColor.textColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            _currentIndex > 4
                ? AppButton(
                    backGroundcolor: AppColor.primaryColor,
                    textColor: Colors.white,
                    width: 180,
                    label: 'Show all',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AllWordsPage(words: words)),
                      );
                    })
                : Container(
                    margin: const EdgeInsets.only(top: 8, left: 24, right: 24),
                    height: 12,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Indecator(
                          isActive: index == _currentIndex,
                          size: size,
                        );
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
