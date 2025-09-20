import 'package:flutter/material.dart';
import 'package:mobile_food_app/core/icons.dart';
import 'package:mobile_food_app/core/nova_colors.dart';
import 'package:mobile_food_app/core/app_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeIcons = uiIcons.map((item) => item).toList();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(13, 13, 13, 1),
      appBar: AppBar(
        actionsPadding: EdgeInsetsDirectional.symmetric(horizontal: 10),
        toolbarHeight: 80,
        leading: Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: 50,
            width: 100,
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: NovaColors.searchBar,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                homeIcons[0]['menu'],
                size: 28,
                color: NovaColors.textGray,
              ),
            ),
          ),
        ),

        title: Row(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(uiIcons[0]['location'], color: NovaColors.textGray),
            Text(
              AppText.appTitle,
              style: TextStyle(
                color: NovaColors.textGray,
                fontSize: 16,
                // fontFamily:
              ),
            ),

            Icon(uiIcons[0]['arrow_down'], color: NovaColors.textGray),
          ],
        ),

        actions: [Icon(homeIcons[0]['avater'])],
      ),
      body: Placeholder(),
    );
  }
}
