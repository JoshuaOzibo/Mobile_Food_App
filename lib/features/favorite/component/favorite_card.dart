import 'package:flutter/material.dart';
import 'package:mobile_food_app/core/icons.dart';
import 'package:mobile_food_app/core/nova_colors.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({super.key, required this.image, required this.title, required this.subTitle, required this.price});

  final String image;
  final String title;
  final String subTitle;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: NovaColors.cardDark,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(100),
              child: Image.network(
                fit: BoxFit.cover,
                image,
              ),
            ),
          ),
          Expanded(
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  subTitle,
                  style: TextStyle(fontSize: 16, color: NovaColors.textGray),
                ),

                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${price.toString()}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    Row(
                      spacing: 8,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: NovaColors.primaryOrange,
                          ),
                          child: GestureDetector(
                            onTap: () => print('add to cart'),
                            child: Icon(uiIcons['add'], size: 20),
                          ),
                        ),
                        Icon(
                          uiIcons['delete'],
                          color: NovaColors.chipsRed,
                          size: 32,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
