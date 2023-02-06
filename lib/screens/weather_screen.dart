import 'package:flutter/material.dart';
import 'package:flutter_starter/data/weather.dart';
import '../shared/menu_drawer.dart';
import '../shared/menu_bottom.dart';
import '../data/http_helper.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController txtPlace = TextEditingController();
  Weather result = Weather('', '', 0, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white30,
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white24,
              image: DecorationImage(
                image: AssetImage('assets/cloud.jpeg'),
                fit: BoxFit.cover,
              )),
          child: ListView(
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: TextField(
                      controller: txtPlace,
                      decoration: InputDecoration(
                          hintText: 'Enter city..',
                          suffixIcon: IconButton(
                              onPressed: getData,
                              icon: const Icon(Icons.search))))),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.black12,
                      // image: DecorationImage(
                      //   image: AssetImage('assets/cloud.jpeg'),
                      //   fit: BoxFit.cover,
                      // )
                    ),
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(children: [
                        Icon(Icons.cloud, color: Colors.blueGrey, size: 100.0),
                        Text(result.description,
                            style: const TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                shadows: [
                                  Shadow(
                                      offset: Offset(1.0, 1.0),
                                      blurRadius: 2.0,
                                      color: Colors.white)
                                ]))
                      ]),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.black12,
                      ),
                      //color: Colors.black12,
                      // height: 350,
                      // width: 300,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Column(children: [
                          weatherRow(
                              'Temperature ',
                              result.temperature.toStringAsFixed(0) + '°C',
                              Icons.cloud),
                          weatherRow(
                              'Percieved ',
                              result.percieved.toStringAsFixed(2),
                              Icons.waterfall_chart_sharp),
                          weatherRow('Pressure ', result.pressure.toString(),
                              Icons.access_alarm),
                          weatherRow('Humidity ', result.humidity.toString(),
                              Icons.access_alarm)
                        ]),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future getData() async {
    String location = txtPlace.text;
    if (location.isNotEmpty) {
      HttpHelper helper = HttpHelper();
      result = await helper.getWeather(txtPlace.text);
    }
    setState(() {});
  }
}

Widget weatherRow(String label, String value, IconData icon) {
  //IconData iconTep =  'Icons.${iconTep}'+ iconTep;
  Widget row = Padding(
      padding: EdgeInsets.all(16),
      child: Row(children: [
        Expanded(
          child: Icon(icon, color: Colors.indigoAccent, size: 40.0),
          flex: 2,
        ),
        Expanded(
          child: Center(
            child: Text(label,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    shadows: [
                      Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 2.0,
                          color: Colors.white)
                    ])),
          ),
          flex: 4,
        ),
        Expanded(
          child: Text(value,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 2.0,
                        color: Colors.white)
                  ])),
          flex: 2,
        )
      ]));

  return row;
}
