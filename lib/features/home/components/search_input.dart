import 'package:flutter/material.dart';
import 'package:mobile_food_app/core/icons.dart';
import 'package:mobile_food_app/core/nova_colors.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({super.key, required this.onChange});
  final ValueChanged<String> onChange;

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      autocorrect: true,
      autofillHints: Characters(''),
      decoration: InputDecoration(
        hint: const Text(
          'What do you want to eat? ',
          style: TextStyle(color: NovaColors.textGray, fontSize: 16),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            widget.onChange(_textEditingController.text);
            _textEditingController.clear();
          },
          child: Icon(uiIcons['search']),
        ),
        suffixIconColor: NovaColors.textGray,
        fillColor: NovaColors.searchBar,
        filled: true,
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
