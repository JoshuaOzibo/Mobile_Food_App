import 'package:flutter/material.dart';
import 'package:mobile_food_app/core/icons.dart';
import 'package:mobile_food_app/core/nova_colors.dart';
import 'package:mobile_food_app/core/components/text_helper.dart';
import 'package:mobile_food_app/features/details/component/size_button.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({super.key, required this.meal});

  final Map<String, dynamic> meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NovaColors.backgroundDark,
      body:  Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(20),
                  child: Image.network(
                    meal['strMealThumb'],
                    height: 550,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Positioned(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: NovaColors.searchBar,
                          ),
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              uiIcons['arrow_back'],
                              size: 18,
                              color: NovaColors.searchBarIcon,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: NovaColors.searchBar,
                          ),
                          child: Icon(
                            uiIcons['favorite'],
                            size: 18,
                            color: NovaColors.primaryOrange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 135,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                        bottom: Radius.circular(20),
                      ),
                      color: const Color.fromARGB(255, 66, 21, 0).withOpacity(0.9), 
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          spacing: 5,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                            limitToTwoWords(meal['strMeal']),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            Text(
                              meal['strCategory'],
                              style: TextStyle(
                                fontSize: 10,
                                color: NovaColors.textGray,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              spacing: 2,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  uiIcons['star'],
                                  size: 15,
                                  color: Colors.white,
                                ),
                                Text(
                                  '${meal['idMeal'].hashCode % 5 + 1}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
      
                        Row(
                          spacing: 10,
                          children: [
                            Container(
                              width: 80,
                              padding: EdgeInsets.symmetric(vertical: 8),
                              height: 65,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: NovaColors.cardColor,
                              ),
                              child: Column(
                                spacing: 5,
                                children: [
                                  Icon(Icons.battery_std),
                                  Text(
                                    'Chips',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 80,
                              padding: EdgeInsets.symmetric(vertical: 8),
                              height: 65,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: NovaColors.cardColor,
                              ),
                              child: Column(
                                spacing: 5,
                                children: [
                                  Icon(Icons.battery_1_bar),
                                  Text(
                                    'Cucumber',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
      
            SizedBox(height: 40,),
      
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deacription',
                    style: TextStyle(
                      fontSize: 20,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'A long, then a round pasta that originated in italy. it is a staple in many household around the world and is often served with tomato Read More.',
                    style: TextStyle(
                      fontSize: 13,
                      decoration: TextDecoration.none,
                      color: NovaColors.textGray
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Size (Diameter)',
                    style: TextStyle(
                      fontSize: 15,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [SizeButton(), SizeButton(), SizeButton()],
                  ),
      
                  SizedBox(height: 40,),
      
                  Row(
                    spacing: 15,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Price',
                            style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.none,
                              color: NovaColors.textSecondary
                            ),
                          ),
                          Text(
                            '\$${(5 + (meal['idMeal'].hashCode % 20))}',
                            style: TextStyle(
                              fontSize: 20,
                              decoration: TextDecoration.none,
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
      
                      SizedBox(
                        height: 50,
                        width: 300,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), 
                            ),
                            elevation: 0,
                            backgroundColor: NovaColors.primaryOrange,
                          ),
                          onPressed: () => print('Hello'),
                          child: Text('Buy now', style: TextStyle(color: Colors.white, fontSize: 15),),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
