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

import 'package:dio/dio.dart';

String baseUrl = 'https://';
BaseOptions options = BaseOptions(
  baseUrl: baseUrl,
  headers: {
    'accept': 'application/json',
    'content-type': 'application/json',
  },
);
Dio client = Dio(options);
