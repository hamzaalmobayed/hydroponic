import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydro_app/provider/provider.dart';
import 'package:hydro_app/routes/Routes.dart';
import 'package:hydro_app/ui/screens/tabScreen.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runApp(ChangeNotifierProvider<HydroProvider>(
      create: (context) => HydroProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: RouteHelper.routeHelper.navKey,
            theme: ThemeData(
              primaryColor: Color(0xff0B85D8),
              buttonTheme: ButtonThemeData(
                padding: EdgeInsets.symmetric(vertical: 20),
                buttonColor: Color(0xff0B85D8), // Background color (orange in my case).
                textTheme: ButtonTextTheme.accent,
                colorScheme:
                Theme.of(context).colorScheme.copyWith(secondary: Colors.white), // Text color
              ),
              fontFamily: "Cairo",
            ),
            home: Splash());

  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}


class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
            () => RouteHelper.routeHelper.goToPageWithReplacement(TabScreen()));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/logo2.png"),

          ],
        ),
        decoration: BoxDecoration(
          color: Color.fromRGBO(225, 0, 50, 1),
        ),
      ),
    );
  }
}
