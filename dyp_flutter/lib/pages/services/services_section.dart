import 'package:dyp/components/color.dart';
import 'package:dyp/components/constants.dart';
import 'package:dyp/models/services.dart';
import 'package:dyp/utils/screen_helper.dart';
import 'package:dyp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

final List<Services> services = [
  Services(
      title: "Proyectos",
      icon: Icon(
        Icons.folder_open,
      ),
      route: '/proyectos'),
  Services(
      title: "CCTV",
      icon: Icon(
        Icons.camera_alt_outlined,
      ),
      route: '/cctv'),
  Services(
      title: "Alarmas",
      icon: Icon(
        Icons.alarm,
      ),
      route: '/alarmas'),
  Services(
      title: "Incendios",
      icon: Icon(
        Icons.fireplace_outlined,
      ),
      route: '/incendios'),
  Services(
      title: "Mantenimiento",
      icon: Icon(
        Icons.settings,
      ),
      route: '/mantenimientos'),
  Services(
      title: "Video Porteros",
      icon: Icon(
        Icons.video_call_outlined,
      ),
      route: '/video-porteros'),
  Services(
      title: "Control de Acceso",
      icon: Icon(
        Icons.vpn_key_outlined,
      ),
      route: '/control-acceso'),
  Services(
      title: "Telefonía IP",
      icon: Icon(
        Icons.phone_callback_outlined,
      ),
      route: '/telefonia-ip'),
];

class ServicesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ScreenHelper(
        desktop: _buildUi(context, kDesktopMaxWidth),
        tablet: _buildUi(context, kTabletMaxWidth),
        mobile: _buildUi(context, getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(BuildContext context, double width) {
    return ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _drawTitle(),
            ],
          ),
          SizedBox(
            height: 35.0,
          ),
          Container(
            child: LayoutBuilder(
              builder: (_context, constraints) {
                double maxCrossAxisExtent =
                    _getMaxCrossAxisExtent(context, constraints);
                return ResponsiveGridView.builder(
                  padding: EdgeInsets.all(0.0),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  alignment: Alignment.topCenter,
                  gridDelegate: ResponsiveGridDelegate(
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                    maxCrossAxisExtent: maxCrossAxisExtent,
                    // Hack to adjust child height
                    childAspectRatio: _getChildAspectRatio(
                        context, MediaQuery.of(context).size),
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _drawItem(context, services[index]),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: services.length,
                );
              },
            ),
          )
        ],
      ),
    );
  }

  _getMaxCrossAxisExtent(BuildContext context, BoxConstraints constraints) {
    double maxCrossAxisExtent = 0;
    if (ScreenHelper.isDesktop(context)) {
      maxCrossAxisExtent = 250.0;
    } else if (ScreenHelper.isTablet(context)) {
      maxCrossAxisExtent = constraints.maxWidth / 2;
    } else {
      maxCrossAxisExtent = constraints.maxWidth;
    }
    return maxCrossAxisExtent;
  }

  _getChildAspectRatio(BuildContext context, Size size) {
    double ratio = 0;
    if (ScreenHelper.isDesktop(context)) {
      ratio = 1.9;
    } else if (ScreenHelper.isTablet(context)) {
      ratio = 3.3;
    } else {
      ratio = 4;
    }
    return ratio;
  }

  _drawTitle() {
    return Text(
      "NUESTROS SERVICIOS",
      style: GoogleFonts.oswald(
        color: textPrimary,
        fontWeight: FontWeight.w900,
        height: 1.8,
        fontSize: 18.0,
      ),
    );
  }

  _drawItem(BuildContext context, Services service) {
    return Material(
      elevation: 10.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              iconSize: 60.0,
              icon: service.icon,
              onPressed: () {
                navigate(context, service.route);
              }),
          SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                navigate(context, service.route);
              },
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Text(
                  service.title,
                  style: GoogleFonts.oswald(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700,
                    color: textPrimary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
