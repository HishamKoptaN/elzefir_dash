import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const CustomOutlinedButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 71.73,
        height: 38.0,
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF002C51).withValues(alpha: 0.2),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'FreeSerif',
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            height: 1.5,
            color: Color(0xFF002C51),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
