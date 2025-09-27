import 'package:flutter/material.dart';

class CustomSnackbar {
  static void show(BuildContext context, String text, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        content: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        backgroundColor: color,
      ),
    );
  }
}
