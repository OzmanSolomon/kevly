/*
 *    *****   ******
 *    *   *       *
 *    *   *      *
 *    *   *     *  
 *    *****    *****
 *
 * Created on Tue Sep 01 2020   
 *
 * Wrote By 2020 Osman Solomon
 */

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final String title;
  final dynamic onPressed;
  final Color fontColor;
  final double fontSize;
  final String fontFamily;
  CustomRaisedButton(
      {@required this.title,
      @required this.onPressed(),
      @required this.fontColor,
      @required this.fontSize,
      @required this.fontFamily});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: AutoSizeText(
        title,
        style: TextStyle(
            color: fontColor, fontSize: fontSize, fontFamily: fontFamily),
      ),
    );
  }
}
