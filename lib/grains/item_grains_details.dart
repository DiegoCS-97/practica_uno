import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/models/product_grains.dart';
import 'package:practica_integradora_uno/utils/constants.dart';
import '../pay.dart';

class GrainsDetails extends StatefulWidget {
  final ProductGrains granoRecibido;
  GrainsDetails({Key key, this.granoRecibido}) : super(key: key);

  @override
  _GrainsDetailsState createState() => _GrainsDetailsState();
}

class _GrainsDetailsState extends State<GrainsDetails> {
  bool cuarto = false;
  bool kilo = false;
  @override
  Widget build(BuildContext context) {
    String precio = widget.granoRecibido.productPrice.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.granoRecibido.productTitle),
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
                colors: [tCuppingOrange100, tCuppingOrange50],
              )),
              height: MediaQuery.of(context).size.height * .40,
              width: MediaQuery.of(context).size.width * .75,
              child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Image.network(widget.granoRecibido.productImage,
                      fit: BoxFit.fill)),
            ),
            Positioned(
              top: 35,
              right: 50,
              child: IconButton(
                icon: Icon(Icons.favorite,
                    color:
                        widget.granoRecibido.liked ? Colors.red : Colors.black,
                    size: 30),
                onPressed: () {
                  setState(() {
                    widget.granoRecibido.liked
                        ? widget.granoRecibido.liked = false
                        : widget.granoRecibido.liked = true;
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
                    Text(widget.granoRecibido.productTitle),
                    SizedBox(height: 15),
                    Text(widget.granoRecibido.productDescription),
                    SizedBox(height: 15),
                    Row(
                      children: <Widget>[
                        Text("TAMAÑOS DISPONIBLES"),
                        SizedBox(width: 20),
                        Text("\$$precio"),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          child: Chip(
                            label: Text(
                              "240 G",
                              style: TextStyle(
                                color: cuarto ? Colors.purple : Colors.grey,
                              ),
                            ),
                            backgroundColor:
                                cuarto ? Colors.purple[50] : Colors.grey[300],
                          ),
                          onTap: () {
                            setState(() {
                              cuarto = true;
                              kilo = false;
                              widget.granoRecibido.productWeight =
                                  ProductWeight.CUARTO;
                              widget.granoRecibido.productPrice =
                                  widget.granoRecibido.productPriceCalculator();
                            });
                          },
                        ),
                        SizedBox(width: 15),
                        GestureDetector(
                          child: Chip(
                            label: Text(
                              "1K",
                              style: TextStyle(
                                color: kilo ? Colors.purple : Colors.grey,
                              ),
                            ),
                            backgroundColor:
                                kilo ? Colors.purple[50] : Colors.grey[300],
                          ),
                          onTap: () {
                            setState(() {
                              cuarto = false;
                              kilo = true;
                              widget.granoRecibido.productWeight =
                                  ProductWeight.KILO;
                              widget.granoRecibido.productPrice =
                                  widget.granoRecibido.productPriceCalculator();
                            });
                          },
                        ),
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
                        onPressed: () {
                        },
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
                            MaterialPageRoute(
                                builder: (_) => Pay(
                                      product:
                                          widget.granoRecibido.productTitle,
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
