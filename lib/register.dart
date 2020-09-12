import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatelessWidget {

  var c = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var tec1 = TextEditingController();
    var tec2 = TextEditingController();
    var email;
    var passw;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.input),
        title: Text("Registration"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              margin: EdgeInsets.all(25.0),
              child: TextField(
                controller: tec1,
                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(400),
                  ),
                ),
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
              ),
            ),
            Card(
              margin: EdgeInsets.all(25.0),
              child: TextField(
                controller: tec2,
                decoration: InputDecoration(
                  icon: Icon(Icons.keyboard_hide),
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(400),
                  ),
                ),
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  passw = value;
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Material(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.lime[900],
              child: MaterialButton(
                elevation: 5,
                onPressed: () async {
                  tec1.clear();
                  tec2.clear();
                  var d = await c.createUserWithEmailAndPassword(
                      email: email, password: passw);
                  Navigator.pushNamed(context, "login");
                  print(email);
                  print(passw);
                  print(d);
                },
                child: Text(
                  "Register",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
