import 'dart:convert';

import 'package:dyp/models/product_model.dart';
import 'package:dyp/pages/grid_products/product_card.dart';
import 'package:dyp/utils/screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class GridProducts extends StatelessWidget {
  const GridProducts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
        desktop: GridProductsDesktop(),
        tablet: GridProductsTablet(),
        mobile: GridProductsMobile());
  }
}

class GridProductsDesktop extends StatefulWidget {
  const GridProductsDesktop({Key key}) : super(key: key);

  @override
  _GridProductsDesktopState createState() => _GridProductsDesktopState();
}

class _GridProductsDesktopState extends State<GridProductsDesktop> {
  final ScrollController _scrollController = ScrollController();
  var jsonProducts;
  List<dynamic> products;
  List<Product> list;

  _loadJson() async {
    String data = await rootBundle.loadString('assets/json/jsonCamaras.json');
    setState(() {
      jsonProducts = json.decode(data);
      products = jsonProducts['camaras'];
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // print('products2: ' + products.toString());
    double _crossAxisSpacing = 10.0, _mainAxisSpacing = 10.0;
    int _crossAxisCount = 3;

    double itemHeight = _getHeightForGridView(size);
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

  _getHeightForGridView(Size size) {
    final height = size.height;
    print('height: ' + height.toString());
    if (height > 1000.0) {
      return height * 0.95;
    } else if (height <= 1000.0 && height > 800.0) {
      return height;
    } else if (height <= 800.0) {
      return height * 1.23;
    }
  }
}

class GridProductsTablet extends StatefulWidget {
  const GridProductsTablet({Key key}) : super(key: key);

  @override
  _GridProductsTabletState createState() => _GridProductsTabletState();
}

class _GridProductsTabletState extends State<GridProductsTablet> {
  final ScrollController _scrollController = ScrollController();
  var jsonProducts;
  List<dynamic> products;
  List<Product> list;

  _loadJson() async {
    String data = await rootBundle.loadString('assets/json/jsonCamaras.json');
    setState(() {
      jsonProducts = json.decode(data);
      products = jsonProducts['camaras'];
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // print('products2: ' + products.toString());
    double _crossAxisSpacing = 10.0, _mainAxisSpacing = 10.0;
    int _crossAxisCount = 2;

    double itemHeight = _getHeightForGridView(size);
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

  _getHeightForGridView(Size size) {
    final height = size.height;
    print('height: ' + height.toString());
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
}

class GridProductsMobile extends StatefulWidget {
  const GridProductsMobile({Key key}) : super(key: key);

  @override
  _GridProductsMobileState createState() => _GridProductsMobileState();
}

class _GridProductsMobileState extends State<GridProductsMobile> {
  final ScrollController _scrollController = ScrollController();
  var jsonProducts;
  List<dynamic> products;
  List<Product> list;

  _loadJson() async {
    String data = await rootBundle.loadString('assets/json/jsonCamaras.json');
    setState(() {
      jsonProducts = json.decode(data);
      products = jsonProducts['camaras'];
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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

  _getHeightForGridView(Size size) {
    final height = size.height;
    print('height: ' + height.toString());
    if (height >= 1200.0) {
      return height * 0.5;
    } else if (height > 1000.0 && height < 1200.0) {
      return height * 0.6;
    } else if (height <= 1000.0 && height > 800.0) {
      return height * 0.3;
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
}
