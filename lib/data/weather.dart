class Weather {
  String name = '';
  String description = '';
  double temperature = 0;
  double percieved = 0;
  int pressure = 0;
  int humidity = 0;
  String icon = '';
  String cod = '';
  String message = '';

  Weather(this.name, this.description, this.temperature, this.percieved,
      this.pressure, this.icon, this.cod, this.message);

  Weather.fromJson(Map<String, dynamic> weatherMap) {
    this.name = weatherMap['name'];
    this.temperature = (weatherMap['main']['temp'] - 273.15) ?? 0;
    this.percieved = (weatherMap['main']['feels_like']) ?? 0;
    this.pressure = (weatherMap['main']['pressure']) ?? 0;
    this.description = (weatherMap['weather'][0]['description']) ?? '';
    this.icon = (weatherMap['weather'][0]['icon']);
   // this.cod = weatherMap['cod'];
   // this.message = weatherMap['massage'];
   // print(cod);
  }
}
