import 'package:flutter/material.dart';
import 'package:flutter_application_1/ecommerce_app/models/product_model.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  ProductWidget(this.product);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.grey.withOpacity(0.2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.network(
              product.image ?? '',
              errorBuilder: (x, y, z) {
                return Center(
                  child: Icon(Icons.broken_image),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            product.title ?? 'Not Defined',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text(
            product.price.toString(),
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
