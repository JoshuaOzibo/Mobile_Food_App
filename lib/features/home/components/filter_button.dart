import 'package:flutter/material.dart';

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
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.white),
        borderRadius: BorderRadius.circular(10)
      ),
      child: GestureDetector(
        onTap: onTapFilter,
        child: Text(
          text,
          style: TextStyle(color: isSelected ? Colors.red : Colors.blue),
        ),
      ),
    );
  }
}
