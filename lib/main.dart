import 'package:covid_tracker/AboutPage.dart';
import 'package:covid_tracker/Homepage.dart';
import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.red[600],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red[600],
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (ctx) => Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(Icons.info),
                onPressed: () {
                  print("hello");
                  Navigator.push(
                    ctx,
                    MaterialPageRoute(builder: (ctx) => AboutPage()),
                  );
                },
              ),
            ],
            toolbarHeight: 65,
            title: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "COVID-19 Tracker",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 27,
                    ),
                  ),
                  Text(
                    "Powered by the COVID19 API",
                    style: TextStyle(
                      fontSize: 11,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
          body: Homepage(),
        ),
      ),
    );
  }
}
