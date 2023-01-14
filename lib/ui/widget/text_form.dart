import 'package:flutter/material.dart';

Widget textForm(String hint, Function(String) onChanged) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xffffffff),
      borderRadius: BorderRadius.circular(12),
    ),
    padding: const EdgeInsets.symmetric(vertical: 7.94, horizontal: 20),
    child: TextFormField(
      style: const TextStyle(
        fontFamily: "Poppins",
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      onChanged: onChanged,
      decoration: InputDecoration.collapsed(
        hintText: hint,
        hintStyle: const TextStyle(
          fontFamily: "Poppins",
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xffb7b7b7),
        ),
      ),
    ),
  );
}
