import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String label;
  final Color color;
  final Color textColor;
  final ShapeBorder shape;
  final VoidCallback onPressed;
  final double fontSize;

  const CalcButton({
    super.key,
    required this.label,
    this.color = const Color.fromARGB(255, 65, 65, 65),
    this.textColor = Colors.white,
    this.shape = const CircleBorder(),
    required this.onPressed,
    this.fontSize = 25,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 80,
        child: FloatingActionButton(
          onPressed: onPressed,
          backgroundColor: color,
          foregroundColor: textColor,
          shape: shape,
          child: Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
