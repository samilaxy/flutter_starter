import 'package:flutter/material.dart';
import 'package:flutter_starter/shared/menu_bottom.dart';
import 'package:flutter_starter/shared/menu_drawer.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWeight = TextEditingController();
  final double fontSize = 18;
  String result = '';
  bool validate = true;
  bool isMetric = true;
  bool isImperial = false;
  double? heighgt;
  double? weight;
  late List<bool> isSelected;
  String heightMessage = '';
  String weightMessage = '';
  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightMessage =
        'Please input your height ${(isMetric) ? 'meters' : 'inches'}';
    weightMessage =
        'Please input your weight ${(isMetric) ? 'kilos' : 'pounds'}';
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator',
              style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white30,
        ),
        drawer: const MenuDrawer(),
        bottomNavigationBar: const MenuBottom(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                ToggleButtons(children: [
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child:
                          Text('Metric', style: TextStyle(fontSize: fontSize))),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Imperial',
                          style: TextStyle(fontSize: fontSize)))
                ], isSelected: isSelected, onPressed: toggleMeasure),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: TextField(
                    controller: txtHeight,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: heightMessage, fillColor: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: TextField(
                      controller: txtWeight,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: weightMessage,
                          errorText:
                              validate ? null : 'Fields Can\'t Be Empty')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 20),
                  child: PlatformElevatedButton(
                      onPressed: findBMI,
                      color: Colors.black,
                      child: Text('Calculate BMI',
                          style: TextStyle(fontSize: fontSize))),
                ),
                Text(
                  result,
                  style: TextStyle(color: validate ? Colors.black : Colors.red),
                )
              ],
            ),
          ),
        ));
  }

  void toggleMeasure(value) {
    if (value == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }

  void findBMI() {
    double bmi = 0;
    double height = double.tryParse(txtHeight.text) ?? 0;
    double weight = double.tryParse(txtWeight.text) ?? 0;

    if (isMetric) {
      bmi = weight / (height * height);
    } else {
      bmi = weight * 703 / (height * height);
    }

    setState(() {
      if (txtWeight.text.isEmpty || txtHeight.text.isEmpty) {
        validate == false;
        result = 'Fields Can\'t Be Empty';
      } else {
        validate == true;
        result = 'Your BMI is ${bmi.toStringAsFixed(2)}';
      }
      const DialogExample();
    });
  }
}

/*
if (Platform.isAndroid) {
  return ElevatedButton(onPressed: onPressed, child: child);
} else if (Platform.isIOS) {
  return CupertinoButton.filled(onPressed: onPressed, child: child);
}

*/

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}
