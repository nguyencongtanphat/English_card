import 'package:dictionary_flutter/values/app_colors.dart';
import 'package:dictionary_flutter/values/app_style.dart';
import 'package:dictionary_flutter/widgets/app_button.dart';
import 'package:flutter/material.dart';

class MyDrawer extends Drawer {
  final String? titleDrawer;
  List<Map>? listItem;

  MyDrawer({Key? key, this.titleDrawer, this.listItem})
      : super(
          key: key,
          child: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0, left: 16, bottom: 16),
                child: Text(
                  titleDrawer!,
                  style: AppStyles.h3.copyWith(
                    color: AppColor.textColor,
                  ),
                ),
              ),
              // listItem.map(
              //   (e) => Container(

              //   ),
              // ).toList();
            ]),
          ),
        );
}




// Container(
//           child: SafeArea(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding:
//                       const EdgeInsets.only(top: 24.0, left: 16, bottom: 16),
//                   child: Text(
//                     'Management',
//                     style: AppStyles.h3.copyWith(
//                       color: AppColor.textColor,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 24),
//                   child: AppButton(
//                       label: 'Favorites',
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => FavoritesPage(
//                               words: words,
//                             ),
//                           ),
//                         );
//                       }),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 24),
//                   child: AppButton(
//                       label: 'Your Controll',
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const ControllPage()),
//                         );
//                       }),
//                 )
//               ],
//             ),
//           ),
//         )