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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            descripcion1OurCustomersBannerDesk,
            style: textStylePrimaryBannerDesk,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            descripcion2OurCustomersBannerDesk,
            style: textStyleSecondaryBannerDesk,
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
            height: size.height / 7,
            width: size.width / 6.5,
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
              viewportFraction: 0.7,
              scale: 0.5,
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
}

class OurCustomersBannerTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: size.width / 1.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: size.height / 30,
            ),
            Text(
              descripcion1OurCustomersBannerDesk,
              style: textStylePrimaryBannerDesk,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height / 30,
            ),
            Text(
              descripcion2OurCustomersBannerDesk,
              style: textStyleSecondaryBannerDesk,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height / 30,
            ),
            Text(
              descripcion3OurCustomersBannerDesk,
              style: textStyleThirdBannerDesk,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height / 30,
            ),
            SizedBox(
              height: size.height / 9,
              width: size.width / 6,
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
                viewportFraction: 0.7,
                scale: 0.4,
                itemCount: imagesOurCustomersBannerPage.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OurCustomersBannerMob extends StatelessWidget {
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: size.width / 1.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: size.height / 30,
            ),
            Text(
              descripcion1OurCustomersBannerDesk,
              style: description1BannersStyleMob,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height / 30,
            ),
            Text(
              descripcion2OurCustomersBannerDesk,
              style: description2BannersStyleMob,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height / 30,
            ),
            Text(
              descripcion3OurCustomersBannerDesk,
              style: description3BannersStyleMob,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height / 20,
            ),
            SizedBox(
              height: size.height / 8.5,
              width: size.width / 2,
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
                viewportFraction: 0.7,
                scale: 0.4,
                itemCount: imagesOurCustomersBannerPage.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
