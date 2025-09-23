import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({super.key});

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  // Generate A–Z list
  final List<String> alphabetItems =
      List.generate(26, (index) => String.fromCharCode(65 + index));

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      menuMaxHeight: 200,
      underline: null,
      elevation: 0,
      borderRadius: BorderRadius.circular(12),
      hint: const Text("A–Z"),
      value: selectedValue,
      items: alphabetItems.map((letter) {
        return DropdownMenuItem(
          value: letter,
          child: Text(letter),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });
      },
    );
  }
}
