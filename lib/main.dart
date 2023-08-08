import 'package:bmi_cal/ExtendPage.dart';
import 'package:bmi_cal/model/PersonDetails.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomeScreen()
    );
  }
}

class HomeScreen extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final _height = TextEditingController();
  final _weight = TextEditingController();

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
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      controller: _height,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if(value!.isEmpty || !RegExp(r"^[0-9]|([0-9]\.[0-9])$").hasMatch(value!))
                        {
                          return "*enter a valid input";
                        }
                      },
                      decoration: const InputDecoration(
                          labelText: 'Height(in cm)',
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      controller: _weight,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if(value!.isEmpty || !RegExp(r"^[0-9]|([0-9]\.[0-9])$").hasMatch(value!))
                        {
                          return "*enter a valid input";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Weight(in kg)',
                          border: OutlineInputBorder()
                      ),
                    ),
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                            if(_formkey.currentState!.validate())
                            {
                              PersonDetails details = PersonDetails(
                                  height: double.parse(_height.text),
                                  weight: double.parse(_weight.text)
                              );
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => DisplayPage(details: details),
                                  ));
                              _height.clear();
                              _weight.clear();
                            }
                        },
                        child: Text(
                          "Calculate",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple
                        ),
                      )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

