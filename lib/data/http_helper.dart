import 'dart:io';
import 'package:flutter_starter/data/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper {
//11eba8bb941dd6ed614b3014924cfb60
//https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=11eba8bb941dd6ed614b3014924cfb60

  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = '11eba8bb941dd6ed614b3014924cfb60';
  Weather weather = Weather('', '', 0, 0, 0, '03d', '', '');

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appid': apiKey};
    Uri uri = Uri.https(authority, path, parameters);

    // http.Response result = await http.get(uri);

    //  Map<String, dynamic> data = jsonDecode(result.body);
    // Weather weather = Weather.fromJson(data);

    try {
      http.Response result = await http.get(uri);
      Map<String, dynamic> data = jsonDecode(result.body);
      if (result.statusCode != 200) {
        throw HttpException('${result.statusCode}');
      }

      weather = Weather.fromJson(data);
      print(weather);
    } on SocketException {
      print('No Internet connection 😑');
    } on HttpException {
      print("Couldn't find the post 😱");
    } on FormatException {
      print("Bad response format 👎");
    }

    return weather;
  }
}
