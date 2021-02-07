/*
 *    *****   ******
 *    *   *       *
 *    *   *      *
 *    *   *     *  
 *    *****    *****
 *
 * Created on Tue Sep 01 2020   
 *
 * Copyright (c) 2020 Osman Solomon
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

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
      child: TextResponsive(
        title,
        style: TextStyle(
            color: fontColor, fontSize: fontSize, fontFamily: fontFamily),
      ),
    );
  }
}
