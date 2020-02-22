import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/home/home.dart';
import 'package:practica_integradora_uno/login/sign_in.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                    decoration:
                        InputDecoration(filled: true, fillColor: Colors.white),
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
                  SizedBox(height: 40),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: MaterialButton(
                          height: 50,
                          color: tCuppingBrown50,
                          child: Text("ENTRAR"),
                          onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => Home()));
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: Text(
                      "¿Olvidaste tu password?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 85),
                  Center(
                    child: Text(
                      "Aun no tienes una cuenta?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => Signin()));
                    },
                    child: Center(
                      child: Text(
                        "REGISTRATE",
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
