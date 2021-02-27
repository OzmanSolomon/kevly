import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kyveli/core/providers/HomeProvider.dart';
import 'package:kyveli/core/providers/SalesProvider.dart';
import 'package:kyveli/core/providers/bagProvider.dart';
import 'package:kyveli/core/providers/drawerProvider.dart';
import 'package:kyveli/core/providers/eliteProvider.dart';
import 'package:kyveli/core/providers/filterProvider.dart';
import 'package:kyveli/core/providers/loginProvider.dart';
import 'package:kyveli/core/providers/splashProvider.dart';
import 'package:kyveli/core/providers/wishlist.dart';
import 'package:kyveli/theme/appTheme.dart';
import 'package:kyveli/views/intro/splash.dart';
import 'package:kyveli/widgets/bottomNavigator.dart';
import 'package:provider/provider.dart';
import 'core/base/consts.dart';
import 'core/providers/accountProvider.dart';
import 'core/providers/addressProvider.dart';
import 'core/providers/bookAppointmentProvider.dart';
import 'core/providers/bottomNavProvider.dart';
import 'core/providers/collectionProductsProvider.dart';
import 'core/providers/collectionProvider.dart';
import 'core/providers/forgetPasswordProvider.dart';
import 'core/providers/giftCard.dart';
import 'core/providers/ordersHistoryProvider.dart';
import 'core/providers/productDetails.dart';
import 'core/providers/searchProvider.dart';
import 'package:device_preview/device_preview.dart';

import 'core/providers/signupProvider.dart';

// void main() {
//   runApp(MyApp());
// }
void main() {
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => ProductDetialsProvider()),
        ChangeNotifierProvider(create: (_) => FilterProvider()),
        ChangeNotifierProvider(create: (_) => CollectionProductsProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (_) => DrawerProvider()),
        ChangeNotifierProvider(create: (_) => CollectionProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
        ChangeNotifierProvider(create: (_) => SalesProvider()),
        ChangeNotifierProvider(create: (_) => BagProvider()),
        ChangeNotifierProvider(create: (_) => EliteProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => GiftProvider()),
        ChangeNotifierProvider(create: (_) => BookAppointmentProvider()),
        ChangeNotifierProvider(create: (_) => AddressProvider()),
        ChangeNotifierProvider(create: (_) => AccountProvider()),
        ChangeNotifierProvider(create: (_) => OrdersHistoryProvider()),
        ChangeNotifierProvider(create: (_) => ForgetPasswordProvider()),
        ChangeNotifierProvider(create: (_) => SignupProvider()),
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: MaterialApp(
          locale: DevicePreview.locale(context), // Add the locale here
          builder: DevicePreview.appBuilder, // Add the builder here
          debugShowCheckedModeBanner: false,
          title: 'Kyveli',
          theme: appTheme(),
          home: isRelease ? Splash() : BottomNavBar(),
        ),
      ),
    );
  }
}
