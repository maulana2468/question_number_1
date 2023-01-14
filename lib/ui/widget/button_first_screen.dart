import 'package:flutter/material.dart';

Widget buttonFirstScreen(String text, Function() onClick) {
  return GestureDetector(
    onTap: onClick,
    child: Container(
      height: 41,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xff2B637B),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: "Poppins",
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
