import 'package:flutter/material.dart';
import 'package:flutter_app/screens/product.dart';
import 'package:flutter_app/screens/scan.dart';
import 'package:flutter_app/widgets/card_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final TextEditingController _couponlControl = new TextEditingController();
  PickedFile image;
  final _imagePicker = ImagePicker();

  var file;
  @override
  void initState() {
    super.initState();
  }

  //ImageUpload imageUpload = ImageUpload('businesses_img');
  _imgFromCamera() async {
    image = await _imagePicker.getImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      file = File(image.path);
    });
    postToServer(file);
  }

  _imgFromGallery() async {
    image = await _imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      print(image.path);
      file = File(image.path);
    });
    postToServer(file);
  }

  postToServer(image) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: SpinKitFadingCube(
              color: Color.fromRGBO(210, 35, 42, 0.9),
              size: 50.0,
            ),
          );
        });
    await Future.delayed(Duration(seconds: 5));
    products.add({
      "img": "assets/showcase.jpeg",
      "name": "Showcase",
      "subname": "Vintage showcase costs 10k NIS"
    });
    Navigator.pop(context);

    showDialog(
      context: context,
      builder: (BuildContext context) => _buildPopupDialog(context),
    );

    setState(() {});

    // var response = await Dio().post("http://10.30.17.92:5000/recognize",
    //     data: image.readAsBytesSync());
    // print(response);
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      contentPadding: const EdgeInsets.all(16.0),
      content: new Column(
        children: <Widget>[
          Text("Nice showcase!\nDoes it have any special meaning for you?"),
          new Expanded(
              child: new TextField(
            autofocus: true,
            decoration: new InputDecoration(
              labelStyle: TextStyle(fontSize: 20),
              helperStyle: TextStyle(fontSize: 16),
              helperText: "If yes, you can write about it here",
            ),
          ))
        ],
      ),
      actions: <Widget>[
        new FlatButton(
            child: const Text('NO SPECIAL MEANING'),
            onPressed: () {
              Navigator.pop(context);
            }),
        new FlatButton(
            child: const Text('SAVE DESCRIPTION'),
            onPressed: () {
              Navigator.pop(context);
            })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(210, 35, 42, 0.9),
        elevation: 0.0,
        title: Text('Living Room Scanning'),
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
                  subname: product['subname'],
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
                _showPicker(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Scan()),
                // );
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
