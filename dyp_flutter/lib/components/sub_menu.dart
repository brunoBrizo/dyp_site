import 'package:dyp/components/typography.dart';
import 'package:dyp/logic/routing/routes.dart';
import 'package:dyp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'color.dart';

class SubMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final tipoPantalla = getTipoPantalla(size);
    if (tipoPantalla == TipoPantalla.Desktop) {
      return SubMenuDesktop();
    } else {
      return SubMenuMobile();
    }
  }
}

class SubMenuDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainSiteColor(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            firstLine(context),
            lineSeparator(800),
            secondLine(context)
          ],
        ),
      ),
    );
  }

  Widget firstLine(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              TextButton.icon(
                  onPressed: () => redirect(context, ProyectosRoute),
                  icon: Icon(
                    Icons.folder_open,
                    color: subMenuIcon,
                  ),
                  label: Text(
                    "PROYECTOS",
                    style: buttonSubMenuTextStyle,
                  )),
              SizedBox(
                width: 40,
              ),
              TextButton.icon(
                  onPressed: () => redirect(context, CctvRoute),
                  icon: Icon(
                    Icons.camera_alt_outlined,
                    color: subMenuIcon,
                  ),
                  label: Text(
                    "CCTV",
                    style: buttonSubMenuTextStyle,
                  )),
              SizedBox(
                width: 40,
              ),
              TextButton.icon(
                  onPressed: () => redirect(context, AlarmasRoute),
                  icon: Icon(
                    Icons.alarm,
                    color: subMenuIcon,
                  ),
                  label: Text(
                    "ALARMAS",
                    style: buttonSubMenuTextStyle,
                  )),
              SizedBox(
                width: 40,
              ),
              TextButton.icon(
                  onPressed: () => redirect(context, IncendiosRoute),
                  icon: Icon(
                    Icons.fireplace_outlined,
                    color: subMenuIcon,
                  ),
                  label: Text(
                    "INCENDIOS",
                    style: buttonSubMenuTextStyle,
                  )),
              SizedBox(
                width: 40,
              ),
              TextButton.icon(
                  onPressed: () => redirect(context, MantenimientosRoute),
                  icon: Icon(
                    Icons.settings,
                    color: subMenuIcon,
                  ),
                  label: Text(
                    "MANTENIMIENTOS",
                    style: buttonSubMenuTextStyle,
                  ))
            ],
          ),
        ],
      ),
    );
  }

  Widget secondLine(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                TextButton.icon(
                    onPressed: () => redirect(context, VideoPorterosRoute),
                    icon: Icon(
                      Icons.video_call_outlined,
                      color: subMenuIcon,
                    ),
                    label: Text(
                      "VIDEO PORTEROS",
                      style: buttonSubMenuTextStyle,
                    )),
                SizedBox(
                  width: 40,
                ),
                TextButton.icon(
                    onPressed: () => redirect(context, ControlAccesoRoute),
                    icon: Icon(
                      Icons.vpn_key_outlined,
                      color: subMenuIcon,
                    ),
                    label: Text(
                      "CONTROL DE ACCESO",
                      style: buttonSubMenuTextStyle,
                    )),
                SizedBox(
                  width: 40,
                ),
                TextButton.icon(
                    onPressed: () => redirect(context, TelefoniaIpRoute),
                    icon: Icon(
                      Icons.phone_callback_outlined,
                      color: subMenuIcon,
                    ),
                    label: Text(
                      "TELEFONÍA IP",
                      style: buttonSubMenuTextStyle,
                    )),
              ],
            )
          ],
        ));
  }
}

class SubMenuMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      color: mainSiteColor(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            firstLine(context),
            lineSeparator(size.width * 0.75),
            secondLine(context),
            lineSeparator(size.width * 0.75),
            thirdLine(context),
            lineSeparator(size.width * 0.75),
            fourthLine(context)
          ],
        ),
      ),
    );
  }

  Widget firstLine(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              TextButton.icon(
                  onPressed: () => redirect(context, ProyectosRoute),
                  icon: Icon(
                    Icons.folder_open,
                    color: subMenuIcon,
                  ),
                  label: Text(
                    "Proyectos",
                    style: buttonSubMenuTextStyle,
                  )),
              SizedBox(
                width: 20,
              ),
              TextButton.icon(
                  onPressed: () => redirect(context, CctvRoute),
                  icon: Icon(
                    Icons.camera_alt_outlined,
                    color: subMenuIcon,
                  ),
                  label: Text(
                    "CCTV",
                    style: buttonSubMenuTextStyle,
                  )),
              SizedBox(
                width: 20,
              ),
              TextButton.icon(
                  onPressed: () => redirect(context, AlarmasRoute),
                  icon: Icon(
                    Icons.alarm,
                    color: subMenuIcon,
                  ),
                  label: Text(
                    "Alarmas",
                    style: buttonSubMenuTextStyle,
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget secondLine(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              TextButton.icon(
                  onPressed: () => redirect(context, IncendiosRoute),
                  icon: Icon(
                    Icons.fireplace_outlined,
                    color: subMenuIcon,
                  ),
                  label: Text(
                    "INCENDIOS",
                    style: buttonSubMenuTextStyle,
                  )),
              SizedBox(
                width: 40,
              ),
              TextButton.icon(
                  onPressed: () => redirect(context, MantenimientosRoute),
                  icon: Icon(
                    Icons.settings,
                    color: subMenuIcon,
                  ),
                  label: Text(
                    "MANTENIMIENTO",
                    style: buttonSubMenuTextStyle,
                  ))
            ],
          ),
        ],
      ),
    );
  }

  Widget thirdLine(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                TextButton.icon(
                    onPressed: () => redirect(context, VideoPorterosRoute),
                    icon: Icon(
                      Icons.video_call_outlined,
                      color: subMenuIcon,
                    ),
                    label: Text(
                      "Video Porteros",
                      style: buttonSubMenuTextStyle,
                    )),
                SizedBox(
                  width: 40,
                ),
                TextButton.icon(
                    onPressed: () => redirect(context, TelefoniaIpRoute),
                    icon: Icon(
                      Icons.vpn_key_outlined,
                      color: subMenuIcon,
                    ),
                    label: Text(
                      "Telefonía IP",
                      style: buttonSubMenuTextStyle,
                    )),
              ],
            )
          ],
        ));
  }

  Widget fourthLine(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                TextButton.icon(
                    onPressed: () => redirect(context, ControlAccesoRoute),
                    icon: Icon(
                      Icons.vpn_key_outlined,
                      color: subMenuIcon,
                    ),
                    label: Text(
                      "Control de Acceso",
                      style: buttonSubMenuTextStyle,
                    )),
              ],
            )
          ],
        ));
  }
}

Widget lineSeparator(double width) {
  return Container(
      height: 1,
      width: width,
      margin: EdgeInsets.only(bottom: 10, top: 10),
      color: Colors.white);
}
