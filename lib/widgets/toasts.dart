import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

errorToast(txt) {
  Fluttertoast.showToast(
      msg: "$txt",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

successToast(txt) {
  Fluttertoast.showToast(
      msg: "$txt",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}
