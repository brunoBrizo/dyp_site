import 'package:dyp/components/typography.dart';
import 'package:flutter/material.dart';

import 'color.dart';

drawTitle(Size size, String title) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 0),
    child: Container(
      width: size.width,
      height: 100.0,
      color: mainSiteColor(),
      child: Center(
        child: Text(
          title,
          style: pagesTitleStyle,
        ),
      ),
    ),
  );
}
