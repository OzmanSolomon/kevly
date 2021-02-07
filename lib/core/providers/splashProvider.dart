import 'package:flutter/material.dart';
import 'package:kyveli/core/services/userServices.dart';
import 'package:progress_dialog/progress_dialog.dart';

class SplashProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  ProgressDialog pr;
  UserServices _userRepository = new UserServices();

  void getData(context, email, pass, scaffoldKey, pr) async {
    try {
      var response =
          _userRepository.login(email, pass, context, scaffoldKey, pr);
      FocusScope.of(context).unfocus();
      response.then((onValue) {});
    } catch (e) {}
  }

  void navigationPage(context) async {}
}
