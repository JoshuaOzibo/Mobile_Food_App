import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mobile_food_app/core/icons.dart';
import 'package:mobile_food_app/core/nova_colors.dart';
import 'package:mobile_food_app/core/app_text.dart';
import 'package:mobile_food_app/core/components/text_helper.dart';
import 'package:mobile_food_app/features/details/screen/food_details.dart';
import 'package:mobile_food_app/features/home/components/filter_button.dart';
import 'package:mobile_food_app/features/home/components/product_card.dart';
import 'package:mobile_food_app/features/home/components/search_input.dart';
import 'package:mobile_food_app/models/product_class.dart';
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
String errorMessage = '';
bool isMealLoading = true;
final homeFoodFetcher = FetchHomeData();
List<dynamic>? meals = [];

class _IndexState extends State<Index> {
  @override
  void initState() {
    super.initState();
    _fetchMeals();
  }

  Future<void> _fetchMeals() async {
    setState(() {
      isMealLoading = true;
    });
    try {
      final fetchByLetter = await homeFoodFetcher.fetchData(
        letter: letterValue,
      );
      if (fetchByLetter != null && fetchByLetter['meals'] != null) {
        setState(() {
          meals!.addAll(fetchByLetter['meals']);
          isMealLoading = false;
        });
      }
      if (fetchByLetter?['meals'] == null) {
        errorMessage = 'food with letter $letterValue is not avaliable';
        setState(() {
          isMealLoading = false;
        });
      }
      if (fetchByLetter == null) {
        errorMessage = 'error fetching food check your internet connection';
      }
      setState(() {
        isMealLoading = false;
      });
    } catch (e) {
      setState(() {
        meals = [];
        isMealLoading = false;
      });
      print(e);
    }
  }

  Future<void> _fetchFoodCategory(item) async {
    setState(() {
      isMealLoading = true;
      meals = [];
      selectedText = item;
    });
    try {
      final fetchFood = await homeFoodFetcher.fetchFoodByName(
        name: selectedText,
      );
      if (fetchFood != null && fetchFood['meals'] != null) {
        setState(() {
          meals!.addAll(fetchFood['meals']);
          isMealLoading = false;
        });

        if (fetchFood['meals'] == null) {
          errorMessage = 'food with name $item is not avaliable';
          setState(() {
            isMealLoading = false;
          });
        }
        if (fetchFood == null) {
          errorMessage = 'error fetching food check your internet connection';
        }
      } else {
        setState(() {
          isMealLoading = false;
          meals = [];
        });
      }
    } catch (e) {
      setState(() {
        meals = [];
        isMealLoading = false;
      });
      print('$e');
    }
  }

  Future<void> _handleSaerchByCategoty(category) async {
    setState(() {
      isMealLoading = true;
      meals = [];
    });
    try {
      final searchCategory = await homeFoodFetcher.searchFoodByCategory(
        category: category,
      );
      if (searchCategory != null && searchCategory['meals'] != null) {
        setState(() {
          meals!.addAll(searchCategory['meals']);
          isMealLoading = false;
        });
      }
      if (searchCategory?['meals'] == null) {
        errorMessage = 'food with category $category is not avaliable';
        setState(() {
          isMealLoading = false;
        });
      }
      if (searchCategory == null) {
        errorMessage = 'error fetching food check your internet connection';
      }
    } catch (e) {
      setState(() {
        isMealLoading = false;
        meals = [];
      });
      print(e);
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
                    child: SearchInput(
                      onChange: (value) => _handleSaerchByCategoty(value),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: NovaColors.searchBar,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      height: 60,
                      width: 80,
                      child: Dropdown(
                        handleSelectLetter: (item) {
                          setState(() {
                            meals = [];
                            letterValue = item;
                          });
                          _fetchMeals();
                        },
                      ),
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
                      onTapFilter: () => _fetchFoodCategory(item),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 40),

          if (isMealLoading)
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 150),
                child: CircularProgressIndicator(
                  color: NovaColors.lightOrange,
                  strokeWidth: 3,
                ),
              ),
            ),

          if (!isMealLoading && meals!.isEmpty)
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 150),
                child: Text(errorMessage),
              ),
            ),

          if (meals!.isNotEmpty)
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
                          providerHandler.addProduct(
                            ProductClass(
                              index: meal['idMeal'],
                              image: meal['strMealThumb'],
                              price: (5 + (meal['idMeal'].hashCode % 20)),
                              quantity: 1,
                              rating: (meal['idMeal'].hashCode % 5) + 1,
                              subTitle: meal['strCategory'],
                              title: limitToTwoWords(meal['strMeal']),
                            ),
                          );
                        },
                        isClicked: isFavoriteClicked,
                        handleTapedLiked: () {
                          favoriteProviderHandler.addFavorite(
                            ProductClass(
                              image: meal['strMealThumb'],
                              price: (5 + (meal['idMeal'].hashCode % 20)),
                              subTitle: meal['strCategory'],
                              title: limitToTwoWords(meal['strMeal']),
                              index: meal['idMeal'],
                              quantity: 1,
                              rating: (meal['idMeal'].hashCode % 5) + 1,
                            ),
                          );
                        },

                        handleTapSingleProduct: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FoodDetails(meal: meal),
                          ),
                        ),
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
