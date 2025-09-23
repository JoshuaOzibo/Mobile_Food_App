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
    required this.handleProductTap,
    required this.rating,
  });

  final String image;
  final String title;
  final String subTitle;
  final double price;
  final GestureTapCallback handleProductTap;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 100,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: NovaColors.cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 135,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  child: Image.asset(
                    image,
                    height: double.infinity, 
                    fit: BoxFit.cover,
                    ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: NovaColors.badgeColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(8)
                      )
                    ),
                    child: Row(
                      spacing: 2,
                      children: [
                        Icon(uiIcons['star'], size: 13, color: NovaColors.lightOrange,),
                        Text(rating.toString(), style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  )
                )
              ],
            ),
          ),

          const Spacer(),

          Text(title),
          const SizedBox(height: 5),
          Text(subTitle, style: TextStyle(color: NovaColors.textGray),),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${price.toString()}'),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: NovaColors.primaryOrange,
                ),
                child: GestureDetector(
                  onTap: handleProductTap,
                  child: Icon(uiIcons['add'], size: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
