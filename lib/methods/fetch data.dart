


import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:untitled/const.dart';
import 'package:untitled/weatherapi/weather.dart';




final dio = Dio();

  getdata() async {
    var cl = await Geolocator.getCurrentPosition() ;
  Response response;
  response = await dio.get(
    'https://api.open-meteo.com/v1/forecast',
    queryParameters: {'latitude': '${cl.latitude}' , 'longitude':'${cl.longitude}' , 'current_weather' : true },
  );
  print(response.data.toString());
  weatherclass = Weather.fromJson(response.data);
  return weatherclass;
}