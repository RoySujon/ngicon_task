import 'package:flutter/material.dart';

const sboxW16 = SizedBox(width: 16);
const sboxW8 = SizedBox(width: 8);
const sboxH16 = SizedBox(height: 16);
const sboxH8 = SizedBox(height: 8);

Text heaingText(String text,
    {double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    int? ml,
    double? ws,
    TextOverflow? of,
    double? ls,
    double? lh}) {
  return Text(
    text,
    maxLines: ml,
    overflow: of,
    style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: ls,
        wordSpacing: ws,
        height: lh),
  );
}

const horizontal16 = EdgeInsets.symmetric(horizontal: 16);
const horizontal12 = EdgeInsets.symmetric(horizontal: 12);
const vertical16 = EdgeInsets.symmetric(vertical: 16);
const vertical12 = EdgeInsets.symmetric(vertical: 12);
const all16 = EdgeInsets.all(16);
const left16 = EdgeInsets.only(left: 16);
const right16 = EdgeInsets.only(right: 16);

//Colors
const kMain2 = Color(0xfff292B3E);
const kMain = Color(0xff191A22);
const kLabel = Color(0xffF8F8F8);
const ksystemGrey = Color(0xffE5E5EA);
