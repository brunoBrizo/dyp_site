import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

enum TipoPantalla { Web, Desktop, Mobile }

Widget sizedBoxSeparator() {
  return SizedBox(
    height: 10.0,
    child: new Center(
      child: new Container(
        margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
        height: 0.3,
        color: Colors.black,
      ),
    ),
  );
}

TipoPantalla getTipoPantalla(Size size) {
  if (size.width > 1200) {
    return TipoPantalla.Desktop;
  } else if (size.width > 800 && size.width < 1200) {
    return TipoPantalla.Desktop;
  } else {
    return TipoPantalla.Mobile;
  }
}

sendWhatsAppMessage(String phone, String message) async {
  await launch("https://wa.me/$phone?text=$message");
}
