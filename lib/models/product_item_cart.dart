import 'package:flutter/foundation.dart';
import 'package:practica_integradora_uno/models/product_repository.dart';

class ProductItemCart {
  String productTitle;
  int productAmount;
  double productPrice;
  final ProductType typeOfProduct;

  ProductItemCart({
    this.typeOfProduct,
    @required this.productTitle,
    @required this.productAmount,
    @required this.productPrice,
  });
}
