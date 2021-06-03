import 'package:flutter/material.dart';
import 'package:flutter_app/light_colors.dart';
import 'package:flutter_app/widgets/active_project_card.dart';
import 'package:flutter_app/widgets/top_container.dart';

class Rooms extends StatefulWidget {
  @override
  _RoomsState createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              height: 150,
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
                                  'My Home',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 50.0,
                                    color: Color.fromRGBO(0, 101, 149, 0.9),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Icon(Icons.home,
                                  color: Color.fromRGBO(210, 35, 42, 0.9),
                                  size: 30.0),
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
            Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // subheading('Active Projects'),
                  SizedBox(height: 5.0),
                  Row(
                    children: <Widget>[
                      ActiveProjectsCard(
                        cardColor: LightColors.kGreen,
                        loadingPercent: 0.25,
                        title: 'Kitchen',
                        icon: Icons.restaurant,
                      ),
                      SizedBox(width: 20.0),
                      ActiveProjectsCard(
                        cardColor: LightColors.kRed,
                        loadingPercent: 0.6,
                        title: 'Living Room',
                        icon: Icons.tv,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      ActiveProjectsCard(
                        cardColor: LightColors.kDarkYellow,
                        loadingPercent: 0.45,
                        title: 'Bedroom',
                        icon: Icons.king_bed,
                      ),
                      SizedBox(width: 20.0),
                      ActiveProjectsCard(
                        cardColor: LightColors.kBlue,
                        loadingPercent: 0.9,
                        title: 'Bathroom',
                        icon: Icons.bathtub,
                      ),
                    ],
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

// import 'package:flutter/material.dart';
// import 'package:flutter_app/light_colors.dart';
// import 'package:flutter_app/widgets/active_project_card.dart';
// import 'package:flutter_app/widgets/top_container.dart';

// class Rooms extends StatefulWidget {
//   @override
//   _RoomsState createState() => _RoomsState();
// }

// class _RoomsState extends State<Rooms> {
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: LightColors.kLightYellow,
//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: <Widget>[
//                     Container(
//                       color: Colors.transparent,
//                       padding: EdgeInsets.symmetric(
//                           horizontal: 20.0, vertical: 10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           // subheading('Active Projects'),
//                           SizedBox(height: 5.0),
//                           Row(
//                             children: <Widget>[
//                               ActiveProjectsCard(
//                                 cardColor: LightColors.kGreen,
//                                 loadingPercent: 0.25,
//                                 title: 'Kitchen',
//                                 icon: Icons.restaurant,
//                               ),
//                               SizedBox(width: 20.0),
//                               ActiveProjectsCard(
//                                 cardColor: LightColors.kRed,
//                                 loadingPercent: 0.6,
//                                 title: 'Kitchen',
//                                 icon: Icons.restaurant,
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: <Widget>[
//                               ActiveProjectsCard(
//                                 cardColor: LightColors.kDarkYellow,
//                                 loadingPercent: 0.45,
//                                 title: 'Kitchen',
//                                 icon: Icons.restaurant,
//                               ),
//                               SizedBox(width: 20.0),
//                               ActiveProjectsCard(
//                                 cardColor: LightColors.kBlue,
//                                 loadingPercent: 0.9,
//                                 title: 'Kitchen',
//                                 icon: Icons.restaurant,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
