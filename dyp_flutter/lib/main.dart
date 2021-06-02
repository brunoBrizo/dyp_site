import 'package:dyp/pages/cctv/cctv_page.dart';
import 'package:dyp/pages/inicio_page.dart';
import 'package:dyp/routes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  Flurorouter.setupRouter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget),
          maxWidth: 2460,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(color: Color(0xFFF5F5F5))),
      initialRoute: '/',
      home: InicioPage(),
      onGenerateRoute: Flurorouter.router.generator,
      // onUnknownRoute: (settings) =>
      //     MaterialPageRoute(builder: (context) => CctvPage()),
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.lightBlue,
          accentColor: Colors.amber,
          textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)),
      debugShowCheckedModeBanner: false,
    );
  }
}
