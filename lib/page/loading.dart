import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/page/chart.dart';
import 'package:myapp/page/todaypm.dart';

class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  static const String page_id = "loading";
  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {

  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => todaypm()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody()
    );
  }

  Widget _buildBody(){
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
