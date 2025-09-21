import 'package:flutter/material.dart';
import 'package:mobile_food_app/core/icons.dart';
import 'package:mobile_food_app/core/nova_colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.price,
    required this. handleProductTap,
  });

  final String image;
  final String title;
  final String subTitle;
  final String price;
  final GestureTapCallback  handleProductTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 100,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: NovaColors.cardDark,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 135,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: NovaColors.textSecondary,
            ),
            child: Image.asset(
              height: double.infinity,
              image
              ),
          ),

         const Spacer(),

          Text(title),
         const SizedBox(height: 5),
          Text(subTitle),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(price),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: NovaColors.chipsRed,
                ),
                child: GestureDetector(
                  onTap: handleProductTap,
                  child: Icon(
                    uiIcons['add'], 
                    size: 20)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
