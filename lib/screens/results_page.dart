import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

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
                        'Normal',
                        style: kResultTextStyle,
                      ),
                      Text(
                        '18.3',
                        style: kBMITextStyle,
                      ),
                      Text(
                        'Your BMI result is low, you should eat more',
                        style: kbodyTextStyle,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              )),
          BottomButton(
              onTap: () => {Navigator.pop(context)}, buttonTitle: 'RECALCULATE')
        ],
      ),
    );
  }
}
