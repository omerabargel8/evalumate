import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String name;
  final String img;
  final bool isFav;
  final double rating;
  final int raters;
  final String subname;

  CartItem(
      {Key key,
      @required this.name,
      @required this.img,
      @required this.subname,
      @required this.isFav,
      @required this.rating,
      @required this.raters})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                //return ProductDetails();
                print("BLAAAA");
              },
            ),
          );
        },
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 0.0, right: 10.0),
              child: Container(
                height: MediaQuery.of(context).size.width / 3.5,
                width: MediaQuery.of(context).size.width / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    "$img",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "$name",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(0, 101, 149, 1),
                  ),
                ),
                Text(
                  "$subname",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                    color: Color.fromRGBO(0, 101, 149, 1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
