import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/models/product_cup.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

import '../pay.dart';

class CupsDetails extends StatefulWidget {
  final ProductCups tazaRecibida;
  CupsDetails({Key key, this.tazaRecibida}) : super(key: key);

  @override
  _CupsDetailsState createState() => _CupsDetailsState();
}

class _CupsDetailsState extends State<CupsDetails> {
  var color1 = Colors.white;
  var color2 = Colors.white;
  @override
  Widget build(BuildContext context) {
    String precio = widget.tazaRecibida.productPrice.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tazaRecibida.productTitle),
      ),
      body: Column(
        children: <Widget>[
          Stack(children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [color1, color2],
              )),
              height: MediaQuery.of(context).size.height * .40,
              width: MediaQuery.of(context).size.width * .75,
              child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Image.network(widget.tazaRecibida.productImage,
                      fit: BoxFit.fill)),
            ),
            Positioned(
              top: 35,
              right: 50,
              child: IconButton(
                icon: Icon(Icons.favorite,
                    color:
                        widget.tazaRecibida.liked ? Colors.red : Colors.black,
                    size: 30),
                onPressed: () {
                  setState(() {
                    widget.tazaRecibida.liked
                        ? widget.tazaRecibida.liked = false
                        : widget.tazaRecibida.liked = true;
                  });
                },
              ),
            ),
          ]),
          Expanded(
            child: Container(
                margin: const EdgeInsets.only(left: 50, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.tazaRecibida.productTitle),
                    SizedBox(height: 15),
                    Text(widget.tazaRecibida.productDescription),
                    SizedBox(height: 15),
                    Row(
                      children: <Widget>[
                        Text("COLORES DISPONIBLES"),
                        SizedBox(width: 20),
                        Text("\$$precio"),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              color1 = Colors.white;
                              color2 = Colors.grey[350];
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.white, Colors.grey[350]],
                            )),
                            height: 30,
                            width: 30,
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              color1 = tCuppingOrange100;
                              color2 = tCuppingOrange50;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [tCuppingOrange100, tCuppingOrange50],
                            )),
                            height: 30,
                            width: 30,
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              color1 = tCuppingBlue100;
                              color2 = tCuppingBlack;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [tCuppingBlue100, tCuppingBlack],
                            )),
                            height: 30,
                            width: 30,
                          ),
                        )
                      ],
                    ),
                  ],
                )),
            flex: 3,
          ),
          Expanded(
            child: Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                        height: 50,
                        color: tCuppingBrown50,
                        child: Text(
                          "AGREGAR AL CARRITO",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: MaterialButton(
                        height: 50,
                        color: tCuppingBrown50,
                        child: Text(
                          "COMPRAR AHORA",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => Pay(
                              product: widget.tazaRecibida.productTitle,
                            )),
                          );
                        },
                      ),
                    ),
                  ],
                )),
            flex: 1,
          )
        ],
      ),
    );
  }
}
