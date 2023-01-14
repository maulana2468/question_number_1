import 'package:flutter/material.dart';

AlertDialog dialogPalindrom(BuildContext context, bool result, String text) {
  return AlertDialog(
    title: const Text(
      "Result",
      style: TextStyle(fontFamily: "Poppins"),
    ),
    titleTextStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: 20,
    ),
    actionsOverflowButtonSpacing: 20,
    actions: [
      ElevatedButton(
        onPressed: () => Navigator.pop(context),
        child: const Text(
          "OK",
          style: TextStyle(
            fontFamily: "Poppins",
            color: Colors.white,
          ),
        ),
      ),
    ],
    content: RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          fontFamily: "Poppins",
          fontSize: 14,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: (result) ? " is Palindrome" : " not Palindrome",
            style: const TextStyle(
              fontFamily: "Poppins",
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    ),
  );
}
