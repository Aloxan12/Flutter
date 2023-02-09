import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('My first flutter app'),
          centerTitle: true,
        ),
        body: Text('This is my homepage', style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
      ),
    ),
  );
}
