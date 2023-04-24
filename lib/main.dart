import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyStepper(),
    );
  }
}

class MyStepper extends StatefulWidget {
  const MyStepper({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _MyStepperState createState() => _MyStepperState();
}

class _MyStepperState extends State<MyStepper>{
  int _currentStep = 0;
  // ignore: non_constant_identifier_names
  List<Step> MyStepList = [
            const Step(
              title: Text("Load File"), 
              content: Text("0) Need to upload your file"),
            ),
            const Step(
              title: Text("Set Params"), 
              content: Text("1) Select options"),
            ),
            const Step(
              title: Text("Save file"), 
              content: Text("2) All right, press continue"),
            )];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo Stepper"),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Stepper(
          currentStep: _currentStep,
          steps: MyStepList,
          type: StepperType.horizontal,
          onStepContinue:() {
            setState(() {
              if (_currentStep< MyStepList.length -1) {
                _currentStep++;
              }else{
                _currentStep = 0;
              }
            });
          },
          onStepCancel:() {
            setState(() {
              if (_currentStep > 0) {
                _currentStep--;
              }else{
                _currentStep = 0;
              }
            });
          },
          onStepTapped: (step) {
            setState(() {
              _currentStep = step;
            });
          },
        ),
      ),
    );
 }
}


 
