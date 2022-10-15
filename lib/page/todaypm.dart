import 'package:flutter/material.dart';
import 'package:myapp/get_api3.dart';
import 'package:myapp/page/chart.dart';


class todaypm extends StatefulWidget {
  const todaypm({Key? key}) : super(key: key);

  static const String page_id = "todaypm";

  @override
  State<todaypm> createState() => _todaypmState();
}

class _todaypmState extends State<todaypm> {
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
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(45),
          child: AppBar(
            title: Row(
                children: [Icon(Icons.air,size: 30, color: Colors.black,),
                  Text(' Particulate Matter now',
                    style: TextStyle(fontSize: 25, fontFamily: 'bold', color: Colors.black87),)
                  ,]),
            backgroundColor: Colors.white,
          ),
        ),
      body: _buildbody(),
      ),
    );
  }

  Widget _buildbody(){
    return FutureBuilder(
        future: pmval,
        builder: (context, snapshot){
          if (snapshot.hasData){
            return ListView(
              padding: const EdgeInsets.all(8),
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(8, 10, 8, 15),
                  child: Text("Today's pm10 value", style: TextStyle(fontSize: 30, fontFamily: 'bold'),),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(8, 5, 8, 10),
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 60,
                  alignment: Alignment(0,0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    border: Border.all(width: 1, color: Colors.cyan),
                  ),
                  child: Text("${snapshot.data![0].last}", style: TextStyle(fontSize: 25, fontFamily: 'bold'),),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(8, 10, 8, 15),
                  child: Text("Today's pm25 value", style: TextStyle(fontSize: 30, fontFamily: 'bold'),),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(8, 5, 8, 10),
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 60,
                  alignment: Alignment(0,0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    border: Border.all(width: 1, color: Colors.cyan),
                  ),
                  child: Text("${snapshot.data![2].last}", style: TextStyle(fontSize: 25, fontFamily: 'bold'),),
                ),
                Container(
                  margin: EdgeInsets.zero,
                  alignment: Alignment.topRight,
                  child: TextButton(
                    child: Text("자세히 보기", style: TextStyle(color: Colors.black45),),
                    onPressed: () {
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) => chartpage()));
                    },
                  ),
                )
              ],
            );
          }
          return _loading();
        });
  }

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

