import 'package:flutter/material.dart';
//import 'package:myapp/get_api.dart';
//import 'package:myapp/get_api2.dart';
import 'package:myapp/get_api3.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('실시간 미세먼지 현황',
          style: TextStyle(fontSize: 15, color: Colors.black87),),
          backgroundColor: Colors.white,
        ),
        body: DisplayAirQuality()
      )
    );
  }
}

class DisplayAirQuality extends StatefulWidget {
  const DisplayAirQuality({Key? key}) : super(key: key);

  @override
  State<DisplayAirQuality> createState() => _DisplayAirQualityState();
}

class _DisplayAirQualityState extends State<DisplayAirQuality> {
  late Future<List<Items>>futureAirquality;

  @override
  void initState(){
    super.initState();
    futureAirquality=fetchAirquality();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Items>>(
        future: futureAirquality,
        builder: (context, snapshot){
          if (snapshot.hasData){
            return Column(
              children: [...snapshot.data!.map((e)=>SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 4,
                  child: Text(e.pm10Value.toString()),
                ),
              ))],
            );
          }else if(snapshot.hasError){
            return Text('에러발생 : ${snapshot.hasError} \n 발생에러 : ${snapshot.error}' );
          }
          return const CircularProgressIndicator();
        });
  }
}

