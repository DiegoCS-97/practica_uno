import 'package:flutter/foundation.dart';

enum ProductColor { Red, Green, Blue}

class ProductCups {
  String productTitle; // nombre del producto
  String productDescription; // descripcion del producto
  String productImage; // url de imagen del producto
  ProductColor productColor; // tamano del producto
  double productPrice; // precio del producto autocalculado
  int productAmount; // cantidad de producto por comprar
  bool liked;

  ProductCups({
    @required this.productTitle,
    @required this.productDescription,
    @required this.productImage,
    @required this.productColor,
    @required this.productAmount,
    this.liked = false,
  }) {
    productPrice = 75.0;
  }
}