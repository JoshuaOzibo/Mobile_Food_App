import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mobile_food_app/features/cart/databaseType/db_product_class.dart';
import 'package:mobile_food_app/features/cart/viewmodel/cart_viewmodel.dart';
import 'package:mobile_food_app/features/favorite/viewmodel/favorite_viewmodel.dart';
import 'package:mobile_food_app/features/home/repositories/home_page_repository.dart';
import 'package:mobile_food_app/features/home/screen/home_page.dart';
import 'package:mobile_food_app/core/nova_colors.dart';
import 'package:mobile_food_app/features/home/viewmodel/view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DatabaseProductClassAdapter());

  await Hive.openBox<DatabaseProductClass>('cart');
   await Hive.openBox<DatabaseProductClass>('favorite');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(repository: HomePageRepository()),
        ),
        ChangeNotifierProvider(create: (_) => CartViewmodel()),
        ChangeNotifierProvider(create: (_) => FavoriteViewmodel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: NovaColors.backgroundDark,
          scrolledUnderElevation: 0,
        ),
      ),
      home: const HomePage(),
    );
  }
}
