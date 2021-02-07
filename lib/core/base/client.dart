import 'package:dio/dio.dart';

String baseUrl = 'https://api2.shghf.com/api/v1/';
BaseOptions options = BaseOptions(
  baseUrl: baseUrl,
  headers: {
    'accept': 'application/json',
    'content-type': 'application/json',
  },
);
Dio client = Dio(options);
