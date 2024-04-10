import 'package:flutter/material.dart';
import '../components/bottom_button.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/constants.dart';
import '../components/customButton.dart';
import '../calculator_brain.dart';
import '../screens/results_page.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInActiveCardColor;
  Color femaleCardColor = kInActiveCardColor;
  Gender? selectedGender;
  int height = 150;
  int weight = 60;
  int age = 18;
  late CalculatorBrain calc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI CALCULATOR',
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: reUsableCard(
                      onPress: () => {
                            setState(() {
                              selectedGender = Gender.male;
                            })
                          },
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInActiveCardColor,
                      cardChild: IconContent(
                        text: "MALE",
                        icon: FontAwesomeIcons.mars,
                      )),
                ),
                Expanded(
                    child: reUsableCard(
                        onPress: () => {
                              setState(() {
                                selectedGender = Gender.female;
                              })
                            },
                        colour: selectedGender == Gender.female
                            ? kActiveCardColor
                            : kInActiveCardColor,
                        cardChild: IconContent(
                          text: "FEMALE",
                          icon: FontAwesomeIcons.venus,
                        )))
              ],
            )),
            Expanded(
              child: reUsableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Color.fromARGB(255, 234, 231, 231),
                          overlayColor: Color(0x29eb1555),
                          thumbColor: kBottomContainerColor,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0)),
                      child: Slider(
                        value: height.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                        // activeColor: Color.fromARGB(255, 177, 177, 177),
                        inactiveColor: Color(0xff8d8e98),
                        min: 120.0,
                        max: 220.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: reUsableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () => {
                                setState(() {
                                  weight--;
                                })
                              },
                              buttonIcon: Icon(FontAwesomeIcons.minus),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              onPressed: () => {
                                setState(() {
                                  weight++;
                                })
                              },
                              buttonIcon: Icon(FontAwesomeIcons.plus),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: reUsableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () => {
                                setState(() {
                                  age--;
                                })
                              },
                              buttonIcon: Icon(FontAwesomeIcons.minus),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              onPressed: () => {
                                setState(() {
                                  age++;
                                })
                              },
                              buttonIcon: Icon(FontAwesomeIcons.plus),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
            BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () => {
                calc = CalculatorBrain(height: height, weight: weight),
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                            interpretation: calc.getInterpretation()))),
              },
            )
          ],
        ));
  }
}
