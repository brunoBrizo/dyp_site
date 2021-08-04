import 'package:dyp/components/Navbar.dart';
import 'package:dyp/components/title.dart';
import 'package:dyp/pages/products/grid_products.dart';
import 'package:flutter/material.dart';

import 'footer/footer.dart';

class VideoPorterosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = ScrollController();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white60,
      body: Scrollbar(
        controller: _controller,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Navbar(),
              drawTitle(size, 'VIDEO PORTEROS'),
              SizedBox(
                height: 20.0,
              ),
              GridProducts(
                productType: 'video_grabadoras',
              ),
              SizedBox(
                height: 20.0,
              ),
              Footer()
              //getServicesSection(context)
            ],
          ),
        ),
      ),
    );
  }
}
