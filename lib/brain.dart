import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

// const apikey = '065a9f57a03f4ce897dfa1356aa2ba99';

class Brainiac {
  Future<List<DataforCard>> getLatestEntrydata() async {
     DataforCard actualData = DataforCard(
       id: "", Date_Time: "", SensorTiltX:null  , SensorTiltY:null , SensorTiltZ:null , SensorAlert: null, PM01:null , PM10:null , PM25:null, Temprature:null , Humidity:null , SoilMoisture:null 
       );
    final response = await http.get(
      Uri.parse('https://env-station-backend.herokuapp.com/backend/LatestEntry/'), );
      List<DataforCard> newsitems = [];

      if (response.statusCode == 200) {

        actualData = DataforCard.fromJson(jsonDecode(response.body));

        newsitems.add(actualData);
      }
      else {
        print("Something Wrong has happened");
      }
    return newsitems;
  }



  Future<List<DataforCard>> getAlldata() async {
     DataforCard actualData = DataforCard(
       id: "", Date_Time: "", SensorTiltX:null  , SensorTiltY:null , SensorTiltZ:null , SensorAlert: null, PM01:null , PM10:null , PM25:null, Temprature:null , Humidity:null , SoilMoisture:null 
       );
    final response = await http.get(
      Uri.parse('https://env-station-backend.herokuapp.com/backend/AllData/'), );
      List<DataforCard> newsitems = [];
      print(response.body); 
      if (response.statusCode == 200) {
         List<dynamic> data = json.decode(response.body);
         data.forEach((element) {
           actualData = DataforCard.fromJson(element);
           newsitems.add(actualData);
         });
      }
      else {
        print("Something Wrong has happened");
      }
    print(newsitems);
    return newsitems;
  }



  Future<String> DeleteExcessEntries() async {
    
    final response = await http.delete(
      Uri.parse('https://env-station-backend.herokuapp.com/backend/DeleteExcessEntries/'), );

      if (response.statusCode == 200) {
          getAlldata();
         getLatestEntrydata();
         print(response.body);
         return response.body;
      }
      else {
        return "Something Wrong has happened";
      }
  }

  Future<String> ScrapeNewEntries() async {
    
    final response = await http.post(
      Uri.parse('https://env-station-backend.herokuapp.com/backend/NewEntries/'), );

      if (response.statusCode == 200) {
         getAlldata();
         getLatestEntrydata();
         print(response.body);
         return response.body;

      }
      else {
        return "Something Wrong has happened";
      }
  }
}

class DataforCard {
  final String id;
  final String Date_Time;
  final double SensorTiltX;
  final double SensorTiltY;
  final double SensorTiltZ;
  final String SensorAlert;
  final double PM01;
  final double PM25;
  final double PM10;
  final double Temprature;
  final double Humidity;
  final double SoilMoisture;

  DataforCard({
    @required this.id, 
    @required this.Date_Time,
    @required this.SensorTiltX, 
    @required this.SensorTiltY,
    @required this.SensorTiltZ, 
    @required this.SensorAlert, 
    @required this.PM01,
    @required this.PM25, 
    @required this.PM10,
    @required this.Temprature, 
    @required this.Humidity, 
    @required this.SoilMoisture
  });

  factory DataforCard.fromJson(Map<String, dynamic> json){
     return DataforCard(
          id : json['id'],
          Date_Time: json['DateTime'],
          SensorTiltX: json['SensorTiltX'],
          SensorTiltY: json['SensorTiltY'],
          SensorTiltZ: json['SensorTiltZ'],
          SensorAlert: json['SensorAlert'],
          PM01: json['PM01'],
          PM25: json['PM25'],
          PM10: json['PM10'],
          Temprature: json['Temprature'],
          Humidity: json['Humidity'],
          SoilMoisture: json['SoilMoisture'],
     );
   }

}
