import 'package:flutter/material.dart';
import 'package:newapp/core/store.dart';
import 'package:newapp/screens/cart.dart';
import 'package:newapp/screens/homepage.dart';
import 'package:newapp/screens/loginpage.dart';
import 'package:newapp/utils/routes.dart';
import 'package:newapp/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(
    VxState(
      store: MyStore(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoutes.loginroute: (context) => LoginPage(),
        MyRoutes.homeroute: (context) => homepage(),
        MyRoutes.cart: (context) => Mycart(),
      },
    );
  }
}
