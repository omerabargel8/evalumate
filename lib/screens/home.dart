import 'package:flutter/material.dart';
import 'package:flutter_app/light_colors.dart';
import 'package:flutter_app/screens/Questions_stepper.dart';
import 'package:flutter_app/screens/list.dart';
import 'package:flutter_app/screens/rooms.dart';
import 'package:flutter_app/screens/scan.dart';
import 'package:flutter_app/widgets/task_column.dart';
import 'package:flutter_app/widgets/top_container.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: LightColors.kDarkBlue,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 241, 241, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(210, 35, 42, 0.9),
        elevation: 0.0,
        title: Text('Home'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              height: 150,
              width: width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'Hello!',
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.dancingScript(
                                    textStyle:
                                        Theme.of(context).textTheme.display1,
                                    fontSize: 90.0,
                                    fontWeight: FontWeight.w800,
                                    color: Color.fromRGBO(0, 101, 149, 1),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 2.0,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 400,
                      height: 400,
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              subheading("          Let's Get Started!"),
                            ],
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Container(
                              width: 350,
                              height: 60,
                              margin: const EdgeInsets.only(top: 20),
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              QuestionsStepper()),
                                    );
                                  },
                                  child: TaskColumn(
                                    icon: Icons.text_snippet_outlined,
                                    iconBackgroundColor:
                                        Color.fromRGBO(210, 35, 42, 0.9),
                                    title: 'Asset questionnaire',
                                    subtitle:
                                        'Enter details about the property',
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    onPrimary: Color.fromRGBO(0, 101, 149, 0.9),
                                    primary: Color.fromRGBO(241, 241, 241, 1),
                                    textStyle: TextStyle(color: Colors.black),
                                  ))),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Container(
                              width: 350,
                              height: 60,
                              margin: const EdgeInsets.only(top: 20),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Rooms()),
                                  );
                                },
                                child: TaskColumn(
                                  icon: Icons.camera_alt,
                                  iconBackgroundColor:
                                      Color.fromRGBO(210, 35, 42, 0.9),
                                  title: 'Scans',
                                  subtitle:
                                      'Let start scanning the contents\nof the asset',
                                ),
                                style: ElevatedButton.styleFrom(
                                  onPrimary: Color.fromRGBO(0, 101, 149, 0.9),
                                  primary: Color.fromRGBO(241, 241, 241, 1),
                                  textStyle: TextStyle(color: Colors.black),
                                ),
                              )),
                          SizedBox(height: 15.0),
                          Container(
                              width: 350,
                              height: 60,
                              margin: const EdgeInsets.only(top: 20),
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Scan()),
                                    );
                                  },
                                  child: TaskColumn(
                                    icon: Icons.star,
                                    iconBackgroundColor:
                                        Color.fromRGBO(210, 35, 42, 0.9),
                                    title: 'Special items',
                                    subtitle: 'valuable and special items',
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    onPrimary: Color.fromRGBO(0, 101, 149, 0.9),
                                    primary: Color.fromRGBO(241, 241, 241, 1),
                                    textStyle: TextStyle(color: Colors.black),
                                  ))),
                        ],
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
}
