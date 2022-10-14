import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



String _ApiKey = "6RVOGGZcTp3G0jdog5E8DjFgsN3hd8p2nauoISfqMn9uJG+yvF4cKkdkDWKJONMQ9pqLGIHQoL3igJsqWTUyPQ==";
String _ApiKey2 = "6RVOGGZcTp3G0jdog5E8DjFgsN3hd8p2nauoISfqMn9uJG%2ByvF4cKkdkDWKJONMQ9pqLGIHQoL3igJsqWTUyPQ%3D%3D";
String station_name = "종로구";

Uri uri = Uri.parse(
    'http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getMsrstnAcctoRltmMesureDnsty?stationName=${station_name}&dataTerm=month&pageNo=1&numOfRows=100&returnType=json&serviceKey=$_ApiKey2&ver=1.1');



Future<List<Items>> fetchAirquality() async {
  final response = await http.get(uri);

  print(uri);
  // print('${jsonDecode(response.body)['response']['body']['items']}');
  if (response.statusCode == 200) {
    return (jsonDecode(response.body)['response']['body']['items'] as List)
        .map((e) => Items.fromJson(e))
        .toList();
  } else {
    throw Exception('Failed to load data');
  }
}




class Items {
  String? pm10Value24;
  String? so2Value;
  String? pm10Value;
  String? o3Grade;
  String? pm25Flag;
  String? khaiGrade;
  String? pm25Value;
  String? no2Flag;
  String? stationName;
  String? no2Value;
  String? so2Grade;
  String? coFlag;
  String? khaiValue;
  String? coValue;
  String? pm10Flag;
  String? sidoName;
  String? pm25Value24;
  String? no2Grade;
  String? o3Flag;
  String? pm25Grade;
  String? so2Flag;
  String? coGrade;
  String? dataTime;
  String? pm10Grade;
  String? o3Value;

  Items(
      {this.pm10Value24,
        this.so2Value,
        this.pm10Value,
        this.o3Grade,
        this.pm25Flag,
        this.khaiGrade,
        this.pm25Value,
        this.no2Flag,
        this.stationName,
        this.no2Value,
        this.so2Grade,
        this.coFlag,
        this.khaiValue,
        this.coValue,
        this.pm10Flag,
        this.sidoName,
        this.pm25Value24,
        this.no2Grade,
        this.o3Flag,
        this.pm25Grade,
        this.so2Flag,
        this.coGrade,
        this.dataTime,
        this.pm10Grade,
        this.o3Value});

  Items.fromJson(Map<String, dynamic> json) {
    pm10Value24 = json['pm10Value24'];
    so2Value = json['so2Value'];
    pm10Value = json['pm10Value'];
    o3Grade = json['o3Grade'];
    pm25Flag = json['pm25Flag'];
    khaiGrade = json['khaiGrade'];
    pm25Value = json['pm25Value'];
    no2Flag = json['no2Flag'];
    stationName = json['stationName'];
    no2Value = json['no2Value'];
    so2Grade = json['so2Grade'];
    coFlag = json['coFlag'];
    khaiValue = json['khaiValue'];
    coValue = json['coValue'];
    pm10Flag = json['pm10Flag'];
    sidoName = json['sidoName'];
    pm25Value24 = json['pm25Value24'];
    no2Grade = json['no2Grade'];
    o3Flag = json['o3Flag'];
    pm25Grade = json['pm25Grade'];
    so2Flag = json['so2Flag'];
    coGrade = json['coGrade'];
    dataTime = json['dataTime'];
    pm10Grade = json['pm10Grade'];
    o3Value = json['o3Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pm10Value24'] = this.pm10Value24;
    data['so2Value'] = this.so2Value;
    data['pm10Value'] = this.pm10Value;
    data['o3Grade'] = this.o3Grade;
    data['pm25Flag'] = this.pm25Flag;
    data['khaiGrade'] = this.khaiGrade;
    data['pm25Value'] = this.pm25Value;
    data['no2Flag'] = this.no2Flag;
    data['stationName'] = this.stationName;
    data['no2Value'] = this.no2Value;
    data['so2Grade'] = this.so2Grade;
    data['coFlag'] = this.coFlag;
    data['khaiValue'] = this.khaiValue;
    data['coValue'] = this.coValue;
    data['pm10Flag'] = this.pm10Flag;
    data['sidoName'] = this.sidoName;
    data['pm25Value24'] = this.pm25Value24;
    data['no2Grade'] = this.no2Grade;
    data['o3Flag'] = this.o3Flag;
    data['pm25Grade'] = this.pm25Grade;
    data['so2Flag'] = this.so2Flag;
    data['coGrade'] = this.coGrade;
    data['dataTime'] = this.dataTime;
    data['pm10Grade'] = this.pm10Grade;
    data['o3Value'] = this.o3Value;
    return data;
  }
}