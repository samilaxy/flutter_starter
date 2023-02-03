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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black12),
                  onPressed: getdata,
                  child:
                      const Text('Get Data', style: TextStyle(fontSize: 18))),
            ),
            Text(result.name)
          ],
        ),
      ),
    );
  }

  Future getdata() async {
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather('Tema');
    setState(() {});
  }
}
