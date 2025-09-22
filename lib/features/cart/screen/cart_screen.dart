import 'package:flutter/material.dart';
import 'package:mobile_food_app/core/components/card.dart';
import 'package:mobile_food_app/core/icons.dart';
import 'package:mobile_food_app/core/nova_colors.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key, required this.onNavigateHome});

  final VoidCallback onNavigateHome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(13, 13, 13, 1),
      appBar: AppBar(
        leadingWidth: 25,
        leading: Container(
          margin: EdgeInsets.only(left: 5),
          child: GestureDetector(
            onTap: onNavigateHome,
            child: Icon(uiIcons['arrow_back']),
          ),
        ),
        title: Text(
          textAlign: TextAlign.center,
          'My Cart',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(uiIcons['cart']),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            // Map with this card
            const CartCard(),
            const Spacer(),
            const Column(
              spacing: 5,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '\$12.44',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery Fee',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '\$1.50',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 18),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TOTAL',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
                ),
                Text(
                  '\$13.94',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 209, 64, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => print('Check out'),
                child: Text(
                  'Checkout',
                  style: TextStyle(fontSize: 25, color: NovaColors.priceWhite),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
