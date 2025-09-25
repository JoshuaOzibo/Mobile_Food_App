import 'package:flutter/material.dart';
import 'package:mobile_food_app/core/icons.dart';
import 'package:mobile_food_app/core/nova_colors.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(20),
                child: Image.asset(
                  'assets/images/chilli-9202873_1280.jpg',
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
                    color: NovaColors.primaryOrange,
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
                            'Spaghetti',
                            style: TextStyle(fontSize: 20, color: Colors.white, decoration: TextDecoration.none,),
                          ),
                          Text(
                            'With chips & Cucumber',
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
                                '4.2(6.986)',
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
                                Icon(Icons.abc_outlined),
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
                                Icon(Icons.abc_outlined),
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

          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Deacription', style: TextStyle(fontSize: 20, decoration: TextDecoration.none,),),
                Text(
                  'A long, then a round pasta that originated in italy. it is a staple in many household around the world and is often served with tomato Read More.',
                  style: TextStyle(fontSize: 10, decoration: TextDecoration.none,),
                ),
                Text('Size'),
                Row(
                  children: [
                    Container(
                      
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
