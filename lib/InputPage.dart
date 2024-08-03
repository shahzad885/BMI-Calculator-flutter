
import 'CalculatorBrain.dart';
import 'package:flutter/material.dart';
import 'ReusableCard.dart';
import 'cardIcon.dart';
import 'resultpage.dart';
import 'constant.dart';
import 'roundIconButton.dart';

enum gender { male, female }

// Text Color: 0xFF8D8E98
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveColor;
  Color femaleCardColor = kInactiveColor;
  int height = 180;
  int weight = 60;
  int age = 10;

  void updateColor(gender selectedgender) {
    if (selectedgender == gender.male) {
      if (maleCardColor == kInactiveColor) {
        maleCardColor = kActiveColor;
        femaleCardColor = kInactiveColor;
      } else {
        maleCardColor = kInactiveColor;
      }
    }
    if (selectedgender == gender.female) {
      if (femaleCardColor == kInactiveColor) {
        femaleCardColor = kActiveColor;
        maleCardColor = kInactiveColor;
      } else {
        femaleCardColor = kInactiveColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(gender.male);
                      });
                    },
                    child: ReusableCard(
                      colour: maleCardColor,
                      cardChild: cardIcon(
                        Cicon: Icons.male,
                        Ctext: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(gender.female);
                      });
                    },
                    child: ReusableCard(
                      colour: femaleCardColor,
                      cardChild: cardIcon(
                        Cicon: Icons.female,
                        Ctext: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //-------------------------------------------  slider card -----------------------------
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: kTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kTextNumberStyle,
                            ),
                            Text('CM',
                                style: TextStyle(
                                    fontSize: 8.0, color: Color(0xFF8D8E98))),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 16.0),
                            thumbColor: Color(0xFFEB1555),
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFF8D8E98),
                            overlayColor: Color(0x29EB1555),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 100.0,
                            max: 420.0,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),

          //-------------------------------Bottom Two cards ------------
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kTextNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          RoundIconButton(
                            icon: Icons.horizontal_rule,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(width: 10.0,),
                          RoundIconButton(
                            icon: Icons.add,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ]),
                      ],
                    ),
                  ),
                ),


                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE', style: kTextStyle,),
                        Text(age.toString(), style: kTextNumberStyle,),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          RoundIconButton(
                            icon: Icons.horizontal_rule,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(width: 10.0,),
                          RoundIconButton(
                            icon: Icons.add,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){

              CalculatorBrain cal = CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context, MaterialPageRoute(
                builder: (context)=>ResultPage(

                  resulttext: cal.getResult() ,
                  bmiresult: cal.calculateBMI(),
                  interpretationText: cal.getInterpretation(),
                )));
            },
            child: Container(
               child: Center(child: Text('CALCULATE', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)),
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


