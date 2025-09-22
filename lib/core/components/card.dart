import 'package:flutter/material.dart';
import 'package:mobile_food_app/core/icons.dart';
import 'package:mobile_food_app/core/nova_colors.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: Image.asset(
                fit: BoxFit.cover,
                'assets/images/chilli-9202873_1280.jpg',
              ),
            ),
          ),
          Expanded(
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Spaghetti',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'with chips & cucumber',
                  style: TextStyle(fontSize: 16, color: NovaColors.textGray),
                ),

                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$6.22',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    Row(
                      spacing: 8,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: NovaColors.searchBar,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            spacing: 15,
                            children: [
                              GestureDetector(
                                onTap: () => print('Decrement'),
                                child: Icon(uiIcons['remove'], size: 23),
                              ),
                              Text(
                                '1',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => print('Increase'),
                                child: Icon(uiIcons['add'], size: 23),
                              ),
                            ],
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
