/*
 *
 *    *****   ******
 *    *   *       *
 *    *   *      *
 *    *   *     *  
 *    *****    *****
 *
 * Wrote By Osman Suliman in 2021 
 */
import 'package:flutter/material.dart';
import 'package:kyveli/widgets/bottomNavigator.dart';

class ForgetPasswordProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final FocusNode emailFocus = FocusNode();
  var emailController = TextEditingController();
  final FocusNode passFocus = FocusNode();
  var passController = TextEditingController();
  final FocusNode confirmPassFocus = FocusNode();
  var confirmPassController = TextEditingController();
  int state = 1;
  String subTitle =
      'Enter your email address to receive a\nlink to update your password'
          .toUpperCase();
  get title {
    if (state == 1) {
      return 'Forgot\npassword?'.toUpperCase();
    } else {
      return 'Create a new \npassword'.toUpperCase();
    }
  }

  back(context) {
    if (state != 1) {
      state--;
      passController.clear();
      confirmPassController.clear();
      notifyListeners();
    } else {
      Navigator.pop(context);
    }
  }

  send(context) {
    if (state == 1) {
      state++;
      notifyListeners();
    } else {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, _, __) {
              return BottomNavBar();
            }),
      );
    }
  }
}
