import 'package:flutter/material.dart';

class textFields extends StatelessWidget {
  final String hint;
  Icon? prefix;
  textFields({
    super.key,
    required this.hint,
    this.prefix,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        decoration: InputDecoration(
          label: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(hint),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: prefix,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
