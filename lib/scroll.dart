import 'package:flutter/material.dart';

class MyScroll extends StatefulWidget {
  @override
  _MyScrollState createState() => _MyScrollState();
}

class _MyScrollState extends State<MyScroll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scroll View"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.black,
            ),
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.amber,
            ),
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.blue,
            ),
            Container(width: double.infinity, height: 100, color: Colors.green),
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.orange,
            ),
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.black,
            ),
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.brown,
            ),
          ],
        ),
      ),
    );
  }
}
