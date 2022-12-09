import 'package:flutter/material.dart';
import '../../util/app_color.dart';

//app Text view

Widget appTextView(
    {String name = "",
    double size = 15,
    int maxLines = 1,
    Color color = AppColor.kBalck,
    bool isBold = false}) {
  return Text(
    name,
    textAlign: TextAlign.start,
    style: TextStyle(
        fontSize: size,
        fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
        color: color),
    overflow: TextOverflow.ellipsis,
    maxLines: maxLines,
  );
}
