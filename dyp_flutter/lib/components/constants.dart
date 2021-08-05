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
    "Importantes empresas nos eligen ";
const String descripcion3OurCustomersBannerDesk =
    "La fidelidad y la confianza que nos depositan nuestros clientes día a día es la mejor carta de recomendación.";

const List<String> imagesOurCustomersBannerPage = [
  "assets/images/clientes/asse.png",
  "assets/images/clientes/anep.png",
  "assets/images/clientes/dfa.png",
  "assets/images/clientes/china.png",
  "assets/images/clientes/dac.png",
  "assets/images/clientes/idc.png",
  "assets/images/clientes/idr.png",
  "assets/images/clientes/mc.png",
  "assets/images/clientes/ministerio.png",
  "assets/images/clientes/ministerioeducacion.png",
  "assets/images/clientes/neutral.png",
  "assets/images/clientes/pasteur.png",
  "assets/images/clientes/peluffo.png",
  "assets/images/clientes/porto.png",
  "assets/images/clientes/scremini.png",
  "assets/images/clientes/subway.png",
  "assets/images/clientes/theplace.png",
];
