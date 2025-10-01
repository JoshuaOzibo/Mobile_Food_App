import 'package:flutter/material.dart';
import 'package:mobile_food_app/core/components/empty_state.dart';
import 'package:mobile_food_app/core/components/text_helper.dart';
import 'package:mobile_food_app/features/cart/components/card.dart';
import 'package:mobile_food_app/core/icons.dart';
import 'package:mobile_food_app/core/nova_colors.dart';
import 'package:mobile_food_app/features/cart/viewmodel/cart_viewmodel.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key, required this.onNavigateHome});

  final VoidCallback onNavigateHome;

  @override
  Widget build(BuildContext context) {
    final cv = context.watch<CartViewmodel>();
    return Scaffold(
      backgroundColor: NovaColors.backgroundDark,
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
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(uiIcons['cart']),
                Positioned(
                  left: 6,
                  top: -8,
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(100),
                    ),

                    child: Center(
                      child: Text(
                        // textAlign: TextAlign.center,
                        cv.getCartItems.length.toString(),
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: 460,
              child: ListView(
                addSemanticIndexes: true,
                semanticChildCount: cv.getCartItems.length,
                padding: EdgeInsets.symmetric(horizontal: 5),
                children: [
                  if (cv.getCartItems.isEmpty)
                    Center(
                      child: SizedBox(
                        height: 400,
                        child: Align(
                          alignment: Alignment.center,
                          child: EmptyState(text: 'Cart'),
                        ),
                      ),
                    ),

                  ...cv.getCartItems.map(
                    (item) => CartCard(
                      image: item.thumbnail,
                      title: limitToTwoWords(item.name),
                      subTitle: item.category,
                      price: item.price,
                      quantity: item.quantity,
                      singleItem: item,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Column(
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
                      '\$${cv.getSubTotal.toString()}',
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
                      '\$${cv.getCartItems.isEmpty ? 0.0 : cv.deliveryFee.toString()}',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TOTAL',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
                ),
                Text(
                  '\$${cv.totalShopping.toString()}',
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
                  backgroundColor: NovaColors.primaryOrange,
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
