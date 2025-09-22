import 'package:flutter/material.dart';
import 'package:mobile_food_app/core/components/favorite_card.dart';
import 'package:mobile_food_app/core/icons.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(13, 13, 13, 1),
      appBar: AppBar(
        leadingWidth: 30,
        leading: Icon(uiIcons['arrow_back']),
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
