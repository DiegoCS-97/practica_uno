import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/profile.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

import 'home/home.dart';

class Pay extends StatefulWidget {
  final String product;
  Pay({Key key, this.product}) : super(key: key);

  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagos"),
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
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            Container(
              margin: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Text("Elige tu metodo de pago:"),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: pagoHecho,
              child: Container(
                margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                height: 150,
                decoration: BoxDecoration(
                  color: tCuppingBrown50,
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 30.0, right: 20.0),
                      height: 100,
                      child: Image.network(
                          "https://icons.iconarchive.com/icons/iconsmind/outline/512/Credit-Card-2-icon.png"),
                    ),
                    Text("Tarjeta de crédito"),
                    Container(
                      height: 20,
                      margin:
                          const EdgeInsets.only(left: 50.0, right: 16, top: 80),
                      child: Image.network(
                        "https://cdn.onlinewebfonts.com/svg/img_464126.png",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: pagoHecho,
              child: Container(
                margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                height: 150,
                decoration: BoxDecoration(
                  color: tCuppingBrown50,
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 30.0, right: 20.0),
                      height: 60,
                      child: Image.network(
                          "https://logosmarcas.com/wp-content/uploads/2018/03/PayPal-logo.png"),
                    ),
                    Text("PayPal"),
                    Container(
                      height: 20,
                      margin: const EdgeInsets.only(
                          left: 110.0, top: 80),
                      child: Image.network(
                        "https://cdn.onlinewebfonts.com/svg/img_464126.png",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: pagoHecho,
              child: Container(
                margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                height: 150,
                decoration: BoxDecoration(
                  color: tCuppingBrown50,
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 30.0, right: 20.0),
                      height: 68,
                      child: Image.network(
                          "https://cdn.onlinewebfonts.com/svg/img_554179.png"),
                    ),
                    Text("Tarjeta de regalo"),
                    Container(
                      height: 20,
                      margin:
                          const EdgeInsets.only(left: 50.0, right: 20, top: 80),
                      child: Image.network(
                        "https://cdn.onlinewebfonts.com/svg/img_464126.png",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void pagoHecho() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Image.network(
                    "https://images-na.ssl-images-amazon.com/images/I/81DLJc5I5XL._SX569_.jpg"),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Container(
                      height: 40,
                      child: Image.network(
                          "https://i.pinimg.com/originals/f2/ed/fe/f2edfe04ec588f40368f6ede5d26c1f2.png"),
                    ),
                    SizedBox(width: 20),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("¡Orden exitosa!"),
                          Text(
                            widget.product,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                    "Tu orden ha sido registrada, para más información busca en la opción historial de compras en tu perfil."),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('ACEPTAR'),
              textColor: Colors.purple,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Home(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
