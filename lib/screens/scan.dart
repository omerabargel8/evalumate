import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

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
      print(image.path);
      file = File(image.path);
    });
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
    var response = await Dio()
        .post("localhost:5000/recognize", data: image.readAsBytesSync());
    print(response);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
          )
        ],
      ),
    );
  }
}
