import 'package:http/http.dart' as http;

class HttpHelper {
//11eba8bb941dd6ed614b3014924cfb60
//https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=11eba8bb941dd6ed614b3014924cfb60

  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = '11eba8bb941dd6ed614b3014924cfb60';

  Future<String> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appid': apiKey};
    Uri uri = Uri.https(authority, path, parameters);
    http.Response result = await http.get(uri);
    return result.body;
  }
}
