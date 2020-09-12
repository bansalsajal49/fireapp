import 'package:fireapp/chat.dart';
import 'package:fireapp/camera.dart';
import 'package:fireapp/login.dart';
import 'package:fireapp/register.dart';
import 'package:fireapp/scroll.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:splashscreen/splashscreen.dart';

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
    initialRoute: "splash",
    routes: {
      "splash": (context) => MyApp(),
      "home": (context) => MyHome(),
      "scroll": (context) => MyScroll(),
      "register": (context) => Register(),
      "chat": (context) => Chat(),
      "login": (context) => Login(),
      "camera": (context) => Cam(),
    },
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 14,
        navigateAfterSeconds: new AfterSplash(),
        title: new Text(
          'Welcome In SplashScreen',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        image: new Image.network(
            'https://github.com/bansalsajal49/fireapp/blob/master/assets/mng1.png?raw=true'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print("Flutter Egypt"),
        loaderColor: Colors.red);
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHome();
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, "camera")),
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.screen_share),
              onPressed: () => Navigator.pushNamed(context, "scroll"))
        ],
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
