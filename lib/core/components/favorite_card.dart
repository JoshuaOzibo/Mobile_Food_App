import 'package:flutter/material.dart';
import 'package:mobile_food_app/core/icons.dart';
import 'package:mobile_food_app/core/nova_colors.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: NovaColors.cardDark,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          Image.asset(''),
          Column(
            children: [
              Text('Spaghetti'),
              Text('with chips & cucumber'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$6.22'),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: NovaColors.primaryOrange,
                    ),
                    child: GestureDetector(
                      onTap: () => print('favorite'),
                      child: Icon(uiIcons['add'], size: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
