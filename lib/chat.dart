import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class Chat extends StatelessWidget {
  var c = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    var x;
    func() async {
      var url = "http://192.168.43.222/cgi-bin/web.py?x=$x";
      var r = await http.get(url);
      print(r);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Firebase"),
          leading: Icon(Icons.home),
        ),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: TextField(
                    onChanged: (value) {
                      x = value;
                    },
                  ),
                ),
                Card(
                    child: RaisedButton(
                  child: Text("Submit"),
                  onPressed: func,
                )),
                Card(
                  child: RaisedButton(
                      child: Text("Recieve Data"),
                      onPressed: () async {
                        var d = await c.collection("student").get();
                        for (var i in d.docs) print(i.data());
                        print("Hello 1...");
                      }),
                ),
                Card(
                  child: RaisedButton(
                      child: Text("Send Data"),
                      onPressed: () {
                        c.collection("student").add({
                          'name': 'sulabh',
                          'mob': 6373638,
                          'gender': 'male',
                        });
                        print("Hello 2...");
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
