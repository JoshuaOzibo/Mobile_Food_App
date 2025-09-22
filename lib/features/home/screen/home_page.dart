import 'package:flutter/material.dart';
import 'package:mobile_food_app/core/icons.dart';
import 'package:mobile_food_app/core/nova_colors.dart';
import 'package:mobile_food_app/features/cart/screen/cart_screen.dart';
import 'package:mobile_food_app/features/favorite/screen/favorite.dart';
import 'package:mobile_food_app/features/home/screen/index.dart';
import 'package:mobile_food_app/features/notification/screen/notification_screen.dart';
import 'package:mobile_food_app/networks/api_request.dart';
import 'package:mobile_food_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentBottomIndex = 0;

  @override
  Widget build(BuildContext context) {
    void fetchData() async{
      final api = ApiRequest();
    final foodData = await api.getFood();
    print(foodData);
     }

     fetchData();
    final pages = [
      Index(),
      CartScreen(
        onNavigateHome: () => setState(() {
          currentBottomIndex = 0;
        }),
      ),
      FavoriteScreen(
        onNavigateHome: () => setState(() {
          currentBottomIndex = 0;
        }),
      ),
      NotificationScreen(),
    ];
    final cartLength = Provider.of<CartProvider>(
      context,
      listen: true,
    ).cart.length;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(13, 13, 13, 1),
      body: IndexedStack(index: currentBottomIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentBottomIndex,
        onTap: ((item) => setState(() {
          currentBottomIndex = item;
        })),
        selectedItemColor: NovaColors.primaryOrange,
        unselectedItemColor: NovaColors.textSecondary,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 20), label: '.'),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(uiIcons['shopping_bag'], size: 20),
                if (cartLength > 0)
                  Positioned(
                    left: 10,
                    child: Container(
                      height: 9,
                      width: 9,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 229, 15, 0),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
              ],
            ),
            label: '.',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(uiIcons['favorite'], size: 20),
                Positioned(
                  left: 10,
                  child: Container(
                    height: 9,
                    width: 9,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 229, 15, 0),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ],
            ),
            label: '.',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(uiIcons['notification'], size: 20),
                Positioned(
                  left: 10,
                  child: Container(
                    height: 9,
                    width: 9,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 229, 15, 0),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ],
            ),
            label: '.',
          ),
        ],
      ),
    );
  }
}
