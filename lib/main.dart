import 'package:flutter/material.dart';
import 'package:mobile_food_app/features/home/screen/home_page.dart';
import 'package:mobile_food_app/core/nova_colors.dart';
import 'package:mobile_food_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
          appBarTheme: AppBarTheme(backgroundColor: NovaColors.backgroundDark),
        ),
        home: HomePage(),
      ),
    );
  }
}
