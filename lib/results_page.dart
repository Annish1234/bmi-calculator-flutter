import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'input_page.dart';

class Results extends StatelessWidget {
  Results({@required this.bmiResult,this.interpretation,this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget> [
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text('Your Result',style: kTitleTextStyle),
          ),
          ),
          Expanded(
              flex:5,
              child: ReusableCard(
            colour:KActiveCardColor ,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:<Widget> [
                    Text(
                      resultText.toUpperCase(),style: resultTextStyle,
                    ),
                    Text(bmiResult,
                    style: BMITextStyle,),
                    Text(interpretation ,style: textStyle,textAlign: TextAlign.center,),
                  ],

                ),

          ) ,
          ),
          BottomButton(string: 'RE-CALCULATE',onTap:(){
            Navigator.pop(context);
          },),


        ],
      ),
    );
  }
}