
import 'currentweather.dart';

class Weather {
   double? latitude;
   double? longitude;
   CurrentWeather? currentWeather;

 Weather({

    this.latitude,
    this.longitude,
    this.currentWeather

 });

  Weather.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    currentWeather = (json['current_weather'] != null
        ? new CurrentWeather.fromJson(json['current_weather'])
        : null)!;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    if (this.currentWeather != null) {
      data['current_weather'] = this.currentWeather!.toJson();
    }
    return data;
  }
}