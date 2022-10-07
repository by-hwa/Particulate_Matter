import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



String _ApiKey = "6RVOGGZcTp3G0jdog5E8DjFgsN3hd8p2nauoISfqMn9uJG+yvF4cKkdkDWKJONMQ9pqLGIHQoL3igJsqWTUyPQ==";
String _ApiKey2 = "6RVOGGZcTp3G0jdog5E8DjFgsN3hd8p2nauoISfqMn9uJG%2ByvF4cKkdkDWKJONMQ9pqLGIHQoL3igJsqWTUyPQ%3D%3D";

Uri uri = Uri.parse(
    'http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty?sidoName=서울&pageNo=1&numOfRows=100&returnType=json&serviceKey=${_ApiKey2}&ver=1.1');


Future<List<Items>> fetchAirquality() async {
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    return (jsonDecode(response.body) as List)
        .map((e) => Items.fromJson(e))
        .toList();
  } else {
    throw Exception('Failed to load data');
  }
}



class Response {
  Body? body;
  Header? header;

  Response({this.body, this.header});

  Response.fromJson(Map<String, dynamic> json) {
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
    header =
    json['header'] != null ? new Header.fromJson(json['header']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.body != null) {
      data['body'] = this.body!.toJson();
    }
    if (this.header != null) {
      data['header'] = this.header!.toJson();
    }
    return data;
  }
}

class getAir {
  Response? response;

  getAir({this.response});

  getAir.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class Body {
  int? totalCount;
  List<Items>? items;
  int? pageNo;
  int? numOfRows;

  Body({this.totalCount, this.items, this.pageNo, this.numOfRows});

  Body.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    pageNo = json['pageNo'];
    numOfRows = json['numOfRows'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['pageNo'] = this.pageNo;
    data['numOfRows'] = this.numOfRows;
    return data;
  }
}

class Items {
  String? so2Grade;
  String? coFlag;
  String? khaiValue;
  String? so2Value;
  String? coValue;
  String? pm10Flag;
  String? o3Grade;
  String? pm10Value;
  String? khaiGrade;
  String? sidoName;
  String? no2Flag;
  String? no2Grade;
  String? o3Flag;
  String? so2Flag;
  String? dataTime;
  String? coGrade;
  String? no2Value;
  String? stationName;
  String? pm10Grade;
  String? o3Value;

  Items(
      {this.so2Grade,
        this.coFlag,
        this.khaiValue,
        this.so2Value,
        this.coValue,
        this.pm10Flag,
        this.o3Grade,
        this.pm10Value,
        this.khaiGrade,
        this.sidoName,
        this.no2Flag,
        this.no2Grade,
        this.o3Flag,
        this.so2Flag,
        this.dataTime,
        this.coGrade,
        this.no2Value,
        this.stationName,
        this.pm10Grade,
        this.o3Value});

  Items.fromJson(Map<String, dynamic> json) {
    so2Grade = json['so2Grade'];
    coFlag = json['coFlag'];
    khaiValue = json['khaiValue'];
    so2Value = json['so2Value'];
    coValue = json['coValue'];
    pm10Flag = json['pm10Flag'];
    o3Grade = json['o3Grade'];
    pm10Value = json['pm10Value'];
    khaiGrade = json['khaiGrade'];
    sidoName = json['sidoName'];
    no2Flag = json['no2Flag'];
    no2Grade = json['no2Grade'];
    o3Flag = json['o3Flag'];
    so2Flag = json['so2Flag'];
    dataTime = json['dataTime'];
    coGrade = json['coGrade'];
    no2Value = json['no2Value'];
    stationName = json['stationName'];
    pm10Grade = json['pm10Grade'];
    o3Value = json['o3Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['so2Grade'] = this.so2Grade;
    data['coFlag'] = this.coFlag;
    data['khaiValue'] = this.khaiValue;
    data['so2Value'] = this.so2Value;
    data['coValue'] = this.coValue;
    data['pm10Flag'] = this.pm10Flag;
    data['o3Grade'] = this.o3Grade;
    data['pm10Value'] = this.pm10Value;
    data['khaiGrade'] = this.khaiGrade;
    data['sidoName'] = this.sidoName;
    data['no2Flag'] = this.no2Flag;
    data['no2Grade'] = this.no2Grade;
    data['o3Flag'] = this.o3Flag;
    data['so2Flag'] = this.so2Flag;
    data['dataTime'] = this.dataTime;
    data['coGrade'] = this.coGrade;
    data['no2Value'] = this.no2Value;
    data['stationName'] = this.stationName;
    data['pm10Grade'] = this.pm10Grade;
    data['o3Value'] = this.o3Value;
    return data;
  }
}

class Header {
  String? resultMsg;
  String? resultCode;

  Header({this.resultMsg, this.resultCode});

  Header.fromJson(Map<String, dynamic> json) {
    resultMsg = json['resultMsg'];
    resultCode = json['resultCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resultMsg'] = this.resultMsg;
    data['resultCode'] = this.resultCode;
    return data;
  }
}