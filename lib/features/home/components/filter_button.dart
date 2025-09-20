import 'package:flutter/material.dart';
import 'package:mobile_food_app/core/nova_colors.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTapFilter,
  });

  final String text;
  final bool isSelected;
  final GestureTapCallback onTapFilter;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 1),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 3,
            style: BorderStyle.solid,
            color: isSelected ? NovaColors.primaryOrange : Colors.black,
          ),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: onTapFilter,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? NovaColors.primaryOrange : NovaColors.textGray,
            ),
        ),
      ),
    );
  }
}
