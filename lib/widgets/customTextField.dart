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

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key key,
    @required FocusNode focusNode,
    String hint,
    String lable,
    @required TextInputType textInputType,
    Icon icon,
    dynamic validator,
    dynamic onChanged,
    @required this.controller,
  })  : _hint = hint,
        _userNameFocus = focusNode,
        _icon = icon,
        _onChanged = onChanged,
        _textInputType = textInputType,
        _validator = validator,
        _lable = lable,
        super(key: key);
  final String _hint;
  final TextInputType _textInputType;
  final String _lable;
  final Icon _icon;
  final FocusNode _userNameFocus;
  final TextEditingController controller;
  final dynamic _onChanged;
  final dynamic _validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: _onChanged,
        decoration: new InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300])),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300]),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300]),
            ),
            hintText: _hint,
            hintStyle: TextStyle(
              fontSize: 14,
              fontFamily: 'Oswald',
            ),
            labelText: _lable,
            labelStyle: TextStyle(
              fontSize: 14,
              fontFamily: 'Oswald',
            ),
            alignLabelWithHint: true,
            icon: _icon),
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'Oswald',
        ),
        validator: _validator,
        focusNode: _userNameFocus,
        textInputAction: TextInputAction.done,
        controller: controller,
        keyboardType: _textInputType,
        obscureText:
            _textInputType == TextInputType.visiblePassword ? true : false);
  }
}
