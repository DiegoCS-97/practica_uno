import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/models/product_drinks.dart';
import 'package:practica_integradora_uno/utils/constants.dart';
import 'package:practica_integradora_uno/pay.dart';

class DrinksDetails extends StatefulWidget {
  final ProductDrinks bebidaRecibida;
  const DrinksDetails({
    Key key,
    this.bebidaRecibida,
  }) : super(key: key);

  @override
  _DrinksDetailsState createState() => _DrinksDetailsState();
}

class _DrinksDetailsState extends State<DrinksDetails> {
  bool small = false;
  bool medium = false;
  bool large = false;
  @override
  Widget build(BuildContext context) {
    String precio = widget.bebidaRecibida.productPrice.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bebidaRecibida.productTitle),
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
                  child: Image.network(widget.bebidaRecibida.productImage,
                      fit: BoxFit.fill)),
            ),
            Positioned(
              top: 35,
              right: 50,
              child: IconButton(
                icon: Icon(Icons.favorite,
                    color:
                        widget.bebidaRecibida.liked ? Colors.red : Colors.black,
                    size: 30),
                onPressed: () {
                  setState(() {
                    widget.bebidaRecibida.liked
                        ? widget.bebidaRecibida.liked = false
                        : widget.bebidaRecibida.liked = true;
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
                    Text(widget.bebidaRecibida.productTitle),
                    SizedBox(height: 15),
                    Text(widget.bebidaRecibida.productDescription),
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
                              "Chico",
                              style: TextStyle(
                                color: small ? Colors.purple : Colors.grey,
                              ),
                            ),
                            backgroundColor:
                                small ? Colors.purple[50] : Colors.grey[300],
                          ),
                          onTap: () {
                            setState(() {
                              small = true;
                              medium = false;
                              large = false;
                              widget.bebidaRecibida.productSize =
                                  ProductSize.CH;
                              widget.bebidaRecibida.productPrice = widget
                                  .bebidaRecibida
                                  .productPriceCalculator();
                            });
                          },
                        ),
                        SizedBox(width: 15),
                        GestureDetector(
                          child: Chip(
                            label: Text(
                              "Mediano",
                              style: TextStyle(
                                color: medium ? Colors.purple : Colors.grey,
                              ),
                            ),
                            backgroundColor:
                                medium ? Colors.purple[50] : Colors.grey[300],
                          ),
                          onTap: () {
                            setState(() {
                              small = false;
                              medium = true;
                              large = false;
                              widget.bebidaRecibida.productSize = ProductSize.M;
                              widget.bebidaRecibida.productPrice = widget
                                  .bebidaRecibida
                                  .productPriceCalculator();
                            });
                          },
                        ),
                        SizedBox(width: 15),
                        GestureDetector(
                          child: Chip(
                            label: Text(
                              "Grande",
                              style: TextStyle(
                                color: large ? Colors.purple : Colors.grey,
                              ),
                            ),
                            backgroundColor:
                                large ? Colors.purple[50] : Colors.grey[300],
                          ),
                          onTap: () {
                            setState(() {
                              small = false;
                              medium = false;
                              large = true;
                              widget.bebidaRecibida.productSize = ProductSize.G;
                              widget.bebidaRecibida.productPrice = widget
                                  .bebidaRecibida
                                  .productPriceCalculator();
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
                              product: widget.bebidaRecibida.productTitle,
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
