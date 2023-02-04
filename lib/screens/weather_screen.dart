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
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                    controller: txtPlace,
                    decoration: InputDecoration(
                        hintText: 'Enter city..',
                        suffixIcon: IconButton(
                            onPressed: getData,
                            icon: const Icon(Icons.search))))),
            Container(
                color: Colors.white24,
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Column(children: [
                    Icon(Icons.cloud, color: Colors.indigoAccent, size: 100.0),
                    Text(result.description,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.grey))
                  ]),
                )),
            Container(
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
                        'Temperature ', result.temperature.toStringAsFixed(2)),
                    weatherRow(
                        'Percieved ', result.percieved.toStringAsFixed(2)),
                    weatherRow('Pressure ', result.pressure.toString()),
                    weatherRow('Humidity ', result.humidity.toString())
                  ]),
                ))
          ],
        ),
      ),
    );
  }

  Future getData() async {
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather(txtPlace.text);
    setState(() {});
  }
}

Widget weatherRow(String label, String value) {
  //IconData iconTep =  'Icons.${iconTep}'+ iconTep;
  Widget row = Padding(
      padding: EdgeInsets.all(16),
      child: Row(children: [
        Expanded(
          child: Icon(Icons.cloud, color: Colors.indigoAccent, size: 40.0),
          flex: 2,
        ),
        Expanded(
          child: Center(
            child: Text(label,
                style: const TextStyle(fontSize: 20, color: Colors.black)),
          ),
          flex: 4,
        ),
        Expanded(
          child: Text(value,
              style: const TextStyle(fontSize: 20, color: Colors.black)),
          flex: 2,
        )
      ]));

  return row;
}
