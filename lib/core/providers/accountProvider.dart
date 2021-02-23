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

class AccountProvider extends ChangeNotifier {
  String userImage = 'assets/images/defualtProfileImage.png';
  String userName = 'John Doe';
  final formKey = GlobalKey<FormState>();
  final FocusNode firstNameFocus = FocusNode();
  var firstNameController = TextEditingController();
  final FocusNode lastNameFocus = FocusNode();
  var lastNameController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  var emailController = TextEditingController();
  final FocusNode phoneFocus = FocusNode();
  var phoneController = TextEditingController();
  final FocusNode oldPassFocus = FocusNode();
  var oldPassController = TextEditingController();
  final FocusNode newPassFocus = FocusNode();
  var newPassController = TextEditingController();
  final FocusNode confirmPassFocus = FocusNode();
  var confirmPassController = TextEditingController();
  onSave(context) {
    Navigator.pop(context);
  }
}
