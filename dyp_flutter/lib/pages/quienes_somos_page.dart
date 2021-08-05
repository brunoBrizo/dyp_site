import 'package:dyp/components/Navbar.dart';
import 'package:dyp/components/sub_menu.dart';
import 'package:dyp/components/typography.dart';
import 'package:dyp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'footer/footer.dart';

class QuienesSomosPage extends StatelessWidget {
  final String text1 = 'QUIENES SOMOS';
  final String text2 =
      'Somos una empresa nacional que se desarrolla en el área de la SEGURIDAD ELECTRONICA, trabajamos en la integración de diferentes sistemas y tecnologías que permiten generar soluciones sustentables e innovadoras.\n\nBrindamos a nuestros Clientes, tanto Públicos como Privados, la excelencia en el Servicio, colaborando desde el proyecto inicial, su desarrollo, ejecución y servicio Post Venta.';
  final String text3 = 'QUE PROVEEMOS';
  final String text4_1 = 'SISTEMAS DE DETECCION DE INTRUSOS​';
  final String text4_2 = '​CIRCUITO CERRADO DE T.V. (CCTV)';
  final String text4_3 =
      'Residencial – Empresarial – Corporativo - Seguridad Ciudadana​';
  final String text4_4 = 'TRANSMISION Y GRABACION DE VIDEO VIGILANCIA​';
  final String text4_5 =
      'VIDEO ANALYTICS (Cámaras con Seguimiento de Personas u Objetos)​';
  final String text4_6 = '​ESTACIONES DE MONITOREO Y SOFTWARE';
  final String text4_7 = '​CONTROLES DE ACCESOS, BIOMETRICOS O CON TARJETAS';
  final String text4_8 = 'SISTEMAS DE DETECCION DE INCENDIOS​';
  final String text4_9 = 'DETECCION Y SEGURIDAD PERIMETRAL​';
  final String text4_10 = 'SISTEMAS ANTIHURTO​';
  final String text5 = 'COMO TRABAJAMOS';
  final String text6 =
      'Para el desarrollo de nuestra labor, contamos con personal altamente calificado y un departamento de proyectos que cuenta con la aprobación de los más altos estándares de calidad, garantizando efectividad, rapidez, compromiso y atención personalizada en cada uno de nuestros servicios.';
  final String text7 =
      'Nuestro equipo está integrado por personal capacitado, que se encarga de brindar el soporte adecuado a los proyectos en sus diferentes etapas de relevamiento, realización, ejecución y puesta en marcha, así como del servicio post venta. ';
  final String text8 =
      'Todo este respaldo se logra manteniendo constantemente un alto nivel de compromiso en la capacitación y actualización de todo nuestro personal, basados en la excelente relación técnico comercial que mantenemos con nuestros proveedores del exterior.';
  final String image = 'assets/images/logo.png';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white60,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.white54, Colors.white70]),
          ),
          child: Column(
            children: <Widget>[
              Navbar(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: SubMenu(),
              ),
              _drawBodyDesktop(size),
              SizedBox(
                height: 20.0,
              ),
              Footer()
            ],
          ),
        ),
      ),
    );
  }

  _drawBodyDesktop(Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
          child: Container(
            child: Image.asset(
              image,
              //width: getAboutMainContainerWidth(size),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          width: getMainContainerWidth(size),
          child: Text(
            text1,
            style: quienesSomosSubtitulo,
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10.0, bottom: 30.0),
          width: getMainContainerWidth(size),
          child: Text(
            text2,
            style: quienesSomosTexto,
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          width: getMainContainerWidth(size),
          child: Text(
            text3,
            style: quienesSomosSubtitulo,
          ),
        ),
        _drawTextContainer(text4_1, size),
        _drawTextContainer(text4_2, size),
        _drawTextContainer(text4_3, size),
        _drawTextContainer(text4_4, size),
        _drawTextContainer(text4_5, size),
        _drawTextContainer(text4_6, size),
        _drawTextContainer(text4_7, size),
        _drawTextContainer(text4_8, size),
        _drawTextContainer(text4_9, size),
        _drawTextContainer(text4_10, size),
        Container(
          padding: EdgeInsets.only(top: 40.0, bottom: 10.0),
          width: getMainContainerWidth(size),
          child: Text(
            text5,
            style: quienesSomosSubtitulo,
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          width: getMainContainerWidth(size),
          child: Text(
            text6,
            style: quienesSomosTexto,
          ),
        ),
        SizedBox(
          height: 50.0,
        )
      ],
    );
  }

  _drawTextContainer(String text, Size size) {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      width: getMainContainerWidth(size),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.arrow_right,
            size: 20.0,
            color: Colors.red,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                text,
                style: quienesSomosTexto,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
