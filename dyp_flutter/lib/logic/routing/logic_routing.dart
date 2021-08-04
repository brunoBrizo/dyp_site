import 'package:dyp/logic/routing/routes.dart';
import 'package:dyp/pages/alarmas_page.dart';
import 'package:dyp/pages/cctv/cctv_page.dart';
import 'package:dyp/pages/contact/contacto_page.dart';
import 'package:dyp/pages/control_acceso_page.dart';
import 'package:dyp/pages/incendios_page.dart';
import 'package:dyp/pages/inicio/inicio_page.dart';
import 'package:dyp/pages/mantenimientos_page.dart';
import 'package:dyp/pages/proyectos_page.dart';
import 'package:dyp/pages/quienes_somos_page.dart';
import 'package:dyp/pages/telefonia_ip_page.dart';
import 'package:dyp/pages/video_porteros_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Map<String, WidgetBuilder> generateRoutes(BuildContext context) {
  Map<String, WidgetBuilder> routes = {
    InicioRoute: (context) => InicioPage(),
    QuienesSomosRoute: (context) => QuienesSomosPage(),
    ContactoRoute: (context) => ContactoPage(),
    AlarmasRoute: (context) => AlarmasPage(),
    ProyectosRoute: (context) => ProyectosPage(),
    IncendiosRoute: (context) => IncendiosPage(),
    CctvRoute: (context) => CctvPage(),
    MantenimientosRoute: (context) => MantenimientosPage(),
    VideoPorterosRoute: (context) => VideoPorterosPage(),
    ControlAccesoRoute: (context) => ControlAccesoPage(),
    TelefoniaIpRoute: (context) => TelefoniaIpPage(),
  };
  return routes;
}

class AppRouter {
  static PageRoute pageRoute(
    Widget child,
    RoutingData data,
  ) =>
      _FadeRoute(
        child,
        data.fullRoute,
        data,
      );
  static Route<dynamic> generateRoute(RouteSettings settings) {
    RoutingData data;

    data = RoutingData.home();

    return pageRoute(InicioPage(), data);
  }
}

class RoutingData {
  @override
  int get hashCode => route.hashCode;

  final List<String> route;
  final Map<String, String> _queryParameters;

  String get fullRoute => Uri(
          pathSegments: route,
          queryParameters: _queryParameters.isEmpty ? null : _queryParameters)
      .toString();

  RoutingData(
    this.route,
    Map<String, String> queryParameters,
  ) : _queryParameters = queryParameters;

  RoutingData.home([this.route = const [InicioRoute]]) : _queryParameters = {};

  String operator [](String key) => _queryParameters[key];

  @override
  bool operator ==(Object other) {
    return super == other;
  }
}

extension StringExtension on String {
  RoutingData get getRoutingData {
    final uri = Uri.parse(this);

    return RoutingData(
      uri.pathSegments,
      uri.queryParameters,
    );
  }
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  final RoutingData data;
  _FadeRoute(
    this.child,
    this.routeName,
    this.data,
  ) : super(
          settings: RouteSettings(
            name: routeName,
            arguments: data,
          ),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
