import 'package:geolocator/geolocator.dart';


 getPosition()  async {
   bool ser;
   LocationPermission per;
   ser = await Geolocator.isLocationServiceEnabled();
   if (!ser) {
     return Future.error('Location services are disabled.');
   }

   per = await Geolocator.checkPermission();
   if (per == LocationPermission.denied) {
     per = await Geolocator.requestPermission();
     if (per == LocationPermission.always) {
       return await Geolocator.getCurrentPosition();

     }
   }
   return await Geolocator.getCurrentPosition();
 }