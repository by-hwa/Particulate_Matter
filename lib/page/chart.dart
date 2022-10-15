import 'package:flutter/material.dart';
import 'package:myapp/draw_linechart.dart';
import 'package:myapp/get_api3.dart';
import 'package:myapp/page/loading.dart';
import 'package:myapp/page/todaypm.dart';


class chartpage extends StatefulWidget {
  const chartpage({Key? key}) : super(key: key);

  static const String page_id = "chartpage";

  @override
  State<chartpage> createState() => _chartpageState();
}

class _chartpageState extends State<chartpage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(45),
              child: AppBar(
                title: Row(
                  children: [Icon(Icons.bar_chart,size: 30, color: Colors.black,),
                    Text(' Particulate Matter detail',
                      style: TextStyle(fontSize: 25, fontFamily: 'bold', color: Colors.black87),)
                  ,]),
                backgroundColor: Colors.white,
              ),
            ),
            body: drawline()

        )
    );
  }
}




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
            return ListView(
              padding: const EdgeInsets.all(15),
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(8,5,8,15) ,
                  child: Text("pm10 value graph", style: TextStyle(fontSize: 20, fontFamily: 'bold', ),),
                ),
                LineChart1(val : snapshot.data![0]),
                Container(
                  margin: EdgeInsets.fromLTRB(8,15,8,15) ,
                  child: Text("pm10 value 24 avg graph", style: TextStyle(fontSize: 20, fontFamily: 'bold', ),),
                ),
                LineChart1(val : snapshot.data![1]),
                Container(
                  margin: EdgeInsets.fromLTRB(8,15,8,15) ,
                  child: Text("pm25 value graph", style: TextStyle(fontSize: 20, fontFamily: 'bold', ),),
                ),
                LineChart1(val : snapshot.data![2]),
                Container(
                  margin: EdgeInsets.fromLTRB(8,15,8,15) ,
                  child: Text("pm25 value 24 avg graph", style: TextStyle(fontSize: 20, fontFamily: 'bold', ),),
                ),
                LineChart1(val : snapshot.data![3]),
                Container(
                  margin: EdgeInsets.zero,
                  alignment: Alignment.topRight,
                  child: TextButton(
                    child: Text("되돌아가기", style: TextStyle(color: Colors.black45),),
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => todaypm()));
                    },
                  ),
                )
              ],
            );
          }
          return _loading();
        });
  }
  // Column(
  // children: [
  // Text("pm10val"),
  // LineChart1(val : snapshot.data![0]),
  // Text("pm10val24"),
  // LineChart1(val : snapshot.data![1]),
  // Text("pm25val"),
  // LineChart1(val : snapshot.data![2]),
  // Text("pm25val24"),
  // LineChart1(val : snapshot.data![3])
  // ],
  // )
  Widget _loading(){
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
                text: TextSpan(
                    text: "P",
                    style: TextStyle(fontFamily: 'bold', color: Colors.black, fontSize: 40,),
                    children: [
                      TextSpan(
                          text: "articulate",
                          style: TextStyle(fontFamily: 'bold', color: Colors.black38, fontSize: 32)
                      ),
                      TextSpan(
                          text: "M",
                          style: TextStyle(fontFamily: 'bold', color: Colors.black, fontSize: 40)
                      ),
                      TextSpan(
                          text: "atter",
                          style:  TextStyle(fontFamily: 'bold', color: Colors.black38, fontSize: 32)
                      )
                    ]
                )
            ),
            Text(
              "Particulate matter information provider",
              style: TextStyle(fontFamily: 'regular', fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
