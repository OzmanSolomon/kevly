import 'package:flutter/material.dart';
import 'package:kyveli/core/services/userServices.dart';
import 'package:kyveli/widgets/loading.dart';

class LoginProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  UserServices _userRepository = new UserServices();
  final FocusNode emailFocus = FocusNode();
  var emailController = TextEditingController();
  final FocusNode passFocus = FocusNode();
  var passController = TextEditingController();
  void getData(context, email, pass, scaffoldKey, pr) async {
    try {
      var response =
          _userRepository.login(email, pass, context, scaffoldKey, pr);
      FocusScope.of(context).unfocus();
      response.then((onValue) {});
    } catch (e) {}
  }

  void navigationPage(context) {
    Navigator.of(context).push(
      PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, _, __) {
            return OverLayWidgetWithLoader(false);
          }),
    );
  }
}
