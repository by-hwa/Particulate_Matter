import 'package:flutter/material.dart';
import 'package:myapp/page/chart.dart';
//import 'package:myapp/get_api.dart';
//import 'package:myapp/get_api2.dart';
import 'package:myapp/get_api3.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:convert';
import 'package:myapp/draw_linechart.dart';
import 'package:myapp/page/loading.dart';
import 'package:myapp/page/todaypm.dart';

void main() {
  // Future<List<int>> pm10val = get_pm10val();
  // pm10val.then((val) {print('pm10val : ${val}');});
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Particulate matter App",
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0x818CD7FF),
        fontFamily: 'regular',
      ),
      home: loading(),
      routes: {
        chartpage.page_id: (context) => chartpage(),
        todaypm.page_id: (context) => todaypm(),
      },
    );
  }
}

/*
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
              children: [Text("미세먼지 10"),LineChart1(type: 'pm10val',),Text("미세먼지 20"),],
            );
          }else if(snapshot.hasError){
            return Text('에러발생 : ${snapshot.hasError} \n 발생에러 : ${snapshot.error}' );
          }
          return const CircularProgressIndicator();
        });
  }
}

 */



/*
Future<List<int>> get_pm10val() async{
  List<Items> fa = await fetchAirquality();
  List<int> pm10val = [];
  // fa.map((e) => pm10val.add(int?.tryParse(e.pm10Value.toString())));
  pm10val = fa.map((e) => int.parse(e.pm10Value.toString() ?? '0')).toList();
  return pm10val;
}

 */

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
