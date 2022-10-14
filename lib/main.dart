import 'package:flutter/material.dart';
//import 'package:myapp/get_api.dart';
//import 'package:myapp/get_api2.dart';
import 'package:myapp/get_api3.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:convert';
import 'package:myapp/draw_linechart.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: Text('실시간 미세먼지 현황',
          style: TextStyle(fontSize: 15, color: Colors.black87),),
          backgroundColor: Colors.white,
        ),
        body: drawline()

      )
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

class drawline extends StatefulWidget {
  const drawline({Key? key}) : super(key: key);

  @override
  State<drawline> createState() => _drawlineState();
}

class _drawlineState extends State<drawline> {
  // late Future<List<Items>>futureAirquality;
  late Future<List<List<int>>> pmval;


  @override
  void initState(){
    super.initState();
    pmval = get_pmval();
  }

  Future<List<List<int>>> get_pmval() async{
    List<Items> fa = await fetchAirquality();
    List<int> pm10val = [];
    List<int> pm10val24 = [];
    List<int> pm25val = [];
    List<int> pm25val24 = [];

    pm10val = fa.map((e) => (int.tryParse(e.pm10Value.toString())) ?? 0).toList();
    pm10val24 = fa.map((e) => (int.tryParse(e.pm10Value24.toString())) ?? 0).toList();
    pm25val = fa.map((e) => (int.tryParse(e.pm25Value.toString())) ?? 0).toList();
    pm25val24 = fa.map((e) => (int.tryParse(e.pm10Value.toString())) ?? 0).toList();

    List<List<int>> pmval = [pm10val,  pm10val24, pm25val, pm25val24];

    print('print pmval : ${pmval}');

    return pmval;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: pmval,
      builder: (context, snapshot){
        if (snapshot.hasData){
          return Column(
            children: [
              Text("pm10val"),
              LineChart1(val : snapshot.data![0]),
              Text("pm10val24"),
              LineChart1(val : snapshot.data![1]),
              Text("pm25val"),
              LineChart1(val : snapshot.data![2]),
              Text("pm25val24"),
              LineChart1(val : snapshot.data![3])
            ],
          );
        }
        return Text("loading...");
      });
    }
  }


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
