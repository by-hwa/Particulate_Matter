import 'package:flutter/material.dart';
//import 'package:myapp/get_api.dart';
//import 'package:myapp/get_api2.dart';
import 'package:myapp/get_api3.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:convert';
import 'package:myapp/draw_linechart.dart';

void main() {
  Future<List<Items>> fa = fetchAirquality();
  List<int?> pm10val = [];
  fa.then((val) {val.map((e) => pm10val.add(int?.tryParse(e.pm10Value.toString())));});
  print(pm10val);
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
              children: [Text("미세먼지 10"),LineChart1(),Text("미세먼지 20"),LineChart1()],
            );
          }else if(snapshot.hasError){
            return Text('에러발생 : ${snapshot.hasError} \n 발생에러 : ${snapshot.error}' );
          }
          return const CircularProgressIndicator();
        });
  }
}


/*
Column(
              children: [...snapshot.data!.map((e)=>SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 4,
                  child: Text("${e.pm10Value}"),
                ),
              ))],
            );

ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (contexts, index));
 */
