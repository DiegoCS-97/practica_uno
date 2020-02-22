import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class ItemHome extends StatelessWidget {
  final String title;
  final String image;
  ItemHome({
    Key key,
    @required this.title,
    @required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      color: tCuppingBrown50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                "$title",
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            flex: 2,
          ),
          Expanded(
            child: ClipRRect(
              child: Image.network(
                "$image",
                fit: BoxFit.fitHeight,
                height: 180,
              ),
            ),
            flex: 3,
          ),
        ],
      ),
    );
  }
}
