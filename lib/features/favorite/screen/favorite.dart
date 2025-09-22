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
        title: Text('Favorites'),

        actions: [Icon(uiIcons['favorite_border'])],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [FavoriteCard()]),
      ),
    );
  }
}
