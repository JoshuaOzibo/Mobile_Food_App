import 'package:flutter/material.dart';
import 'package:mobile_food_app/core/components/card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.center,
          'My Cart',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
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
