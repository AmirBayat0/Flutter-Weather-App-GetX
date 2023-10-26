class WeatherData {
  int? temp;

  WeatherData({this.temp});

  WeatherData.fromJson(dynamic json) {
    // ignore: avoid_dynamic_calls
    final tempInKelvin = json['main']['temp'] as double;
    temp = (tempInKelvin - 273.15).round();
  }
}
