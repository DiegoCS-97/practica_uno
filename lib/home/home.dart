import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cups/cups_page.dart';
import 'package:practica_integradora_uno/drinks/drinks_page.dart';
import 'package:practica_integradora_uno/grains/grains_page.dart';
import 'package:practica_integradora_uno/home/item_home.dart';
import 'package:practica_integradora_uno/models/product_repository.dart';
import 'package:practica_integradora_uno/profile.dart';

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

List bebidas = ProductRepository.loadProducts(ProductType.BEBIDAS);

class _HomeState extends State<Home> {
  Map<String, List> products;
  @override
  void initState() {
    products = Map();
    products["DRINKS"] = ProductRepository.loadProducts(ProductType.BEBIDAS);
    products["GRAINS"] = ProductRepository.loadProducts(ProductType.GRANO);
    products["CUPS"] = ProductRepository.loadProducts(ProductType.TAZAS);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio", textAlign: TextAlign.left,),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Profile()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: _openDrinksPage,
            child: ItemHome(
              title: "Bebidas",
              image: "https://i.pinimg.com/originals/f1/34/8e/f1348ef41147a2d398f9a152d079e4c6.png",
            ),
          ),
          GestureDetector(
            onTap: _openGrainsPage,
            child: ItemHome(
              title: "Cafe en grano",
              image: "https://coffeeplanet.com/images/coffee-planet-colombia-fiesta-nari%C3%B1o-whole-bean-coffee-p13-127_image.jpg",
            ),
          ),
          GestureDetector(
            onTap: _openCupsPage,
            child: ItemHome(
              title: "Tazas",
              image:
                  "https://www.stickpng.com/assets/images/580b57fcd9996e24bc43c54a.png",
            ),
          ),
        ],
      ),
    );
  }

  void _openDrinksPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => DrinksPage (
          mProduct: products,
        ),
      ),
    );
  }

  void _openCupsPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CupsPage (
          mProduct: products,
        ),
      ),
    );
  }

  void _openGrainsPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => GrainsPage (
          mProduct: products,
        ),
      ),
    );
  }
}
