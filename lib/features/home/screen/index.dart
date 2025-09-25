import 'package:flutter/material.dart';
import 'package:mobile_food_app/core/icons.dart';
import 'package:mobile_food_app/core/nova_colors.dart';
import 'package:mobile_food_app/core/app_text.dart';
import 'package:mobile_food_app/features/details/screen/food_details.dart';
import 'package:mobile_food_app/features/favorite/component/favorite_class.dart';
import 'package:mobile_food_app/features/home/components/filter_button.dart';
import 'package:mobile_food_app/features/home/components/product_card.dart';
import 'package:mobile_food_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:mobile_food_app/features/home/components/drop_down.dart';
import 'package:mobile_food_app/features/home/viewmodel/view_model.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

bool isTextSelected = true;
bool isFavoriteClicked = false;
String selectedText = 'Pasta';
String letterValue = 'a';
final homeFoodFetcher = FetchHomeData();
List<dynamic>? meals = [];

class _IndexState extends State<Index> {
  @override
  void initState() {
    super.initState();
    _fetchMeals();
  }

  Future<void> _fetchMeals() async {
    final data = await homeFoodFetcher.fetchData(letter: letterValue);
    if (data != null && data['meals'] != null) {
      setState(() {
        meals!.addAll(data['meals']);
      });
      print(letterValue);
    } else {
      setState(() {
        meals = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final providerHandler = Provider.of<CartProvider>(context, listen: false);
    final favoriteProviderHandler = Provider.of<FavoriteItemProvider>(
      context,
      listen: false,
    );
    return Scaffold(
      backgroundColor: NovaColors.backgroundDark,
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
                color: NovaColors.searchBarIcon,
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
          const SizedBox(height: 10),
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
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 50,
              child: Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: TextField(
                      autocorrect: true,
                      autofillHints: Characters(''),
                      decoration: InputDecoration(
                        hint: const Text(
                          'search for your food',
                          style: TextStyle(
                            color: NovaColors.textGray,
                            fontSize: 16,
                          ),
                        ),
                        suffixIcon: Icon(uiIcons['search']),
                        suffixIconColor: NovaColors.textGray,
                        fillColor: NovaColors.searchBar,
                        filled: true,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width: 100,
                    child: Dropdown(
                      handleSelectLetter: (item) {
                        setState(() {
                          letterValue = item;
                        });
                        _fetchMeals();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 30),

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

          const SizedBox(height: 40),

          SizedBox(
            height: 390,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.68,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                ),

                children: [
                  ...meals!.map(
                    (meal) => ProductCard(
                      image: meal['strMealThumb'],
                      title: meal['strMeal'],
                      subTitle: meal['strCategory'],
                      price: (5 + (meal['idMeal'].hashCode % 20)).toDouble(),
                      rating: (meal['idMeal'].hashCode % 5) + 1,
                      handleProductTap: () {
                        providerHandler.addProduct({
                          "index": meal['idMeal'],
                          "image": meal['strMealThumb'],
                          "title": meal['strMeal'],
                          "subTitle": meal['strCategory'],
                          "price": (5 + (meal['idMeal'].hashCode % 20))
                              .toDouble(),
                          "rating": (meal['idMeal'].hashCode % 5) + 1,
                          "quantity": 1,
                        });
                      },
                      isClicked: isFavoriteClicked,
                      handleTapedLiked: () {
                        favoriteProviderHandler.addFavorite(
                          FavoriteClass(
                            image: meal['strMealThumb'],
                            price: (5 + (meal['idMeal'].hashCode % 20)),
                            subTitle: meal['strCategory'],
                            title: meal['strMeal'],
                          ),
                        );
                        // setState(() {
                        //   isFavoriteClicked = true;
                        // });
                      },

                      handleTapSingleProduct:() => Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetails())),
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
