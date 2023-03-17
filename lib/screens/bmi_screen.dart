import 'package:flutter/material.dart';
import 'package:flutter_starter/controllers/bmi_controller.dart';
import 'package:flutter_starter/shared/menu_bottom.dart';
import 'package:flutter_starter/shared/menu_drawer.dart';
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
  String result = '';
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
                ToggleButtons(
                    isSelected: bmiController.isSelected,
                    onPressed: toggleMeasure,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: Text('Metric',
                              style: TextStyle(fontSize: fontSize))),
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
                          hintText: heightMessage,
                          fillColor: Colors.black,
                          focusedBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.5)))),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextField(
                      controller: bmiController.weight,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: weightMessage,
                        focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.5)),
                        //  errorText: bmiController.validate ? null : 'Fields Can\'t Be Empty'
                      )),
                ),
                GetBuilder<BmiController>(
                    builder: (_) => Text(
                          bmiController.validate
                              ? ''
                              : bmiController.errMessage,
                             // textAlign ,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 12),
                        )),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: ElevatedButton(
                        onPressed: findBMI,
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateColor.resolveWith((states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.blueGrey;
                              }
                              return Colors.grey;
                            }),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)))),
                        child: const Text('Find BMI',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16))),
                  ),
                ),
                GetBuilder<BmiController>(
                    builder: (_) => Text(
                          bmiController.validate ? result : "",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ))
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
    result = bmiController.findBMI();
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
