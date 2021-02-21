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
import 'package:kyveli/views/collections/collectionProducts.dart';

class CollectionProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  List<String> items = [
    'SHIRTS | TOPS',
    'JEANS | TROUSERS',
    'ORIENTAL COLLECTION',
    'HOODIES',
    'LOUNGEWEAR',
    'OUTWEAR',
    'SPORTSWEAR',
    'BAGS',
    'ACCESSORIES'
  ];
  void navigationPage(context, title) {
    Navigator.of(context).push(
      PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, _, __) {
            return CollectionProduct(title: title);
          }),
    );
  }
}
