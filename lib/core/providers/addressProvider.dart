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

class AddressProvider extends ChangeNotifier {
  List addresses = ['MY OFFICE', 'HOME SWEET HOME', 'Thea’s house'];
  deleteAddress(index) {
    addresses.removeAt(index);
  }
}
