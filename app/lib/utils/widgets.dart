import 'package:flutter/material.dart';

Widget styledText(
    {required String title,
    required Color color,
    required double size,
    required bool isBold}) {
  return Text(
    title,
    style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
  );
}

Widget styledButton(
    {required String name, required double width, required Color color}) {
  return Container(
    height: 50,
    width: width,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      color: color,
    ),
    child: Center(
      child: Text(
        name,
        style: const TextStyle(
            fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
