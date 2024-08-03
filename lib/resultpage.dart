import 'constant.dart';
import 'package:flutter/material.dart';
import 'ReusableCard.dart';

class ResultPage extends StatelessWidget {
  ResultPage({ required this.resulttext, required this.bmiresult, required this.interpretationText});

  final String resulttext;
  final String bmiresult;
  final String interpretationText;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(15),
              child: Text(
              
                'Your Result!',
                style: kTextTitleStyle,
                
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resulttext,
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiresult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretationText,
                    textAlign: TextAlign.center,
                    style: kBMIDescripStyle,
                  ),
                   Icon(Icons.face_retouching_natural_sharp),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                  child: Text(
                'RE-CALCULATE',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
              color: kBottomPinkColor,
              height: 70.0,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10.0),
            ),
          )
        ],
      ),
    );
  }
}
