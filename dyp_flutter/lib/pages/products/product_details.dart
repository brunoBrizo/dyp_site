import 'dart:convert';
import 'package:dyp/components/Navbar.dart';
import 'package:dyp/components/sub_menu.dart';
import 'package:dyp/components/typography.dart';
import 'package:dyp/models/product_model.dart';
import 'package:dyp/pages/footer/footer.dart';
import 'package:dyp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({Key key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  Product product;
  Product productSuggestOne;
  Product productSuggestTwo;
  var jsonProducts;
  List<dynamic> productsString;
  List<Product> productLst;
  List<Product> productLstFiltered;

  _loadJson() async {
    String data =
        await rootBundle.loadString('assets/products/jsonproduct.json');
    setState(() {
      jsonProducts = json.decode(data);
      productsString = jsonProducts['products'];
      productLst = productsString.map((val) => Product.fromJson(val)).toList();
    });

    await _filterRandomProducts();
  }

  _filterRandomProducts() async {
    productLst.shuffle();
    if (product.tipo != 'undefined') {
      productLstFiltered = productLst
          .where((p) => p.tipo == product.tipo)
          .where((p) => p.name != product.name)
          .take(2)
          .toList();
    } else if (product.brand != 'todas') {
      productLstFiltered = productLst
          .where((p) => p.brand == product.brand)
          .where((p) => p.name != product.name)
          .take(2)
          .toList();
    } else if (product.tipo != 'undefined') {
      productLstFiltered = productLst
          .where((p) => p.tipo == product.tipo)
          .where((p) => p.name != product.name)
          .take(2)
          .toList();
    } else {
      productLstFiltered = productLst.take(2).toList();
    }

    if (productLstFiltered.length > 2) {
      productLstFiltered = productLstFiltered.take(2).toList();
    } else if (productLstFiltered.length < 2) {
      productLstFiltered = productLst.take(2).toList();
    }

    productSuggestOne = productLstFiltered[0];
    productSuggestTwo = productLstFiltered[1];
  }

  @override
  void initState() {
    _loadJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as Map;
    product = arguments['product'];
    final size = MediaQuery.of(context).size;

    //final _controller = ScrollController();
    return Scaffold(
      backgroundColor: Colors.white60,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.white54, Colors.white70]),
          ),
          child: Column(
            children: <Widget>[
              Navbar(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: SubMenu(),
              ),
              _getBodyBySize(context, size),
              SizedBox(
                height: 20.0,
              ),
              Footer()
            ],
          ),
        ),
      ),
    );
  }

  _getBodyBySize(BuildContext context, Size size) {
    if (productLstFiltered == null) {
      return CircularProgressIndicator();
    } else {
      return ScreenTypeLayout(
        desktop: _drawDesktop(context, size),
        tablet: _drawTabMobile(context, size),
        mobile: _drawTabMobile(context, size),
      );
    }
  }

  _drawDesktop(BuildContext context, Size size) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 50.0),
      child: Container(
        color: Colors.white,
        child: IntrinsicHeight(
          child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 25.0),
                  child: _drawBodyDesktop(context, size),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    drawDesktopRightMenuProductDetailsPage(
                        context, size, productSuggestOne, productSuggestTwo),
                  ]),
                ),
              ]),
        ),
      ),
    );
  }

  _drawBodyDesktop(BuildContext context, Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _drawGoBackText(context, size),
        Container(
          padding: EdgeInsets.only(top: 5.0, bottom: 25.0),
          width: getMainContainerWidth(size),
          child: Text(
            product.name,
            style: textStyleProductDetailsTitle,
          ),
        ),
        IntrinsicHeight(
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20.0, right: 10.0),
                child: Container(
                  child: Image.asset(
                    product.image,
                    width: getMainContainerWidth(size) * 0.49,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              _drawProductRightColumnDesk(size)
            ],
          ),
        ),
      ],
    );
  }

  _drawProductRightColumnDesk(Size size) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 5.0, bottom: 25.0),
          width: getMainContainerWidth(size) * 0.49,
          child: Text(
            product.description,
            style: textStyleJobsMainText,
          ),
        ),
        _drawConsultarButton(getMainContainerWidth(size) * 0.49)
      ],
    );
  }

  _drawTabMobile(BuildContext context, Size size) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 40.0),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: _drawBodyTabMobile(context, size),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    drawDesktopRightMenuProductDetailsPage(
                        context, size, productSuggestOne, productSuggestTwo),
                  ]),
            ),
          ]),
    );
  }

  _drawBodyTabMobile(BuildContext context, Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _drawGoBackText(context, size),
        Container(
          padding: EdgeInsets.only(top: 5.0, bottom: 25.0),
          width: getMainContainerWidth(size),
          child: Text(
            product.name,
            style: textStyleProductDetailsTitle,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20.0, right: 10.0),
          child: Container(
            child: Image.asset(
              product.image,
              width: getMainContainerWidth(size) * 0.5,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 5.0, bottom: 25.0),
          width: getMainContainerWidth(size),
          child: Text(
            product.description,
            style: textStyleJobsMainText,
          ),
        ),
        _drawConsultarButton(getMainContainerWidth(size))
      ],
    );
  }

  _drawGoBackText(BuildContext context, Size size) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
      width: getMainContainerWidth(size),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            'Volver',
            style: textStyleVolverText,
          ),
        ),
      ),
    );
  }

  _drawConsultarButton(double width) {
    String body = 'Me interesa conocer más detalles sobre el producto ' +
        product.name +
        ', disponible en el catálogo de productos de DyP.%0D%0A%0D%0AMis datos de contacto son:%0D%0A%0D%0ANombre:%0D%0ATel.:%0D%0AEmpresa:%0D%0A%0D%0AInformación adicional:%0D%0A%0D%0A%0D%0AConsulta enviada desde Web NAD.UY';

    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(height: 50.0, width: width),
      child: ElevatedButton(
        child: Text('CONSULTAR', style: textStyleButtonSendCv),
        onPressed: () async {
          //String mailVentas = await paramGetDefaultMailVentas();
          openURL(
              'mailto:' +
                  'bbrizolara7@gmail.com' +
                  '?subject=Consulta: ' +
                  product.name +
                  '&body=' +
                  body,
              false);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.red),
        ),
      ),
    );
  }

  drawDesktopRightMenuProductDetailsPage(
      BuildContext context, Size size, Product productOne, Product productTwo) {
    double containerWidth;
    double menuSize;
    if (size.width > 1200.0) {
      containerWidth = size.width * 0.21;
      menuSize = containerWidth * 0.5;
    } else if (size.width <= 1200.0 && size.width > 1050.0) {
      containerWidth = size.width * 0.22;
      menuSize = containerWidth * 0.47;
    } else if (size.width <= 1050.0 && size.width >= 950.0) {
      containerWidth = size.width * 0.23;
      menuSize = containerWidth * 0.42;
    } else if (size.width < 950.0 && size.width >= 750.0) {
      containerWidth = size.width * 0.9;
      menuSize = size.width * 0.37;
    } else {
      containerWidth = size.width * 0.9;
      menuSize = size.width * 0.4;
    }

    return Container(
      width: containerWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'OTROS PRODUCTOS',
              textAlign: TextAlign.start,
              style: textStyleJobsDetailMainText,
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 0.1,
          ),
          SizedBox(
            height: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () async {},
                  child: Container(
                    child: Image.asset(
                      productOne.image,
                      width: menuSize,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () async {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      productOne.name,
                      textAlign: TextAlign.start,
                      style: textStyleNewsTextBold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 45.0,
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () async {},
                  child: Container(
                    child: Image.asset(
                      productTwo.image,
                      width: menuSize,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () async {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      productTwo.name,
                      textAlign: TextAlign.start,
                      style: textStyleNewsTextBold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
