import 'package:flutter/material.dart';
import 'package:kyveli/core/providers/HomeProvider.dart';
import 'package:kyveli/core/providers/bagProvider.dart';
import 'package:kyveli/core/providers/drawerProvider.dart';
import 'package:kyveli/core/providers/eliteProvider.dart';
import 'package:kyveli/core/providers/loginProvider.dart';
import 'package:kyveli/core/providers/splashProvider.dart';
import 'package:kyveli/core/providers/wishlist.dart';
import 'package:kyveli/core/providers/SalesProvider.dart';
import 'package:kyveli/theme/appTheme.dart';
import 'package:kyveli/widgets/bottomNavigator.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => DrawerProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
        ChangeNotifierProvider(create: (_) => SalesProvider()),
        ChangeNotifierProvider(create: (_) => BagProvider()),
        ChangeNotifierProvider(create: (_) => EliteProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: appTheme(),
        home: BottomNavBar(),
      ),
    );
  }
}
