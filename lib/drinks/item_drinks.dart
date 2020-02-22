import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/models/product_drinks.dart';
import 'package:practica_integradora_uno/drinks/item_drinks_details.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class ItemDrinks extends StatefulWidget {
  final ProductDrinks bebida;
  const ItemDrinks({Key key, this.bebida}) : super(key: key);

  @override
  _ItemDrinksState createState() => _ItemDrinksState();
}

class _ItemDrinksState extends State<ItemDrinks> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: openDrinkDetails,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        color: tCuppingBrown50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Cafe",
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      widget.bebida.productTitle,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      widget.bebida.productPrice.toString(),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              flex: 4,
            ),
            Expanded(
              child: Container(
                child: Image.network(
                  widget.bebida.productImage,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              flex: 3,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 80),
                child: IconButton(
                    icon: Icon(
                      Icons.favorite, 
                      color: widget.bebida.liked ? Colors.red : Colors.black, 
                      size: 20
                    ),
                    onPressed: () {
                      setState(() {
                        widget.bebida.liked ? widget.bebida.liked = false : widget.bebida.liked = true;
                      });
                    }),
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }

  void openDrinkDetails() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => DrinksDetails(
          bebidaRecibida: widget.bebida,
        ),
      ),
    );
  }
}