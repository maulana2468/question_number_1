import 'package:flutter/material.dart';
import 'package:suitmedia_question_1/models/model_list.dart';

Widget listItem(Datum? datum, Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    datum?.avatar as String,
                  ),
                  radius: 49 / 2,
                ),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${datum?.firstName} ${datum?.lastName}",
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "${datum?.email}",
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Divider(
            color: Color(0xffe9e9e9),
            height: 1,
            thickness: 1,
          ),
        ],
      ),
    ),
  );
}
