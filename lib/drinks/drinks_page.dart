import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/drinks/item_drinks.dart';
import 'package:practica_integradora_uno/profile.dart';

class DrinksPage extends StatelessWidget {
  final Map<String, List> mProduct;
  const DrinksPage({Key key, this.mProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bebidas", textAlign: TextAlign.center,),
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
      body: ListView.builder(
        itemCount: mProduct["DRINKS"].length,
        itemBuilder: (BuildContext context, int index) {
          return ItemDrinks(
            bebida: mProduct["DRINKS"][index],
          );
        },
      ),
    );
  }
}