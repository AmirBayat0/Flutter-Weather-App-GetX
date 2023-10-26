class LocationData {
  String? country;
  String? regionName;
  double? lat;
  double? lon;

  LocationData({this.country, this.regionName});

  LocationData.fromJson(Map<String, dynamic> json) {
    country = json['country'] as String;
    regionName = json['regionName'] as String;
    lat = json['lat'] as double;
    lon = json['lon'] as double;
  }
}
