import 'package:flutter/material.dart';
import 'package:mobile_food_app/core/icons.dart';
import 'package:mobile_food_app/core/nova_colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: NovaColors.textSecondary,
      ),
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: NovaColors.textSecondary,
            ),
          ),

          Text('Spaghetti'),
          Text('With chips & Cucumber'),

          Row(
            children: [
              Text('\$6.22'),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: NovaColors.chipsRed,
                ),
                child: Icon(uiIcons['add']),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
