import 'package:flutter/material.dart';
import 'package:mobile_food_app/core/icons.dart';
import 'package:mobile_food_app/core/nova_colors.dart';
import 'package:mobile_food_app/core/app_text.dart';
import 'package:mobile_food_app/features/home/components/filter_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

bool isTextSelected = true;
String selectedText = 'Pasta';

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(13, 13, 13, 1),
      appBar: AppBar(
        actionsPadding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
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
                uiIcons['menu'],
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
            Icon(uiIcons['location'], color: NovaColors.textGray, size: 20),
            const Text(
              AppText.appTitle,
              style: TextStyle(
                color: NovaColors.textGray,
                fontSize: 16,
                // fontFamily:
              ),
            ),

            Icon(uiIcons['arrow_down'], color: NovaColors.textGray),
          ],
        ),

        actions: [Icon(uiIcons['avater'], size: 50)],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  AppText.bodyTitle,
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                const Text(
                  AppText.bodySubTitle,
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 50,
              child: TextField(
                autocorrect: true,
                autofillHints: Characters(''),
                decoration: InputDecoration(
                  hint: const Text(
                    'search for your food',
                    style: TextStyle(color: NovaColors.textGray, fontSize: 16),
                  ),
                  suffixIcon: Icon(uiIcons['search']),
                  suffixIconColor: NovaColors.textGray,
                  fillColor: NovaColors.searchBar,
                  filled: true,
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
          ),

          SizedBox(height: 40,),

          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...filterText.map(
                    (item) => FilterButton(
                      text: item,
                      isSelected: selectedText == item
                          ? isTextSelected
                          : !isTextSelected,
                      onTapFilter: () => setState(() {
                        selectedText = item;
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
