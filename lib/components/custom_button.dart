import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class CustomButton extends StatelessWidget {
  final String title;
  dynamic  onPressed;
  CustomButton({required this.title, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      padding: const EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[kOrange, kYellow],
          ),
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
        ),
        child: Container(
          constraints: const BoxConstraints(
              minWidth: 88.0,
              minHeight: 36.0), // min sizes for Material buttons
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
