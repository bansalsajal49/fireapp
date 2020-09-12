import 'package:fireapp/chat.dart';
import 'package:fireapp/camera.dart';
import 'package:fireapp/login.dart';
import 'package:fireapp/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    theme: ThemeData(
        backgroundColor: Colors.lime[200],
        appBarTheme: AppBarTheme(
          color: Colors.lime[900],
        )),
    debugShowCheckedModeBanner: false,
    initialRoute: "home",
    routes: {
      "home": (context) => MyHome(),
      "register": (context) => Register(),
      "chat": (context) => Chat(),
      "login": (context) => Login(),
      "camera": (context) => Cam(),
    },
  ));
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, "camera")),
      appBar: AppBar(
        backgroundColor: Colors.lime[900],
        leading: Icon(Icons.home),
        title: Text("MEETnGREET"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/mng.png'), fit: BoxFit.fill),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                  color: Colors.lime[200],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: MaterialButton(
                    color: Colors.transparent,
                    elevation: 200.0,
                    minWidth: 250.0,
                    height: 60,
                    child: Text(
                      "Login",
                      textScaleFactor: 2,
                      style: TextStyle(),
                    ),
                    onPressed: () => Navigator.pushNamed(context, "login"),
                  )),
              SizedBox(
                height: 60.0,
              ),
              Material(
                  color: Colors.lime[200],
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: MaterialButton(
                    color: Colors.transparent,
                    elevation: 200.0,
                    minWidth: 250.0,
                    height: 60,
                    child: Text(
                      "Register",
                      textScaleFactor: 2,
                    ),
                    onPressed: () => Navigator.pushNamed(context, "register"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
