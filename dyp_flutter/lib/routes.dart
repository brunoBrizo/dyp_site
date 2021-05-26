import 'package:animations/animations.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String inicio = "/";
  static const String quienesSomos = "/quienes-somos";
  static const String contacto = "/contacto";
  static const String alarmas = "/alarmas";
  static const String proyectos = "/proyectos";
  static const String incendios = "/incendios";
  static const String cctv = "/cctv";
  static const String mantenimientos = "/mantenimientos";
  static const String videoPorteros = "/video-porteros";
  static const String controlAcceso = "/control-acceso";
  static const String telefoniaIp = "/telefonia-ip";

  static Route<T> fadeThrough<T>(RouteSettings settings, WidgetBuilder page,
      {int duration = 150}) {
    return PageRouteBuilder<T>(
      settings: settings,
      transitionDuration: Duration(milliseconds: duration),
      pageBuilder: (context, animation, secondaryAnimation) => page(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeScaleTransition(animation: animation, child: child);
      },
    );
  }
}
