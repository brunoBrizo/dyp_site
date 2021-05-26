import 'package:dyp/pages/footer/footer.dart';
import 'package:dyp/pages/services/services_section.dart';
import 'package:dyp/utils/screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dyp/components/Navbar.dart';
import 'package:dyp/components/sub_menu.dart';
import 'package:dyp/utils/utils.dart';

class InicioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white60,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Navbar(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
              child: SubMenu(),
            ),
            getCarousel(context),
            SizedBox(
              height: sizedBoxHeightAfterCarousel(context),
            ),
            ServicesSection(),
            Footer()
            //getServicesSection(context)
          ],
        ),
      ),
    );
  }

////////////  CAROUSEL
  Widget getCarousel(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final tipoPantalla = getTipoPantalla(size);
    if (tipoPantalla == TipoPantalla.Desktop) {
      return carouselDesktop(size);
    } else {
      return carouselMobile(size);
    }
  }

  Widget carouselDesktop(Size size) {
    return Container(
      child: CarouselSlider(
        options: getCarouselOptions(size.height * 0.6),
        items: imageSliders,
      ),
    );
  }

  Widget carouselMobile(Size size) {
    return Container(
      child: CarouselSlider(
        options: getCarouselOptions(320.0
            // size.height * 0.40,
            ),
        items: imageSliders,
      ),
    );
  }

  CarouselOptions getCarouselOptions(double height) {
    return CarouselOptions(
      height: height,
      autoPlay: true,
      aspectRatio: 2.0,
      enlargeCenterPage: true,
      autoPlayCurve: Curves.easeOutQuart,
      scrollDirection: Axis.horizontal,
    );
  }

  static List<String> _imgList = [
    'assets/images/test1.jpg',
    'assets/images/test2.jpg',
    'assets/images/test3.jpg'
  ];

  final List<Widget> imageSliders = _imgList
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                    ],
                  )),
            ),
          ))
      .toList();

  double sizedBoxHeightAfterCarousel(BuildContext context) {
    if (ScreenHelper.isDesktop(context)) {
      return 50.0;
    } else if (ScreenHelper.isTablet(context)) {
      return 45.0;
    } else {
      return 15.0;
    }
  }
}
