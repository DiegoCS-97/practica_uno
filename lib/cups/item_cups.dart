import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/models/product_cup.dart';
import 'package:practica_integradora_uno/cups/item_cups_details.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class ItemCups extends StatefulWidget {
  final ProductCups taza;
  ItemCups({Key key, this.taza}) : super(key: key);

  @override
  _ItemCupsState createState() => _ItemCupsState();
}

class _ItemCupsState extends State<ItemCups> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: openCupDetails,
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
                      "Taza",
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      widget.taza.productTitle,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      widget.taza.productPrice.toString(),
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
                  widget.taza.productImage,
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
                    icon: Icon(Icons.favorite,
                        color: widget.taza.liked ? Colors.red : Colors.black,
                        size: 20),
                    onPressed: () {
                      setState(() {
                        widget.taza.liked
                            ? widget.taza.liked = false
                            : widget.taza.liked = true;
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

  void openCupDetails() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CupsDetails(
          tazaRecibida: widget.taza,
        ),
      ),
    );
  }
}
