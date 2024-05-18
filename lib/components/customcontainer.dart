import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;

  CustomContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4.0),
        margin: EdgeInsets.all(10.0),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xFF9F7BFF).withOpacity(0.1), // Background color
          border: Border.all(
            color: Color(0xFF9F7BFF), // Border color
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
          child: child,
        ),
      ),
    );
  }
}
