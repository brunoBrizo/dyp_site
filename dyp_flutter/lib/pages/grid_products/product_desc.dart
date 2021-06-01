import 'package:dyp/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDesc extends StatelessWidget {
  final Product product;

  const ProductDesc({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: new ListTile(
            title: Center(
              child: new Text(
                product.name,
                style: new TextStyle(
                    fontSize: 15.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        new SizedBox(
          height: 2.0,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: new Text(
            product.description,
            style: TextStyle(color: Colors.white, fontSize: 12.5),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
