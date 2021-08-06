import 'package:dyp/components/color.dart';
import 'package:dyp/components/constants.dart';
import 'package:dyp/components/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:responsive_builder/responsive_builder.dart';

class OurCustomersBanner extends StatelessWidget {
  const OurCustomersBanner({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OurCustomersBannerMob(),
      desktop: OurCustomersBannerDesk(),
      tablet: OurCustomersBannerTab(),
    );
  }
}

class OurCustomersBannerDesk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(vertical: 50.0),
      color: mainSiteColor(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            descripcion1OurCustomersBannerDesk,
            style: textStyleSecondaryBannerDesk,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            descripcion2OurCustomersBannerDesk,
            style: textStylePrimaryBannerDesk,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            descripcion3OurCustomersBannerDesk,
            style: textStyleThirdBannerDesk,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: size.height / 6,
            width: size.width / 1.5,
            child: Swiper(
              customLayoutOption:
                  CustomLayoutOption(startIndex: -1, stateCount: 3)
                      .addRotate([-45.0 / 180, 0.0, 45.0 / 180]).addTranslate([
                Offset(-370.0, -40.0),
                Offset(0.0, 0.0),
                Offset(370.0, -40.0)
              ]),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    child: ColorFiltered(
                        child: Image.asset(
                          imagesOurCustomersBannerPage[index],
                          fit: BoxFit.fill,
                        ),
                        colorFilter: ColorFilter.mode(
                            Color.fromRGBO(0, 0, 0, 0), BlendMode.color)));
              },
              indicatorLayout: PageIndicatorLayout.SCALE,
              autoplayDisableOnInteraction: false,
              autoplayDelay: 1000,
              autoplay: true,
              duration: 1000,
              control: new SwiperControl(color: Colors.transparent),
              viewportFraction: _getViewPortFraction(size.width),
              scale: 0.8,
              itemCount: imagesOurCustomersBannerPage.length,
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  _getViewPortFraction(double width) {
    if (width >= 1400.0) {
      return 0.25;
    } else if (width >= 1200.0 && width < 1400.0) {
      return 0.3;
    } else {
      return 0.35;
    }
  }
}

class OurCustomersBannerTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: size.width,
        padding: EdgeInsets.only(top: 20.0, bottom: 50.0),
        color: mainSiteColor(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: size.height / 30,
            ),
            Text(
              descripcion1OurCustomersBannerDesk,
              style: textStyleSecondaryBannerDesk,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height / 30,
            ),
            Text(
              descripcion2OurCustomersBannerDesk,
              style: textStylePrimaryBannerDesk,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height / 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                descripcion3OurCustomersBannerDesk,
                style: textStyleThirdBannerDesk,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: size.height / 30,
            ),
            SizedBox(
              height: size.height / 5,
              width: size.width,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      child: ColorFiltered(
                          child: Image.asset(
                            imagesOurCustomersBannerPage[index],
                            fit: BoxFit.fill,
                          ),
                          colorFilter: ColorFilter.mode(
                              Color.fromRGBO(0, 0, 0, 0), BlendMode.color)));
                },
                indicatorLayout: PageIndicatorLayout.SCALE,
                autoplayDisableOnInteraction: false,
                autoplayDelay: 1000,
                autoplay: true,
                duration: 1000,
                control: new SwiperControl(color: Colors.transparent),
                viewportFraction: _getViewPortFraction(size.width),
                scale: 0.4,
                itemCount: imagesOurCustomersBannerPage.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  _getViewPortFraction(double width) {
    if (width >= 900.0) {
      return 0.25;
    } else if (width >= 800.0 && width < 900.0) {
      return 0.3;
    } else if (width >= 700.0 && width < 800.0) {
      return 0.35;
    } else {
      return 0.4;
    }
  }
}

class OurCustomersBannerMob extends StatelessWidget {
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: size.width,
        padding: EdgeInsets.only(top: 20.0, bottom: 50.0),
        color: mainSiteColor(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: size.height / 30,
            ),
            Text(
              descripcion1OurCustomersBannerDesk,
              style: description2BannersStyleMob,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height / 30,
            ),
            Text(
              descripcion2OurCustomersBannerDesk,
              style: description1BannersStyleMob,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height / 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                descripcion3OurCustomersBannerDesk,
                style: description3BannersStyleMob,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: size.height / 20,
            ),
            SizedBox(
              height: size.height / 6,
              width: size.width,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      child: ColorFiltered(
                          child: Image.asset(
                            imagesOurCustomersBannerPage[index],
                            fit: BoxFit.fill,
                          ),
                          colorFilter: ColorFilter.mode(
                              Color.fromRGBO(0, 0, 0, 0), BlendMode.color)));
                },
                indicatorLayout: PageIndicatorLayout.SCALE,
                autoplayDisableOnInteraction: false,
                autoplayDelay: 1000,
                autoplay: true,
                duration: 1000,
                control: new SwiperControl(color: Colors.transparent),
                viewportFraction: _getViewPortFraction(size.width),
                scale: 0.4,
                itemCount: imagesOurCustomersBannerPage.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  _getViewPortFraction(double width) {
    if (width >= 500.0) {
      return 0.37;
    } else if (width >= 400.0 && width < 500.0) {
      return 0.47;
    } else if (width >= 300.0 && width < 400.0) {
      return 0.53;
    } else {
      return 0.6;
    }
  }
}
