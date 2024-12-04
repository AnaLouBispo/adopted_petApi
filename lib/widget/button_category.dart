
  import 'package:flutter/material.dart';

Widget categoryButton(String label, {required MaterialAccentColor color}) {
    return Container(
      height: 55,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 228, 228, 228),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }

