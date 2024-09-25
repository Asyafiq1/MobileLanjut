import 'package:flutter/material.dart';
import 'package:flutter_provider/widget/product_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ), // AppBar
      body: ProductGrid(),
    ); // Scaffold
  }
}