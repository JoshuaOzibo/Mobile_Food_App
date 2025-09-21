import 'package:flutter/material.dart';
import 'package:mobile_food_app/core/icons.dart';
import 'package:mobile_food_app/core/nova_colors.dart';

class NovaCard extends StatelessWidget {
  const NovaCard({super.key});

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
                children: [
                  Text('\$6.22'),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: NovaColors.searchBar,
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: Row(
                      children: [
                        Icon(uiIcons['remove'], size: 20),
                        Text('1'),
                        Icon(uiIcons['add'], size: 20),
                      ],
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
