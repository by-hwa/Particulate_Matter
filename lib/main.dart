import 'package:flutter/material.dart';
import 'package:myapp/get_api.dart';



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
        body: Align(
          alignment: Alignment.topCenter ,
          child: Container(
            width: double.infinity, height: double.infinity,
            // color: Colors.yellow,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.yellow,
              border: Border.all(color: Colors.black)
            )
            child: Text("HI");,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
            children: [Icon(Icons.phone),
            Icon(Icons.message),
            Icon(Icons.contact_page)],
          ),
        )
        ),
      )
    );
  }
}

class  extends StatelessWidget {
  const ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
