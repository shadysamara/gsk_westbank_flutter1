import 'package:flutter/material.dart';
import 'package:flutter_application_1/data.dart';
import 'package:flutter_application_1/ecommerce_app/models/product_model.dart';
import 'package:flutter_application_1/ecommerce_app/views/product_widget.dart';

class EcommerceMainScreen extends StatelessWidget {
  List<Product> convertMapsToProducts() {
    return data.map((e) => Product.fromMap(e)).toList();
  }

  late List<Product> products;
  EcommerceMainScreen() {
    products = convertMapsToProducts();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('ECOMMERCE'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 800,
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20),
            itemCount: products.length,
            itemBuilder: (c, index) {
              return ProductWidget(products[index]);
            }),
      ),
    );
  }
}
