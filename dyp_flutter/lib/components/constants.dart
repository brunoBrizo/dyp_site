import 'package:flutter/material.dart';

const double kDesktopMaxWidth = 1000.0;
const double kTabletMaxWidth = 760.0;
double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * .8;

const Color kDangerColor = Color.fromRGBO(249, 77, 30, 1);
const Color kCaptionColor = Color.fromRGBO(166, 177, 187, 1);

const kDefaultPadding = 20.0;

const String gridButtonText = 'Ver más';

//nuestros clientes
const String descripcion1OurCustomersBannerDesk = "NUESTROS CLIENTES";
const String descripcion2OurCustomersBannerDesk =
    "Importantes empresas eligen nuestras soluciones";
const String descripcion3OurCustomersBannerDesk =
    "La fidelidad y la confianza que nos depositan nuestros clientes día a día es la mejor carta de recomendación.";

const List<String> imagesOurCustomersBannerPage = [
  "assets/images/site/hush-puppies.png",
  "assets/images/site/divino.png",
  "assets/images/site/dfa.png",
  "assets/images/site/cliente-colonia-express.png",
  "assets/images/site/buquebus.png",
  "assets/images/site/you.png",
  "assets/images/site/stadium.png",
  "assets/images/site/mimo.png",
];
