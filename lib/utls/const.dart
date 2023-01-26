import 'package:flutter/material.dart';

const sboxW16 = SizedBox(width: 16);
const sboxW8 = SizedBox(width: 8);
const sboxH16 = SizedBox(height: 16);
const sboxH8 = SizedBox(height: 8);

Text heaingText(String text,
    {double? fontSize = 20, FontWeight? fontWeight, Color? color}) {
  return Text(
    text,
    style: TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
  );
}

const horizontal16 = EdgeInsets.symmetric(horizontal: 16);
const horizontal12 = EdgeInsets.symmetric(horizontal: 12);
const vertical16 = EdgeInsets.symmetric(vertical: 16);
const vertical12 = EdgeInsets.symmetric(vertical: 12);
const all16 = EdgeInsets.all(16);
const left16 = EdgeInsets.only(left: 16);
const right16 = EdgeInsets.only(right: 16);
