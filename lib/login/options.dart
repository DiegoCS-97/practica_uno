import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/login/log_in.dart';
import 'package:practica_integradora_uno/utils/constants.dart';
import 'package:practica_integradora_uno/login/sign_in.dart';

class Options extends StatelessWidget {
  const Options({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [tCuppingBlue100, tCuppingBlack],
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 120,),
          Image.asset('assets/images/cupping.png', width: 300,),
          SizedBox(height: 80,),
          MaterialButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Signin()));
            },
            color: tCuppingBrown50,
            minWidth: 350,
            height: 50,
            child: Text("REGISTRATE"),
          ),
          SizedBox(height: 50,),
          MaterialButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Login()));
            },
            color: tCuppingBrown50,
            minWidth: 350,
            height: 50,
            child: Text("INGRESA"),
          ),
        ],
      ));
  }
}
