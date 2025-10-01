import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mobile_food_app/core/components/snackbar.dart';
import 'package:mobile_food_app/core/icons.dart';
import 'package:mobile_food_app/core/nova_colors.dart';
import 'package:mobile_food_app/core/app_text.dart';
import 'package:mobile_food_app/core/components/text_helper.dart';
import 'package:mobile_food_app/features/cart/viewmodel/cart_viewmodel.dart';
import 'package:mobile_food_app/features/details/screen/food_details.dart';
import 'package:mobile_food_app/features/favorite/viewmodel/favorite_viewmodel.dart';
import 'package:mobile_food_app/features/home/components/filter_button.dart';
import 'package:mobile_food_app/features/home/components/product_card.dart';
import 'package:mobile_food_app/features/home/components/search_input.dart';
import 'package:mobile_food_app/models/product_class.dart';
import 'package:provider/provider.dart';
import 'package:mobile_food_app/features/home/components/drop_down.dart';
import 'package:mobile_food_app/features/home/viewmodel/view_model.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

bool isFavoriteClicked = false;
bool isTextSelected = true;
String selectedText = 'Pasta';
String letterValue = 'a';
String errorMessage = '';
bool isMealLoading = true;
List<dynamic>? meals = [];

class _IndexState extends State<Index> {
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeViewModel>().fetchProducts(letterValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();
    final cm = context.watch<CartViewmodel>();
    final fv = context.watch<FavoriteViewmodel>();
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

        actions: [
          Container(
            clipBehavior: Clip.none,
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(100),
              child: Image.asset('assets/images/estin.webp', fit: BoxFit.cover),
            ),
          ),
        ],
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
                      onChange: (value) => setState(() {
                        vm.getProducts.clear();
                        vm.searchFoodCategory(value);
                      }),
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
                            vm.getProducts.clear();
                            letterValue = item;
                          });
                          vm.fetchProducts(letterValue);
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
                      onTapFilter: () => {
                        selectedText = item,
                        setState(() {
                          vm.getProducts.clear();
                          vm.fetchByName(item);
                        }),
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 40),

          if (vm.isLoading)
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 150),
                child: CircularProgressIndicator(
                  color: NovaColors.lightOrange,
                  strokeWidth: 3,
                ),
              ),
            ),

          if (vm.getProducts.isEmpty &&
              !vm.isLoading &&
              vm.errorMessage != null)
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 150),
                child: Text(vm.errorMessage!),
              ),
            ),

          if (vm.getProducts.isNotEmpty)
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
                    ...vm.getProducts.map(
                      (meal) => ProductCard(
                        image: meal.thumbnail,
                        title: meal.name,
                        subTitle: meal.category,
                        price: (5 + (meal.id.hashCode % 20)).toDouble(),
                        rating: (meal.id.hashCode % 5) + 1,
                        handleProductTap: () {
                          final exist = cm.getCartItems.any(
                            (item) => item.id == meal.id,
                          );
                          if (exist) {
                            CustomSnackbar.show(
                              context,
                              '${meal.name} Already in Cart',
                              const Color.fromARGB(255, 223, 15, 0),
                            );
                          } else {
                            cm.addToCartFunc(
                              ProductClass(
                                id: meal.id,
                                name: meal.name,
                                category: meal.category,
                                area: meal.area,
                                instructions: meal.area,
                                thumbnail: meal.thumbnail,
                                ingredients: meal.ingredients,
                                measures: meal.measures,
                                quantity: 1,
                                rating: (meal.id.hashCode % 5) + 1,
                                price: (5 + (meal.id.hashCode % 20)),
                              ),
                            );
                            CustomSnackbar.show(
                              context,
                              '${meal.name} Added to Cart',
                              NovaColors.primaryOrange,
                            );
                          }
                        },
                        isClicked: isFavoriteClicked,
                        handleTapedLiked: () {
                          final exist = fv.getFavList.any(
                            (item) => item.id == meal.id,
                          );
                          if (exist) {
                            CustomSnackbar.show(
                              context,
                              '${meal.name} Already in Favorite list',
                              const Color.fromARGB(255, 223, 15, 0),
                            );
                          } else {
                            fv.addToFavorite(
                              ProductClass(
                                id: meal.id,
                                name: meal.name,
                                category: meal.category,
                                area: meal.area,
                                instructions: meal.area,
                                thumbnail: meal.thumbnail,
                                ingredients: meal.ingredients,
                                measures: meal.measures,
                                quantity: 1,
                                rating: (meal.id.hashCode % 5) + 1,
                                price: (5 + (meal.id.hashCode % 20)),
                              ),
                            );
                            CustomSnackbar.show(
                              context,
                              '${meal.name} Added to Favorite',
                              NovaColors.primaryOrange,
                            );
                          }
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
