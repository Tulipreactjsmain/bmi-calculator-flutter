import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0XFF1D1E33);
const inActiveCardColor = Color(0XFF111328);
const bottomContainerColor = Color(0xffeb1555);

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inActiveCardColor;
  Color femaleCardColor = inActiveCardColor;
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI CALCULATOR',
          ),
        ),
        body: Column(
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
                          ? activeCardColor
                          : inActiveCardColor,
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
                            ? activeCardColor
                            : inActiveCardColor,
                        cardChild: IconContent(
                          text: "FEMALE",
                          icon: FontAwesomeIcons.venus,
                        )))
              ],
            )),
            Expanded(
              child: reUsableCard(colour: activeCardColor),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: reUsableCard(colour: activeCardColor),
                ),
                Expanded(
                  child: reUsableCard(colour: activeCardColor),
                )
              ],
            )),
            Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        ));
  }
}
