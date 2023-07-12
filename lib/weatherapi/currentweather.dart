class CurrentWeather {
  double? temperature;
  double? windspeed;
  String? time;

  CurrentWeather({
         this.temperature,
        this.windspeed,
         this.time});

  CurrentWeather.fromJson(Map<String, dynamic> json) {
    temperature = json['temperature'];
    windspeed = json['windspeed'];

    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temperature'] = this.temperature;
    data['windspeed'] = this.windspeed;
    data['time'] = this.time;
    return data;
  }
}