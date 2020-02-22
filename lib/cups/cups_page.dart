import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cups/item_cups.dart';
import 'package:practica_integradora_uno/profile.dart';

class CupsPage extends StatelessWidget {
  final Map<String, List> mProduct;
  const CupsPage({Key key, this.mProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tazas", textAlign: TextAlign.center,),
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
        itemCount: mProduct["CUPS"].length,
        itemBuilder: (BuildContext context, int index) {
          return ItemCups(
            taza: mProduct["CUPS"][index],
          );
        },
      ),
    );
  }
}