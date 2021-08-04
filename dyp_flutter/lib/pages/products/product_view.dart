import 'package:dyp/components/Navbar.dart';
import 'package:dyp/components/color.dart';
import 'package:dyp/components/constants.dart';
import 'package:dyp/components/typography.dart';
import 'package:dyp/models/product_model.dart';
import 'package:dyp/pages/footer/footer.dart';
import 'package:dyp/utils/screen_helper.dart';
import 'package:dyp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductView extends StatefulWidget {
  final Product product;
  final String type;
  final String name;

  ProductView({this.type, this.name, this.product});
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  Product product;

  _ProductViewState({this.product});

  @override
  Widget build(BuildContext context) {
    precacheImage(new AssetImage(product.image), context);
    return Scaffold(
      backgroundColor: Colors.white60,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Navbar(),
            _drawTitle(context),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: ScreenHelper(
                desktop: _buildUi(kDesktopMaxWidth),
                tablet: _buildUi(kTabletMaxWidth),
                mobile: _buildUi(getMobileMaxWidth(context)),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Footer()
          ],
        ),
      ),
    );
  }

  Widget _buildUi(double width) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Container(
              child: Flex(
                direction: constraints.maxWidth > 720
                    ? Axis.horizontal
                    : Axis.vertical,
                children: [
                  // Disable expanded on smaller screen to avoid Render errors by setting flex to 0
                  Expanded(
                    flex: constraints.maxWidth > 720.0 ? 1 : 0,
                    child: FadeInImage.memoryNetwork(
                        width: constraints.maxWidth > 720.0 ? null : 350.0,
                        placeholder: kTransparentImage,
                        image: product.image),
                  ),
                  Expanded(
                    flex: constraints.maxWidth > 720.0 ? 1 : 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _drawText1(),
                        SizedBox(
                          height: 15.0,
                        ),
                        _drawText2(),
                        SizedBox(
                          height: 10.0,
                        ),
                        _drawtext3(),
                        SizedBox(
                          height: 25.0,
                        ),
                        Row(
                          children: [
                            _drawButtonSaberMas(),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _drawTitle(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: size.width,
        height: 100.0,
        color: mainSiteColor(),
        child: Center(
          child: Text(
            product.tipo,
            style: headlineTextStyle,
          ),
        ),
      ),
    );
  }

  _saberMasTexto(String texto) async {
    // await launch("https://wa.me/+59899057586?text=$texto");
    await sendWhatsAppMessage('+59899057586', '');
  }

  _drawText1() {
    return Text(
      product.name,
      style: GoogleFonts.oswald(
        color: textSecondary,
        fontWeight: FontWeight.w900,
        fontSize: 16.0,
      ),
    );
  }

  _drawText2() {
    return Text(
      product.name,
      style: GoogleFonts.oswald(
        color: Colors.black,
        fontWeight: FontWeight.w900,
        height: 1.3,
        fontSize: 35.0,
      ),
    );
  }

  _drawtext3() {
    return Text(
      product.description,
      // "This is a random text about the project, I should have used the regular lorem ipsum text, but I am too lazy to search for that. This should be long enough",
      style: TextStyle(
        color: textSecondary,
        height: 1.5,
        fontSize: 15.0,
      ),
    );
  }

  _drawButtonSaberMas() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8.0),
        ),
        height: 48.0,
        padding: EdgeInsets.symmetric(
          horizontal: 28.0,
        ),
        child: TextButton(
          onPressed: () async {
            _saberMasTexto('');
          },
          child: Center(
            child: Text(
              "SABER MÁS",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
