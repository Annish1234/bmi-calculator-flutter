import 'package:flutter/material.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/results_page.dart';
import 'calcultor.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age=10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text('BMI CALCULATOR'),
      )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      whenPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.mars, label: 'MALE'),
                      colour: selectedGender == Gender.male
                          ? KActiveCardColor
                          : KInactiveCardColor),
                ),
                Expanded(
                  child: ReusableCard(
                      whenPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                      colour: selectedGender == Gender.female
                          ? KActiveCardColor
                          : KInactiveCardColor),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: KActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: textStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(), style: textWeight),
                      Text(
                        'cm',
                        style: textStyle,
                      )
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    activeColor: Colors.blue,
                    inactiveColor: Colors.white,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour: KActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment:  MainAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT',
                      style: textStyle,),
                      Text(weight.toString(),
                      style: textWeight),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:<Widget> [
                         RoundIconButton(icon: FontAwesomeIcons.plus,
                         onPressed: (){
                           setState(() {
                             weight++;
                           });
                         },),

                          SizedBox(
                            width: 18.0,
                          ),
                         RoundIconButton(icon: FontAwesomeIcons.minus,
                         onPressed: (){
                           setState(() {
                             weight--;
                           });
                         },)

                        ],
                      ),

                    ],

                  ),),
                ),
                Expanded(
                  child: ReusableCard(colour: KActiveCardColor,
                    cardChild:Column(
                      mainAxisAlignment:  MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE',
                          style: textStyle,),
                        Text(age.toString(),
                            style: textWeight),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget> [
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },),

                            SizedBox(
                              width: 18.0,
                            ),
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },)

                          ],
                        ),

                      ],

                  ),
                    ),

                ),
              ],
            ),
          ),
          SizedBox(
            width: 18.0,
          ),
          BottomButton(string:'CALCULATE',onTap: (){
            Calculator cal = Calculator(height:height,weight:weight);
            Navigator.push(context,MaterialPageRoute(builder: (context)=>Results(
              bmiResult: cal.bmiCalculator(),
              resultText: cal.getResult(),
              interpretation: cal.getInterpretation(),
            )));
          },),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({this.string,this.onTap,
  }) ;
  final String string;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            string,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30.0,
                color: Colors.white),
          ),
        ),
        color: KBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: KBottomContainerHeight,
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon,this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return  RawMaterialButton(
      child: Icon(icon,color: Colors.white,),
      onPressed:onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Colors.blue,
    );
  }
}

