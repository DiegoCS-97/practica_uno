import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/login/log_in.dart';
import 'package:practica_integradora_uno/utils/constants.dart';
import 'package:practica_integradora_uno/home/home.dart';

class Signin extends StatefulWidget {
  Signin({Key key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  var valor = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [tCuppingBlue100, tCuppingBlack],
            )),
            child: Column(
              children: <Widget>[
                SizedBox(height: 140),
                Image.asset(
                  'assets/images/cupping.png',
                  width: 200,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 70,
                        ),
                        Text(
                          "Nombre completo:",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                              filled: true, fillColor: Colors.white),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Email:",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                              filled: true, fillColor: Colors.white),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Password:",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 10),
                        TextField(
                          obscureText: true,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Checkbox(
                              activeColor: tCuppingBrown50,
                              value: valor,
                              onChanged: (bool value) {
                                setState(() {
                                  valor = value;
                                });
                              },
                            ),
                            Text(
                              "ACEPTO LOS TERMINOS Y CONDICIONES DE USO",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: MaterialButton(
                                height: 50,
                                color: tCuppingBrown50,
                                child: Text("REGISTRATE"),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => Home()));
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: Text(
                            "¿Ya tienes una cuenta?",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => Login()));
                          },
                          child: Center(
                            child: Text(
                              "INGRESA",
                              style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ],
            )));
  }
}
