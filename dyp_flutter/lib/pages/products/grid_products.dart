import 'dart:convert';
import 'package:dyp/models/product_model.dart';
import 'package:dyp/pages/products/product_card.dart';
import 'package:dyp/utils/screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class GridProducts extends StatefulWidget {
  final String productType;

  GridProducts({this.productType});

  @override
  _GridProductsState createState() =>
      _GridProductsState(productType: productType);
}

class _GridProductsState extends State<GridProducts> {
  String productType;
  _GridProductsState({this.productType});
  final ScrollController _scrollController = ScrollController();
  var jsonProducts;
  List<dynamic> products;
  List<Product> list;

  _loadJson() async {
    String data = await rootBundle.loadString('assets/json/jsonproductos.json');
    setState(() {
      jsonProducts = json.decode(data);
      products = jsonProducts[this.productType];
      list = products.map((val) => Product.fromJson(val)).toList();
    });
  }

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   await _loadJson();
    // });
    _loadJson();
    super.initState();
  }

  _getHeightForGridViewDesk(Size size) {
    final height = size.height;
    //print('height: ' + height.toString());
    if (height > 1000.0) {
      return height * 0.95;
    } else if (height <= 1000.0 && height > 800.0) {
      return height;
    } else if (height <= 800.0) {
      return height * 1.23;
    }
  }

  _getHeightForGridViewTab(Size size) {
    final height = size.height;
    //print('height: ' + height.toString());
    if (height >= 1200.0) {
      return height * 0.5;
    } else if (height > 1000.0 && height < 1200.0) {
      return height * 0.6;
    } else if (height <= 1000.0 && height > 800.0) {
      return height * 0.7;
    } else if (height <= 800.0 && height > 650.0) {
      return height * 0.87;
    } else if (height <= 650.0 && height > 500.0) {
      return height * 1.21;
    } else if (height <= 500.0 && height > 400.0) {
      return height * 1.3;
    } else if (height <= 400.0) {
      return height * 1.7;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ScreenHelper(
        desktop: _drawDesktop(size),
        tablet: _drawTablet(size),
        mobile: _drawMobile(size));
  }

  _drawDesktop(Size size) {
    // print('products2: ' + products.toString());
    double _crossAxisSpacing = 10.0, _mainAxisSpacing = 10.0;
    int _crossAxisCount = 3;

    double itemHeight = _getHeightForGridViewDesk(size);
    double itemWidth = size.width;

    return Container(
      constraints: BoxConstraints(maxHeight: double.infinity),
      width: size.width * 0.7,
      child: GridView.count(
          controller: _scrollController,
          childAspectRatio: (itemWidth / itemHeight / 1.7),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          mainAxisSpacing: _mainAxisSpacing,
          crossAxisSpacing: _crossAxisSpacing,
          crossAxisCount: _crossAxisCount,
          children: new List<Widget>.generate(list == null ? 0 : list.length,
              (index) {
            if (list == null) {
              return CircularProgressIndicator();
            } else {
              return new GridTile(
                child: ProductCard(
                  product: list[index],
                ),
              );
            }
          })),
    );
  }

  _drawTablet(Size size) {
    // print('products2: ' + products.toString());
    double _crossAxisSpacing = 10.0, _mainAxisSpacing = 10.0;
    int _crossAxisCount = 2;

    double itemHeight = _getHeightForGridViewTab(size);
    double itemWidth = size.width;

    return Container(
      constraints: BoxConstraints(maxHeight: double.infinity),
      width: size.width * 0.7,
      child: GridView.count(
          controller: _scrollController,
          childAspectRatio: (itemWidth / itemHeight / 1.7),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          mainAxisSpacing: _mainAxisSpacing,
          crossAxisSpacing: _crossAxisSpacing,
          crossAxisCount: _crossAxisCount,
          children: new List<Widget>.generate(list == null ? 0 : list.length,
              (index) {
            if (list == null) {
              return CircularProgressIndicator();
            } else {
              return new GridTile(
                child: ProductCard(
                  product: list[index],
                ),
              );
            }
          })),
    );
  }

  _drawMobile(Size size) {
    return Container(
      constraints: BoxConstraints(maxHeight: double.infinity),
      width: size.width * 0.7,
      child: Column(
        children: <Widget>[
          ListView.builder(
              controller: _scrollController,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: list == null ? 0 : list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductCard(
                    product: list[index],
                  ),
                );
              })
        ],
      ),
    );
  }
}
