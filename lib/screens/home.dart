import 'package:flutter/material.dart';
import 'package:flutter_app/light_colors.dart';
import 'package:flutter_app/screens/questionnaire.dart';
import 'package:flutter_app/screens/Questions_stepper.dart';
import 'package:flutter_app/screens/special_items.dart';
import 'package:flutter_app/widgets/task_column.dart';
import 'package:flutter_app/widgets/top_container.dart';

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

  static CircleAvatar calendarIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: LightColors.kGreen,
      child: Icon(
        Icons.calendar_today,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              height: 200,
              width: width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.menu,
                            color: LightColors.kDarkBlue, size: 30.0),
                        Icon(Icons.search,
                            color: LightColors.kDarkBlue, size: 25.0),
                      ],
                    ),
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
                                  style: TextStyle(
                                    fontSize: 50.0,
                                    color: LightColors.kDarkBlue,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  'Shimrit Harrai',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
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
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 40.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              subheading('To Do:'),
                            ],
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Questionnaire()),
                                );
                              },
                              child: TaskColumn(
                                icon: Icons.alarm,
                                iconBackgroundColor:
                                    Color.fromRGBO(210, 35, 42, 0.9),
                                title: 'Asset questionnaire',
                                subtitle: 'Enter details about the property',
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                              )),
                          const SizedBox(
                            height: 15.0,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QuestionsStepper()),
                                );
                              },
                              child: TaskColumn(
                                icon: Icons.blur_circular,
                                iconBackgroundColor:
                                    Color.fromRGBO(210, 35, 42, 0.9),
                                title: 'Scans',
                                subtitle:
                                    'Let start scanning the contents of the asset',
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white)),
                          SizedBox(height: 15.0),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SpecialItems()),
                                );
                              },
                              child: TaskColumn(
                                icon: Icons.check_circle_outline,
                                iconBackgroundColor:
                                    Color.fromRGBO(210, 35, 42, 0.9),
                                title: 'Special items',
                                subtitle: 'valuable and special items',
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white)),
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
