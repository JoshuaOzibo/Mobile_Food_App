import 'package:flutter/material.dart';
import 'package:mobile_food_app/core/components/card.dart';
import 'package:mobile_food_app/core/icons.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(13, 13, 13, 1),
      appBar: AppBar(
        leadingWidth: 25,
        leading: Container(
          margin: EdgeInsets.only(left: 5),
          child: Icon(uiIcons['arrow_back'])),
        title: Text(
          textAlign: TextAlign.center,
          'My Cart',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),

        actions: [Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Icon(uiIcons['cart']),
        )],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            // Map with this card
            CartCard(),
            Spacer(),
            Column(
              children: [
                Row(children: [Text('Subtotal'), Text('\$12.44')]),
                Row(children: [Text('Delivery Fee'), Text('\$1.50')]),
              ],
            ),
            SizedBox(height: 10),
            Row(children: [Text('TOTAL'), Text('\$13.94')]),
            SizedBox(
              height: 20,
              child: ElevatedButton(
                onPressed: () => print('Check out'),
                child: Text('Checkout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
