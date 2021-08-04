import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';
import 'dart:io' show Platform;

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

navigate(BuildContext context, String routeName) {
  Navigator.pushNamed(context, routeName);
}

getMainContainerWidth(Size size) {
  if (size.width > 1250) {
    return 700.0;
  } else if (size.width <= 1250 && size.width > 1100) {
    return 640.0;
  } else if (size.width <= 1100 && size.width >= 950) {
    return 500.0;
  } else {
    return size.width * 0.9;
  }
}

void openURL(String url, bool sameTab) {
  if (isWeb()) {
    launch(url, webOnlyWindowName: sameTab ? "_self" : "");
  } else if (isAndroidByPlatform()) {
    launch(url);
  }
}

bool isWeb() {
  return kIsWeb;
}

bool isAndroidByContext(BuildContext context) {
  return Theme.of(context).platform == TargetPlatform.android;
}

bool isAndroidByPlatform() {
  if (Platform.isAndroid) {
    return true;
  } else
    return false;
}

bool isMobile(BuildContext context) {
  return (Theme.of(context).platform == TargetPlatform.android ||
      Theme.of(context).platform == TargetPlatform.iOS);
}

redirect(BuildContext context, String redirectTo) async {
  await Navigator.pushNamed(context, redirectTo);
}

DateTime convertStringToDateTime(String tmst) {
  return DateTime.parse(tmst);
}
