import 'package:flutter/material.dart';
import 'package:flutter_app/screens/product.dart';
import 'package:flutter_app/screens/scan.dart';
import 'package:flutter_app/widgets/card_item.dart';
import 'package:google_fonts/google_fonts.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final TextEditingController _couponlControl = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Start Scaning",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            tooltip: "Back",
            icon: Icon(
              Icons.clear,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            Text(
              'Let' 's Scan it!',
              textAlign: TextAlign.center,
              style: GoogleFonts.dancingScript(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: 60.0,
                fontWeight: FontWeight.w800,
                color: Color.fromRGBO(0, 101, 149, 1),
              ),
            ),
            SizedBox(height: 10.0),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: products == null ? 0 : products.length,
              itemBuilder: (BuildContext context, int index) {
                Map product = products[index];
                return CartItem(
                  img: product['img'],
                  isFav: false,
                  name: product['name'],
                  rating: 5.0,
                  raters: 23,
                );
              },
            ),
            ElevatedButton.icon(
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 24.0,
              ),
              label: Text('Add product'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Scan()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(210, 35, 42, 0.9),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
