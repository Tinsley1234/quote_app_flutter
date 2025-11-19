import 'package:flutter/material.dart';

class MyStepperApp extends StatefulWidget {
  @override
  _MyStepperAppState createState() => _MyStepperAppState();
}

class _MyStepperAppState extends State<MyStepperApp> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Stepper')),
      body: Stepper(
        type: StepperType.vertical, // or StepperType.horizontal
        currentStep: _currentStep,
        onStepContinue: () {
          setState(() {
            if (_currentStep < 2) { // Assuming 3 steps (0, 1, 2)
              _currentStep += 1;
            } else {
              // Handle completion of all steps
              print('Stepper completed!');
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (_currentStep > 0) {
              _currentStep -= 1;
            }
          });
        },
        onStepTapped: (index) {
          setState(() {
            _currentStep = index;
          });
        },
        steps: [
          Step(
            title: Text('Personal Info'),
            content: Text('Enter your personal details here.'),
            isActive: _currentStep >= 0,
            state: _currentStep > 0 ? StepState.complete : StepState.indexed,
          ),
          Step(
            title: Text('Step 2: Address Details'),
            content: Text('Provide your address information.'),
            isActive: _currentStep >= 1,
            state: _currentStep > 1 ? StepState.complete : StepState.indexed,
          ),
          Step(
            title: Text('Step 3: Confirmation'),
            content: Text('Review and confirm your details.'),
            isActive: _currentStep >= 2,
            state: _currentStep == 2 ? StepState.editing : StepState.indexed,
          ),
        ],
      ),
    );
  }
}