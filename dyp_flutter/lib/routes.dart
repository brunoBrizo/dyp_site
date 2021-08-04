import 'package:dyp/pages/alarmas_page.dart';
import 'package:dyp/pages/cctv/cctv_page.dart';
import 'package:dyp/pages/contact/contacto_page.dart';
import 'package:dyp/pages/control_acceso_page.dart';
import 'package:dyp/pages/incendios_page.dart';
import 'package:dyp/pages/inicio/inicio_page.dart';
import 'package:dyp/pages/mantenimientos_page.dart';
import 'package:dyp/pages/products/product_view.dart';
import 'package:dyp/pages/proyectos_page.dart';
import 'package:dyp/pages/quienes_somos_page.dart';
import 'package:dyp/pages/telefonia_ip_page.dart';
import 'package:dyp/pages/video_porteros_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static Handler _inicioHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          InicioPage());

  static Handler _cctvHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          CctvPage());

  static Handler _quienesSomosHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          QuienesSomosPage());

  static Handler _contactoHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          ContactoPage());

  static Handler _alarmasHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          AlarmasPage());

  static Handler _proyectosHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          ProyectosPage());

  static Handler _incendiosSomosHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          IncendiosPage());

  static Handler _mantenimientosHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          MantenimientosPage());

  static Handler _videoPorterosHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          VideoPorterosPage());

  static Handler _controlAccesoHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          ControlAccesoPage());

  static Handler _telefoniaIpHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          TelefoniaIpPage());

  //two parameters
  static Handler _productViewHandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          ProductView(
            type: params['type'][0],
            name: params['name'][0],
          ));

  static void setupRouter() {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            InicioPage());
    router.define(
      '/',
      handler: _inicioHandler,
    );
    router.define(
      '/quienes-somos',
      handler: _quienesSomosHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/contacto',
      handler: _contactoHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/alarmas',
      handler: _alarmasHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/proyectos',
      handler: _proyectosHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/incendios',
      handler: _incendiosSomosHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/cctv',
      handler: _cctvHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/mantenimientos',
      handler: _mantenimientosHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/video-porteros',
      handler: _videoPorterosHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/control-acceso',
      handler: _controlAccesoHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/telefonia-ip',
      handler: _telefoniaIpHandler,
      transitionType: TransitionType.fadeIn,
    );

    router.define(
      '/:type/:name',
      handler: _productViewHandler,
      transitionType: TransitionType.fadeIn,
    );
  }
}
