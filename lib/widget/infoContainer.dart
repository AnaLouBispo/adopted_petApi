import 'package:flutter/material.dart';

class Infocontainer extends StatelessWidget {
  final String text; 
  final Color borderColor; 

  const Infocontainer({
    Key? key,
    required this.text,
    this.borderColor = Colors.blue, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 55,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor, 
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
