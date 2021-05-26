import 'package:dyp/pages/services/services_design_page.dart';
import 'package:flutter/material.dart';

class ProyectosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String image = 'assets/images/alarma_dahua.jpg';
    final String title = 'PROYECTOS';
    final String text1 = 'RESPUESTA 24HS';
    final String text2 = 'Panel de Control Avanzado';
    final String text3 =
        'This is a random text about the project, I should have used the regular lorem ipsum text, but I am too lazy to search for that. This should be long enough';
    final String saberMasTexto = 'Me gustaría consultar sobre alarmas';

    return ServicesDesignPage(
      image: image,
      title: title,
      text1: text1,
      text2: text2,
      text3: text3,
      saberMasTexto: saberMasTexto,
    );
  }
}
