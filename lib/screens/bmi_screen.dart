import 'package:flutter/material.dart';
import 'package:flutter_starter/controllers/bmi_controller.dart';
import 'package:flutter_starter/shared/menu_bottom.dart';
import 'package:flutter_starter/shared/menu_drawer.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final bmiController = Get.put(BmiController());
  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWeight = TextEditingController();
  final double fontSize = 18;
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  double? heighgt;
  double? weight;
  late List<bool> isSelected;
  late bool validate = false;
  String heightMessage = '';
  String weightMessage = '';
  // @override
  // void initState() {
  //   // validate = true;
  //   isSelected = bmiController.isSelected;
  //   // isSelected = [isMetric, isImperial];
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    heightMessage =
        'Please input your height ${(bmiController.isMetric) ? 'meters' : 'inches'}';
    weightMessage =
        'Please input your weight ${(bmiController.isMetric) ? 'kilos' : 'pounds'}';
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator',
              style: TextStyle(color: Colors.white70)),
          backgroundColor: Colors.grey,
        ),
        drawer: const MenuDrawer(),
        bottomNavigationBar: const MenuBottom(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                ToggleButtons(isSelected: bmiController.isSelected, onPressed: toggleMeasure, children: [
                  Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child:
                          Text('Metric', style: TextStyle(fontSize: fontSize))),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Imperial',
                          style: TextStyle(fontSize: fontSize)))
                ]),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: TextField(
                    controller: bmiController.height,
                    //txtHeight,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: heightMessage, fillColor: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextField(
                      controller: bmiController.weight,
                      //txtWeight,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: weightMessage,
                        // errorText: validate ? null : 'Fields Can\'t Be Empty'
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 20),
                  child: PlatformElevatedButton(
                      onPressed: findBMI,
                      color: Colors.black26,
                      child: Text('Calculate BMI',
                          style: TextStyle(
                              fontSize: fontSize, color: Colors.black87))),
                ),
               GetBuilder<BmiController>(
                            builder: (_) =>  Text(bmiController.validation() ?
                  bmiController.findBMI(): bmiController.errMessage,
                  style: TextStyle(color: bmiController.validation() ? Colors.black : Colors.red),
                )
            )
              ],
            ),
          ),
        ));
  }

  void toggleMeasure(value) {
    if (value == 0) {
      bmiController.isMetric = true;
      bmiController.isImperial = false;
    } else {
      bmiController.isMetric = false;
      bmiController.isImperial = true;
    }
    setState(() {
      bmiController.isSelected = [
        bmiController.isMetric,
        bmiController.isImperial
      ];
    });
  }

  void findBMI() {
    bmiController.findBMI();
    print("error1 "+bmiController.errMessage);
    //   double bmi = 0;
    //   double height = double.tryParse(txtHeight.text) ?? 0;
    //   double weight = double.tryParse(txtWeight.text) ?? 0;

    //   if (isMetric) {
    //     bmi = weight / (height * height);
    //   } else {
    //     bmi = weight * 703 / (height * height);
    //   }

    //   setState(() {
    //     if (txtWeight.text.isEmpty || txtHeight.text.isEmpty) {
    //       validate == false;
    //       result = 'Fields Can\'t Be Empty';
    //     } else {
    //       validate == true;
    //       result = 'Your BMI is ${bmi.toStringAsFixed(2)}';
    //     }
    //     const DialogExample();
    //   });
    //   print('validate state: ${validate}');
  }
}

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
