import 'package:flutter/material.dart';

void main() {
  runApp(
    Center(
      child: Text(
        'Hello flutter',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          color: Colors.redAccent,
          fontSize: 32,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}
