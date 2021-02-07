import 'package:flutter/material.dart';
import 'package:kyveli/theme/appTheme.dart';
import 'package:kyveli/views/home/home.dart';
import 'package:provider/provider.dart';

import 'core/providers/HomeProvider.dart';
import 'core/providers/loginProvider.dart';
import 'core/providers/splashProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: appTheme(),
        home: Home(),
      ),
    );
  }
}
