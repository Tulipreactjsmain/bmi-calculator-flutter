import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation});

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Your Result',
              textAlign: TextAlign.center,
              style: kTitleTextStyle,
            ),
          )),
          Expanded(
              flex: 5,
              child: reUsableCard(
                colour: kActiveCardColor,
                cardChild: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        resultText.toUpperCase(),
                        style: kResultTextStyle,
                      ),
                      Text(
                        bmiResult,
                        style: kBMITextStyle,
                      ),
                      Text(
                        interpretation,
                        style: kbodyTextStyle,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              )),
          BottomButton(
              onTap: () => {Navigator.pop(context)},
              buttonTitle: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
