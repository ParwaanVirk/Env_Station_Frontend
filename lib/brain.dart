import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// const apikey = '065a9f57a03f4ce897dfa1356aa2ba99';

class Brainiac {
  int totalresults;

  Future<List<DataforCard>> getdata() async {

    // getting data from api
    var gottendata = await http.get(
        'url_comes_here');

    // converting into json format
    var gottendatatojson = json.decode(gottendata.body);

    // no of toplested articles form a particaular source
    totalresults = gottendatatojson['totalResults'];

    List<DataforCard> newsitems = [];
    
    // filling each articale in a list called newsitems
    for (int i = 0; i < totalresults; i++) {
      DataforCard user = DataforCard(
          gottendatatojson['id'],
          gottendatatojson['DateTime'],
          gottendatatojson['SensorTiltX'],
          gottendatatojson['SensorTiltY'],
          gottendatatojson['SensorTiltZ'],
          gottendatatojson['SensorAlert'],
          gottendatatojson['PM01'],
          gottendatatojson['PM25'],
          gottendatatojson['PM10'],
          gottendatatojson['Temprature'],
          gottendatatojson['Humidity'],
          gottendatatojson['SoilMoisture'],

          );

      newsitems.add(user);
    }
    
    // return the list
    return newsitems;
  }
}

class DataforCard {
  final String id;
  final String DateTime;
  final String SensortTiltx;
  final String SensorTiltY;
  final String SensorTiltZ;
  final String SensorAlert;
  final String PM01;
  final String PM25;
  final String PM10;
  final String Temprature;
  final String Humidity;
  final String SoilMoisture;




  DataforCard(
    this.id, 
    this.DateTime,
    this.SensortTiltx, 
    this.SensorTiltY,
    this.SensorTiltZ, 
    this.SensorAlert, 
    this.PM01,
    this.PM25, 
    this.PM10,
    this.Temprature, 
    this.Humidity, 
    this.SoilMoisture
  );
}
