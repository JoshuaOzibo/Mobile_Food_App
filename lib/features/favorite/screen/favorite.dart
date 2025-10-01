import 'package:flutter/material.dart';
import 'package:mobile_food_app/core/components/empty_state.dart';
import 'package:mobile_food_app/core/components/text_helper.dart';
import 'package:mobile_food_app/features/favorite/component/favorite_card.dart';
import 'package:mobile_food_app/core/icons.dart';
import 'package:mobile_food_app/core/nova_colors.dart';
import 'package:mobile_food_app/features/favorite/viewmodel/favorite_viewmodel.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key, required this.onNavigateHome});
  final VoidCallback onNavigateHome;

  @override
  Widget build(BuildContext context) {
    final fv = context.read<FavoriteViewmodel>();
    return Scaffold(
      backgroundColor: NovaColors.backgroundDark,
      appBar: AppBar(
        leadingWidth: 30,
        leading: GestureDetector(
          onTap: onNavigateHome,
          child: Icon(uiIcons['arrow_back']),
        ),
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            'Favorites',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(uiIcons['favorite_border']),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  if (fv.getFavList.isEmpty)
                    Container(
                      margin: EdgeInsets.only(top: 150),
                      child: EmptyState(text: 'Favourite '),
                    ),
                  ...fv.getFavList.map(
                    (item) => FavoriteCard(
                      image: item.thumbnail,
                      title: limitToTwoWords(item.name),
                      subTitle: item.category,
                      price: item.price!,
                      handleRemoveFavoriteItemFromList: () =>
                          fv.removeFromFavorite(item),
                      handleAddToCart: () => fv.addToCart(item),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
