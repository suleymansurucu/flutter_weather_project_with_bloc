import 'package:flutter/material.dart';

class TransparentBackgroundColor extends StatelessWidget {

  final Widget child;
  final MaterialColor color;
   TransparentBackgroundColor({super.key, required this.child, required this.color});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox.expand(
        child: Container(
          child: child,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.shade700,
                color.shade400,
                color.shade100
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              // stops: [0.3, 0.3, 0.3], // Stops sıralı olmalı
            ),
          ),
        ),
      ),
    );
  }
}
