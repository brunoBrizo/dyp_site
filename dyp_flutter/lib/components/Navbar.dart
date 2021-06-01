import 'package:dyp/components/typography.dart';
import 'package:dyp/utils/utils.dart';
import 'package:flutter/material.dart';

import '../routes.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final tipoPantalla = getTipoPantalla(size);
    if (tipoPantalla == TipoPantalla.Desktop) {
      return DesktopNavbar();
    } else {
      return MobileNavbar();
    }
  }
}

class DesktopNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _drawFlags(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, Routes.inicio),
                      child: Text(
                        "DyP Distribuciones y Proyectos",
                        style: headlineTextStyle,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, Routes.inicio),
                          child: Text(
                            "Inicio",
                            style: buttonTextStyle,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, Routes.quienesSomos),
                          child: Text(
                            "¿Quiénes Somos?",
                            style: buttonTextStyle,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, Routes.contacto),
                          child: Text(
                            "Contacto",
                            style: buttonTextStyle,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        MaterialButton(
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          onPressed: () async {
                            await _sendPresupuesto();
                          },
                          child: Text(
                            "Presupuesto",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                  height: 1,
                  margin: EdgeInsets.only(bottom: 10),
                  color: Color(0xFFEEEEEE)),
            ],
          ),
        ),
      ],
    );
  }
}

class MobileNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _drawFlags(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Column(children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, Routes.inicio),
                child: Center(
                  child: Text(
                    "Distribuciones y Proyectos",
                    style: headlineTextStyle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, Routes.inicio),
                      child: Text(
                        "Inicio",
                        style: buttonTextStyle,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, Routes.quienesSomos),
                      child: Text(
                        "¿Quiénes Somos?",
                        style: buttonTextStyle,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, Routes.contacto),
                      child: Text(
                        "Contacto",
                        style: buttonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  height: 1,
                  margin: EdgeInsets.only(bottom: 5),
                  color: Color(0xFFEEEEEE)),
            ]),
          ),
        ),
      ],
    );
  }
}

_sendPresupuesto() async {
  await sendWhatsAppMessage('+59899057586', 'Buen dia quiero presupuesto');
}

_drawFlags() {
  return Container(
    height: 50.0,
    color: Colors.grey[400],
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/images/flags/uruguay-flag.png',
              width: 30.0,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(onTap: () {}, child: Text(' +598 95022190')),
        ),
        SizedBox(
          width: 15.0,
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/images/flags/brazil-flag.png',
              width: 30.0,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(onTap: () {}, child: Text('+55 5591467212')),
        ),
      ],
    ),
  );
}
