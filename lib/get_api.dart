import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class get_api{
  String Api_Key = "6RVOGGZcTp3G0jdog5E8DjFgsN3hd8p2nauoISfqMn9uJG+yvF4cKkdkDWKJONMQ9pqLGIHQoL3igJsqWTUyPQ==";
  String Api_Key2 = "6RVOGGZcTp3G0jdog5E8DjFgsN3hd8p2nauoISfqMn9uJG%2ByvF4cKkdkDWKJONMQ9pqLGIHQoL3igJsqWTUyPQ%3D%3D";

  Uri uri = Uri.parse('http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty?sidoName=서울&pageNo=1&numOfRows=100&returnType=json&serviceKey=${Api_Key2}&ver=1.1');

  Future<List<AirQuality>> fetchAirQuality() async {
    final response = await http.get(uri);
    return compute(parseAirQuality, response.body);
  }

  List<AirQuality> parseAirQuality(String responseBody) {
    print(responseBody);
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<AirQuality>((json) => AirQuality.fromJson(json)).toList();
  }
}

class AirQuality{
  final String pm10Value;
  final String pm10Value24;
  final String pm25Value;
  final String pm25Value24;

  AirQuality({
    required this.pm10Value,
    required this.pm10Value24,
    required this.pm25Value,
    required this.pm25Value24,
  });

  factory AirQuality.fromJson(Map<String, dynamic> json){
    return AirQuality(
      pm10Value: json['pm10Value'] as String,
      pm10Value24: json['pm10Value24'] as String,
      pm25Value: json['pm25Value'] as String,
      pm25Value24: json['pm25Value24'] as String,
    );
  }
}