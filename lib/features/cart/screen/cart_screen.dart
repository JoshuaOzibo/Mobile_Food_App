import 'package:flutter/material.dart';
import 'package:mobile_food_app/features/cart/components/card.dart';
import 'package:mobile_food_app/core/icons.dart';
import 'package:mobile_food_app/core/nova_colors.dart';
import 'package:provider/provider.dart';
import 'package:mobile_food_app/providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key, required this.onNavigateHome});

  final VoidCallback onNavigateHome;

  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<CartProvider>(context, listen: true);
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
                        cartItems.cart.length.toString(),
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
            // Map with this card
            SizedBox(
              height: 460,
              child: ListView(
                addSemanticIndexes: true,
                semanticChildCount: cartItems.cart.length,
                padding: EdgeInsets.symmetric(horizontal: 5),
                children: [
                  if (cartItems.cart.isEmpty)
                    Center(
                      child: Text('No item added to cart')),
                  ...cartItems.cart.map(
                    (item) => CartCard(
                      image: item['image'],
                      title: item['title'],
                      subTitle: item['subTitle'],
                      price: item['price'],
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
                      cartItems.subTotal.toString(),
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
                      cartItems.deliveryFee.toString(),
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
                  cartItems.total.toString(),
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
