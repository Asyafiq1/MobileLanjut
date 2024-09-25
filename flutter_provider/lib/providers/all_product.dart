import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_provider/models/product.dart';

class Products with ChangeNotifier {
  List<Product> _allproducts = List.generate(
    25,
    (index) {
      return Product(
        id: "id ${index + 1}",
        title: "Product ${index + 1}",
        description: "Ini adalah deskripsi produk ${index + 1}",
        price: 10 + Random().nextInt(100).toDouble(),
        imageUrl: "https://picsum.photos/id/$index/200/300",
      );
    },
  );

  List<Product> get allProducts {
    return [..._allproducts];
  }
}
