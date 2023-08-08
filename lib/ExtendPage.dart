import 'package:bmi_cal/model/PersonDetails.dart';
import 'package:flutter/material.dart';

class DisplayPage extends StatelessWidget {
  PersonDetails details;
  DisplayPage({required this.details,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "BMI Calculator",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400
              ),
            )
          ],
        ),
        backgroundColor: Colors.purple,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(50),
            constraints: BoxConstraints(maxWidth: 700),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text("Your Result"),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: this.bodyCheckup(bmi: details.bmi),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bodyCheckup({required double bmi})
  {
    if (bmi < 18.5) {
      return Text(
          'You are underweight.',
          style: TextStyle(
            color: Colors.yellow,
            fontSize: 25
          ),
      );
    }
    else if (bmi >= 18.5 && bmi < 25.0) {
      return Text(
        'You have a normal weight.',
        style: TextStyle(
            color: Colors.green,
            fontSize: 25
        ),
      );
    }
    else if (bmi >= 25.0 && bmi < 30.0) {
      return Text(
        'You are overweight.',
        style: TextStyle(
            color: Colors.orange,
            fontSize: 25
        ),
      );
    }
    else if (bmi >= 30.0 && bmi < 36) {
      return Text(
        'You are Obese.',
        style: TextStyle(
            color: Colors.red,
            fontSize: 25
        ),
      );
    }
    else {
      return Text(
        'You are Extremely obese.',
        style: TextStyle(
            color: Colors.red,
            fontSize: 25
        ),
      );
    }
  }
}
