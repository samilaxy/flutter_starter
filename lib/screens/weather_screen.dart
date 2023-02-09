import 'package:flutter/material.dart';
import 'package:flutter_starter/data/weather.dart';
import '../shared/menu_drawer.dart';
import '../shared/menu_bottom.dart';
import '../data/http_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
//import 'package:weather_icons/weather_icons.dart';
//import 'package:location/location.dart';
//import 'GetLocation.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController txtPlace = TextEditingController();
  Weather result = Weather('-- --', '-- --', 0, 0, 0, '03d', '', '');

  String icon_url = 'http://openweathermap.org/img/w/';

  // Formatted Date
  var now = (DateFormat.yMMMEd().format(DateTime.now())).toString();
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather', style: TextStyle(color: Colors.white70)),
        backgroundColor: Colors.grey,
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white24,
              image: DecorationImage(
                image: AssetImage('assets/mountain.jpeg'),
                fit: BoxFit.cover,
              )),
          child: ListView(
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: TextField(
                      onEditingComplete: getData,
                      cursorColor: Colors.white54,
                      controller: txtPlace,
                      decoration: InputDecoration(
                          hintText: 'Enter city..',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20),
                          labelStyle: TextStyle(color: Colors.white60),
                          hintStyle: TextStyle(color: Colors.white54),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: const BorderSide(
                                  color: Colors.white38, width: 2.0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: const BorderSide(
                                  color: Colors.white38, width: 2.0)),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(30)),
                          suffixIcon: IconButton(
                              color: Colors.white54,
                              onPressed: getData,
                              icon: const Icon(Icons.search))))),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.black26,
                    ),
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(children: [
                        Text(now,
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontFamily: 'Roboto',
                                shadows: [
                                  Shadow(
                                      offset: Offset(1.0, 1.0),
                                      blurRadius: 2.0,
                                      color: Colors.black)
                                ])),
                        SizedBox(
                          height: 70,
                          child: Image.network(result.icon),
                          // width: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Text(
                            '${result.name} ${result.temperature.toStringAsFixed(0)}°',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontFamily: 'Roboto',
                                shadows: [
                                  Shadow(
                                      offset: Offset(1.0, 1.0),
                                      blurRadius: 2.0,
                                      color: Colors.black)
                                ]),
                          ),
                        )
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
                        color: Colors.black26,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20, top: 10),
                        child: Column(children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Center(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Text('Today',
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontFamily: 'Roboto',
                                              shadows: [
                                                Shadow(
                                                    offset: Offset(1.0, 1.0),
                                                    blurRadius: 2.0,
                                                    color: Colors.black)
                                              ])),
                                    ),
                                    flex: 3,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 30,
                                      child: SizedBox(
                                        child: Image.network(result.icon),
                                        height: 40,
                                      ),
                                    ),
                                    flex: 3,
                                  ),
                                  Expanded(
                                    child: Text(
                                        result.description.capitalized(),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontFamily: 'Roboto',
                                            shadows: [
                                              Shadow(
                                                  offset: Offset(1.0, 1.0),
                                                  blurRadius: 2.0,
                                                  color: Colors.black)
                                            ])),
                                    flex: 5,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const Divider(thickness: 1.5),
                          weatherRow(
                              'Temperature ',
                              '${result.temperature.toStringAsFixed(0)}°C',
                              FontAwesomeIcons.temperatureLow),
                          weatherRow(
                              'Percieved ',
                              result.percieved.toStringAsFixed(2),
                              FontAwesomeIcons
                                  .personWalkingDashedLineArrowRight),
                          weatherRow('Pressure ', result.pressure.toString(),
                              Icons.wb_sunny_rounded),
                          weatherRow('Humidity ', result.humidity.toString(),
                              FontAwesomeIcons.waveSquare),
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
      result = await helper.getWeather(location);
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
          child: Icon(icon, color: Colors.white54, size: 30.0),
          flex: 2,
        ),
        Expanded(
          child: Center(
            child: Text(label,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                    shadows: [
                      Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 2.0,
                          color: Colors.black)
                    ])),
          ),
          flex: 4,
        ),
        Expanded(
          child: Text(value,
              style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  color: Colors.white70,
                  shadows: [
                    Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 2.0,
                        color: Colors.black)
                  ])),
          flex: 2,
        )
      ]));

  return row;
}

//getLocation
// void getLocation() async {
//   Getlocation getlocation = getLocation();
//   await getlocation.getCurrentLocation();

//   print(getlocation.latitude);
//   print(getlocation.longitude);
//   print(getlocation.city);
//   city = getlocation.city;
//   getTemp(getlocation.latitude, getlocation.longitude);
// }
extension Capitalized on String {
  String capitalized() =>
      this.substring(0, 1).toUpperCase() + this.substring(1).toLowerCase();
}
