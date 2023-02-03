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
            weatherRow('Place: ', result.name),
            weatherRow('Description: ', result.description),
            weatherRow('Temperature: ', result.temperature.toStringAsFixed(2)),
            weatherRow('Percieved: ', result.percieved.toStringAsFixed(2)),
            weatherRow('Pressure: ', result.pressure.toString())
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
  Widget row = Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(children: [
        Expanded(
          child: Text(label,
              style: const TextStyle(fontSize: 20, color: Colors.black12)),
          flex: 3,
        ),
        Expanded(
          child: Text(value,
              style: const TextStyle(fontSize: 20, color: Colors.black12)),
          flex: 4,
        )
      ]));

  return row;
}
