import 'package:dyp/models/product_model.dart';
import 'package:dyp/pages/grid_products/product_desc.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({Key key, this.product}) : super(key: key);
  @override
  _ProductCardState createState() => new _ProductCardState();
}

class _ProductCardState extends State<ProductCard>
    with SingleTickerProviderStateMixin {
  var deviceSize;
  AnimationController controller;
  Animation<double> animation;

  Widget productCard(Size size) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Card(
          // clipBehavior: Clip.hardEdge,
          elevation: 5.0,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15.0)),
          color: Colors.white,
          child: Ink(
            // width: cardWidth,
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  //width: double.infinity,
                  child: new Image.asset(
                    widget.product.image,
                    fit: BoxFit.fill,
                    height: 150.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 30.0,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                        bottom: _getPaddingForDescContainer(size)),
                    child: Container(
                      width: double.infinity,
                      height: _getHeightForDescContainer(size),
                      decoration: new BoxDecoration(
                        gradient: new LinearGradient(colors: kitGradients),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.white,
                      ),
                      child: new ProductDesc(product: widget.product),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static List<Color> kitGradients = [
    // new Color.fromRGBO(103, 218, 255, 1.0),
    // new Color.fromRGBO(3, 169, 244, 1.0),
    // new Color.fromRGBO(0, 122, 193, 1.0),
    Colors.blueGrey.shade800,
    Colors.black87,
  ];

  @override
  initState() {
    super.initState();
    controller = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 1500));
    animation = new Tween(begin: 0.0, end: 1.0).animate(
        new CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
    animation.addListener(() => this.setState(() {}));
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return productCard(deviceSize);
  }

  _getPaddingForDescContainer(Size size) {
    final width = size.width;
    print('width: ' + width.toString());
    if (width > 800.0) {
      return 0;
    } else {
      return 15.0;
    }
  }

  _getHeightForDescContainer(Size size) {
    final height = size.height;
    print('height: ' + height.toString());
    if (height > 1000.0) {
      return height * 0.11;
    } else if (height <= 1000.0 && height > 800.0) {
      return height * 0.13;
    } else if (height > 650.0 && height <= 800.0) {
      return height * 0.16;
    } else if (height <= 650.0 && height > 500.0) {
      return height * 0.22;
    } else if (height <= 500.0 && height > 400.0) {
      return height * 0.27;
    } else if (height <= 400.0) {
      return height * 0.32;
    }
  }
}
