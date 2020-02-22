import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/models/product_grains.dart';
import 'package:practica_integradora_uno/grains/item_grains_details.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class ItemGrains extends StatefulWidget {
  final ProductGrains grano;
  const ItemGrains({Key key, this.grano}) : super(key: key);

  @override
  _ItemGrainsState createState() => _ItemGrainsState();
}

class _ItemGrainsState extends State<ItemGrains> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: openGrainsDetails,
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
                      "Cafe de grano",
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      widget.grano.productTitle,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      widget.grano.productPrice.toString(),
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
                  widget.grano.productImage,
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
                      color: widget.grano.liked ? Colors.red : Colors.black, 
                      size: 20
                    ),
                    onPressed: () {
                      setState(() {
                        widget.grano.liked ? widget.grano.liked = false : widget.grano.liked = true;
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

  void openGrainsDetails() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => GrainsDetails(
          granoRecibido: widget.grano,
        ),
      ),
    );
  }
}