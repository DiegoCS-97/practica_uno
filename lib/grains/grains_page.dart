import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/grains/item_grains.dart';
import 'package:practica_integradora_uno/profile.dart';

class GrainsPage extends StatelessWidget {
  final Map<String, List> mProduct;
  const GrainsPage({Key key, this.mProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Café de grano", textAlign: TextAlign.center),
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
        itemCount: mProduct["GRAINS"].length,
        itemBuilder: (BuildContext context, int index) {
          return ItemGrains(
            grano: mProduct["GRAINS"][index],
          );
        }
      )
    );
  }
}