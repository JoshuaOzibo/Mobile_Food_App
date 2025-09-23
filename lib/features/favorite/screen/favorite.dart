import 'package:flutter/material.dart';
import 'package:mobile_food_app/features/favorite/component/favorite_card.dart';
import 'package:mobile_food_app/core/icons.dart';
import 'package:mobile_food_app/core/nova_colors.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key, required this.onNavigateHome});

  final VoidCallback onNavigateHome;

  @override
  Widget build(BuildContext context) {
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
        child: const Column(children: [SizedBox(height: 20), FavoriteCard()]),
      ),
    );
  }
}
