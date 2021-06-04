import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Scan extends StatefulWidget {
  final Function toggleView;
  Scan({this.toggleView});

  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  // DatabaseService databaseMethods = new DatabaseService();
  // HelperFunctions helperFunctions = new HelperFunctions();
  // final AuthService _auth = AuthService();
  // final _formKey = GlobalKey<FormState>();
  PickedFile image;
  final _imagePicker = ImagePicker();
  var file;

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
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (BuildContext context) => _buildPopupDialog(context),
    );
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

  Widget _myListView(
    BuildContext context,
  ) {
    return new Flexible(
        child: ListView(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.all(26),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/couch.jpg'),
                radius: 60,
              ),
              title: Text('Couch'),
              tileColor: Color.fromRGBO(0, 101, 149, 0.2),
              contentPadding: EdgeInsets.all(10),
            )),
        // ListTile(
        //   leading: CircleAvatar(
        //     backgroundImage: AssetImage('assets/couch.jpg'),
        //   ),
        //   title: Text('Moon'),
        // ),
        // ListTile(
        //   leading: CircleAvatar(
        //     backgroundImage: AssetImage('assets/stars.jpg'),
        //   ),
        //   title: Text('Star'),
        // ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(210, 35, 42, 0.9),
        elevation: 0.0,
        title: Text('Start Scanning'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 32,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                _showPicker(context);
              },
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Color(0xffFDCF09),
                child: file != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.file(
                          file,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(50)),
                        width: 100,
                        height: 100,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
                      ),
              ),
            ),
          ),
          _myListView(context),
        ],
      ),
    );
  }
}
