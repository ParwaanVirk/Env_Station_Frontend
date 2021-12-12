import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

// const apikey = '065a9f57a03f4ce897dfa1356aa2ba99';

class Brainiac {
  Future<List<DataforCard>> getLatestEntrydata() async {
     DataforCard actualData = DataforCard(
       id: "", dateTime: "", sensorTiltX:null  , sensorTiltY:null , sensorTiltZ:null , sensorAlert: null, pM01:null , pM10:null , pM25:null, temprature:null , humidity:null , soilMoisture:null 
   
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
       id: "", dateTime: "", sensorTiltX:null  , sensorTiltY:null , sensorTiltZ:null , sensorAlert: null, pM01:null , pM10:null , pM25:null, temprature:null , humidity:null , soilMoisture:null 
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
    // print(newsitems);
    return newsitems;
  }



  Future<String> deleteExcessEntries() async {
    
    final response = await http.delete(
      Uri.parse('https://env-station-backend.herokuapp.com/backend/DeleteExcessEntries/'), );

      if (response.statusCode == 200) {
          print("Delete Function ran Successfully");
          print(response.body);
          // getAlldata();
          // getLatestEntrydata();   
         return response.body;
      }
      else {
        return "Something Wrong occurred";
      }
  }

  Future<String> scrapeNewEntries() async {
    
    final response = await http.post(
      Uri.parse('https://env-station-backend.herokuapp.com/backend/NewEntries/'), );

      if (response.statusCode == 200) {
        print("refresh function ran successfully");
        //  getAlldata();
        //  getLatestEntrydata();
         print(response.body);
         return response.body; 

      }
      else {
        return "Something Wrong occurred";
      }
  }
}

class DataforCard {
  final String id;
  final String dateTime;
  final double sensorTiltX;
  final double sensorTiltY;
  final double sensorTiltZ;
  final String sensorAlert;
  final double pM01;
  final double pM25;
  final double pM10;
  final double temprature;
  final double humidity;
  final double soilMoisture;

  DataforCard({
    @required this.id, 
    @required this.dateTime,
    @required this.sensorTiltX, 
    @required this.sensorTiltY,
    @required this.sensorTiltZ, 
    @required this.sensorAlert, 
    @required this.pM01,
    @required this.pM25, 
    @required this.pM10,
    @required this.temprature, 
    @required this.humidity, 
    @required this.soilMoisture
  });

  factory DataforCard.fromJson(Map<String, dynamic> json){
     return DataforCard(
          id : json['id'],
          dateTime: json['DateTime'],
          sensorTiltX: json['SensorTiltX'],
          sensorTiltY: json['SensorTiltY'],
          sensorTiltZ: json['SensorTiltZ'],
          sensorAlert: json['SensorAlert'],
          pM01: json['PM01'],
          pM25: json['PM25'],
          pM10: json['PM10'],
          temprature: json['Temprature'],
          humidity: json['Humidity'],
          soilMoisture: json['SoilMoisture'],
     );
   }

}
