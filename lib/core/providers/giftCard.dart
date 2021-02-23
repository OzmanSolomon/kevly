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

class GiftProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final FocusNode amountFocus = FocusNode();
  var amountController = TextEditingController();
  final FocusNode nameFocus = FocusNode();
  var nameController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  var emailController = TextEditingController();
  final FocusNode dayFocus = FocusNode();
  var dayController = TextEditingController();
  final FocusNode monthFocus = FocusNode();
  var monthController = TextEditingController();
  final FocusNode yearFocus = FocusNode();
  var yearController = TextEditingController();
  final FocusNode wordsFocus = FocusNode();
  var wordsController = TextEditingController();
}
