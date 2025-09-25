import 'package:flutter/material.dart';
import 'package:mobile_food_app/core/nova_colors.dart';

class SizeButton extends StatelessWidget {
  const SizeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: NovaColors.primaryOrange),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Text(
        '0.84mm',
        style: TextStyle(fontSize: 16, decoration: TextDecoration.none),
      ),
    );
  }
}
