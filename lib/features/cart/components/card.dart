import 'package:flutter/material.dart';
import 'package:mobile_food_app/core/icons.dart';
import 'package:mobile_food_app/core/nova_colors.dart';
import 'package:mobile_food_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.singleItem,
    required this.quantity,
  });

  final String image;
  final String title;
  final String subTitle;
  final double price;
  final int quantity;
  final Map<String, dynamic> singleItem;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CartProvider>(context, listen: false);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
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
              child: Image.network(fit: BoxFit.cover, image),
            ),
          ),
          Expanded(
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                Text('X ${quantity.toString()}', style: TextStyle(color: NovaColors.priceWhite),),
                  ],
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
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: NovaColors.primaryOrange,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            spacing: 15,
                            children: [
                              GestureDetector(
                                onTap: () => productProvider.decrement(singleItem),
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
                                onTap: () => productProvider.increment(singleItem),
                                child: Icon(uiIcons['add'], size: 23),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () => productProvider.removeProduct(singleItem),
                          child: Icon(
                            uiIcons['delete'],
                            color: NovaColors.chipsRed,
                            size: 32,
                          ),
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
