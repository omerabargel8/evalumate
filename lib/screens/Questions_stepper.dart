import 'package:flutter/material.dart';
import 'package:flutter_spinbox/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsStepper extends StatefulWidget {
  @override
  _QuestionsStepperState createState() => _QuestionsStepperState();
}

class _QuestionsStepperState extends State<QuestionsStepper> {
  int activeStep = 1; // Initial step set to 1.

  int upperBound = 6; // upperBound MUST BE total number of icons minus 1.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Asset questionnaire'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              IconStepper(
                activeStepColor: Color.fromRGBO(0, 101, 149, 0.9),
                stepColor: Color.fromRGBO(241, 241, 241, 1),
                icons: [
                  Icon(Icons.supervised_user_circle),
                  Icon(Icons.flag),
                  Icon(Icons.access_alarm),
                  Icon(Icons.supervised_user_circle),
                  Icon(Icons.flag),
                  Icon(Icons.access_alarm),
                  Icon(Icons.supervised_user_circle),
                ],

                // activeStep property set to activeStep variable defined above.
                activeStep: activeStep,
                // This ensures step-tapping updates the activeStep.
                onStepReached: (index) {
                  setState(() {
                    activeStep = index;
                  });
                },
              ),
              questionMaker(activeStep),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  previousButton(),
                  nextButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget question(question) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 40.0,
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: '$question',
            style: GoogleFonts.montserrat(
                textStyle: Theme.of(context).textTheme.display1,
                fontSize: 30,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(210, 35, 42, 0.9)),
          ),
        ),
        SpinBox(
          min: 1,
          max: 100,
          value: 50,
          onChanged: (value) => print(value),
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }

  /// Returns the next button.
  Widget nextButton() {
    return ElevatedButton(
      onPressed: () {
        // Increment activeStep, when the next button is tapped. However, check for upper bound.
        if (activeStep < upperBound) {
          setState(() {
            activeStep++;
          });
        }
      },
      child: Text('Next'),
      style: ElevatedButton.styleFrom(
        primary: Color.fromRGBO(0, 101, 149, 1),
        textStyle: TextStyle(color: Colors.black),
      ),
    );
  }

  /// Returns the previous button.
  Widget previousButton() {
    return ElevatedButton(
      onPressed: () {
        // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
        if (activeStep > 0) {
          setState(() {
            activeStep--;
          });
        }
      },
      child: Text('Prev'),
      style: ElevatedButton.styleFrom(
        primary: Color.fromRGBO(0, 101, 149, 1),
        textStyle: TextStyle(color: Colors.black),
      ),
    );
  }

  // Returns the header text based on the activeStep.
  Widget questionMaker(index) {
    switch (activeStep) {
      case 1:
        return question(
            "hey! please tell me What is the size of your house in square meters");

      case 2:
        return question("What is the total number of rooms in the house?");

      case 3:
        return question(
            "how would you describe the structure quality of house in one word");

      case 4:
        return question("What kind of house do you live in?");

      case 5:
        return question("What is the number of people living in this house?");

      case 6:
        return question("What is the age of your house (sorry for being rude)");

      default:
        return question("What is keeping your home safe from burglars");
    }
  }
}
