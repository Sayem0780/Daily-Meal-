import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

TextSpan defaultTextSpan(String text) => TextSpan(
  text: text,
  style: TextStyle(
    color: Colors.black45,
    fontSize: 22,
  ),
);

TextSpan highlightedTextSpan(String text) => TextSpan(
  text: text,
  style: TextStyle(
    fontSize: 46,
    fontStyle: FontStyle.italic,
    color: Colors.red,
    fontWeight: FontWeight.bold,
  ),
);


Paint textBorderPaint = Paint()
  ..color = Colors.green
  ..style = PaintingStyle.stroke
  ..strokeCap = StrokeCap.round
  ..strokeWidth = 2.0;