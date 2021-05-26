import 'package:dyp/pages/alarmas_page.dart';
import 'package:dyp/pages/cctv_page.dart';
import 'package:dyp/pages/contacto_page.dart';
import 'package:dyp/pages/control_acceso_page.dart';
import 'package:dyp/pages/incendios_page.dart';
import 'package:dyp/pages/inicio_page.dart';
import 'package:dyp/pages/mantenimientos_page.dart';
import 'package:dyp/pages/proyectos_page.dart';
import 'package:dyp/pages/quienes_somos_page.dart';
import 'package:dyp/pages/telefonia_ip_page.dart';
import 'package:dyp/pages/video_porteros_page.dart';
import 'package:dyp/routes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget!),
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
      initialRoute: Routes.inicio,
      home: InicioPage(),
      onGenerateRoute: (RouteSettings settings) {
        return Routes.fadeThrough(settings, (context) {
          switch (settings.name) {
            case Routes.inicio:
              return InicioPage();
            case Routes.quienesSomos:
              return QuienesSomosPage();
            case Routes.contacto:
              return ContactoPage();
            case Routes.alarmas:
              return AlarmasPage();
            case Routes.cctv:
              return CctvPage();
            case Routes.controlAcceso:
              return ControlAccesoPage();
            case Routes.incendios:
              return IncendiosPage();
            case Routes.mantenimientos:
              return MantenimientosPage();
            case Routes.proyectos:
              return ProyectosPage();
            case Routes.telefoniaIp:
              return TelefoniaIpPage();
            case Routes.videoPorteros:
              return VideoPorterosPage();

            default:
              return SizedBox.shrink();
          }
        });
      },
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
    );
  }
}
