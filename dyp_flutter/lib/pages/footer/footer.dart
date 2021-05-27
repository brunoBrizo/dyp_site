import 'package:dyp/components/color.dart';
import 'package:dyp/components/constants.dart';
import 'package:dyp/components/typography.dart';
import 'package:dyp/models/footer_item.dart';
import 'package:dyp/utils/screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

final List<FooterItem> footerItems = [
  FooterItem(
    icon: Icon(Icons.phone_callback_outlined),
    title: "TELÉFONO",
    text1: "462 12345",
    text2: "462 54321",
  ),
  FooterItem(
    icon: Icon(Icons.email_outlined),
    title: "EMAIL",
    text1: "hello@example.com",
    text2: "info@example.com",
  ),
  FooterItem(
    icon: Icon(Icons.phone_iphone_rounded),
    title: "WHATSAPP",
    text1: "+598 95022190",
    text2: "+55 5591467212",
  )
];

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        // width: size.width * 0.95,
        color: mainSiteColor(),
        child: ScreenHelper(
          desktop: _buildUi(kDesktopMaxWidth, context),
          tablet: _buildUi(kTabletMaxWidth, context),
          mobile: _buildUi(getMobileMaxWidth(context), context),
        ),
      ),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: _drawFooterItems(context, constraints),
              ),
              _drawLine(width),
              _drawLastLine(context)
            ],
          );
        },
      ),
    ),
  );
}

_drawLastLine(BuildContext context) {
  return Flex(
    direction: ScreenHelper.isMobile(context) ? Axis.vertical : Axis.horizontal,
    mainAxisAlignment: ScreenHelper.isMobile(context)
        ? MainAxisAlignment.center
        : MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: EdgeInsets.only(bottom: 15.0),
        child: Text(
          "Copyright (c) " +
              _getCurrentYear().toString().trim() +
              " DyP Distribuciones y Proyectos",
          style: menuAndFooterText,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                await launch('https://arkamsoftware.firebaseapp.com/');
              },
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Text(
                  "Designed by Arkam Software",
                  style: menuAndFooterText,
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );
}

_drawLine(double width) {
  return Container(
      height: 1,
      width: width,
      margin: EdgeInsets.only(bottom: 15),
      color: Colors.black26);
}

_drawFooterItems(BuildContext context, BoxConstraints constraints) {
  return Wrap(
    spacing: 20.0,
    runSpacing: 20.0,
    children: footerItems
        .map(
          (footerItem) => Container(
            height: 120.0,
            width: ScreenHelper.isMobile(context)
                ? constraints.maxWidth / 2.0 - 20.0
                : constraints.maxWidth / 4.0 - 20.0,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            iconSize: 40.0,
                            icon: footerItem.icon,
                            onPressed: () {}),
                        SizedBox(
                          width: 15.0,
                        ),
                        Expanded(
                          child: Text(
                            footerItem.title,
                            style: menuAndFooterText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          print('text 1');
                        },
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            "${footerItem.text1}\n",
                            style: menuAndFooterText,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print('text 2');
                        },
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            "${footerItem.text2}",
                            style: menuAndFooterText,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
        .toList(),
  );
}

_getCurrentYear() {
  return DateTime.now().year;
}
