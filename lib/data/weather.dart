import 'dart:ffi';

class Weather {
  String name = '';
  String description = '';
  double temperature = 0;
  double percieved = 0;
  int pressure = 0;
  int humidity = 0;

  Weather(this.name, this.description, this.temperature, this.percieved,
      this.pressure, this.humidity);
}
