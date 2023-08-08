import 'dart:math';

class PersonDetails
{
  double height, weight;
  late double bmi;

  PersonDetails({required this.height,required this.weight}){
    this.bmi = calBmi();
  }

  double calBmi()
  {
    double bmi = this.weight/pow(this.height/100,2);
    return bmi;
  }
}