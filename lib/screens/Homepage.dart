import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:covid_tracker/components/CustomButton.dart';
import 'package:covid_tracker/components/CountrySelector.dart';
import 'package:covid_tracker/components/DataBox.dart';
import 'package:covid_tracker/components/LocationTitle.dart';
import 'package:covid_tracker/typedefs/CovidData.dart';

Future<CovidData> fetchData() async {
  final res = await http.get(Uri.parse("https://api.covid19api.com/summary"));
  if (res.statusCode == 200) {
    return CovidData.fromJson(jsonDecode(res.body));
  } else {
    print("err");
    throw Exception("Error");
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<CovidData> _covidData = fetchData();
  late String _currentCountry = "Global";

  void runFuture() {
    _covidData = fetchData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Center(
          child: FutureBuilder(
            future: _covidData,
            builder: (ctx, snap) {
              Widget child;
              if (snap.hasData &&
                  snap.connectionState == ConnectionState.done) {
                child = AnimatedContainer(
                  key: ValueKey(1),
                  duration: const Duration(milliseconds: 700),
                  child: Column(
                    children: [
                      LocationTitle(_currentCountry,
                          DateTime.tryParse((snap.data as CovidData).Date)!),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: DataBox(
                          casesOrDeaths: "cases",
                          covidData: snap.data as CovidData,
                          currentCountry: _currentCountry,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: DataBox(
                          casesOrDeaths: "deaths",
                          covidData: snap.data as CovidData,
                          currentCountry: _currentCountry,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 30,
                        ),
                        child: CountrySelector(
                            (snap.data as CovidData).Countries,
                            (value) => setState(() => _currentCountry = value),
                            _currentCountry,
                        ),
                      ),
                      CustomButton(
                        onPressed: runFuture,
                        text: "Update Data",
                      ),
                    ],
                  ),
                );
              } else if (snap.hasError) {
                print(snap.error);
                print(snap.stackTrace);
                child = Text(
                  "snap err " + snap.error.toString(),
                  key: ValueKey(2),
                );
              } else
                child = SizedBox(
                  key: ValueKey(3),
                  height: 150,
                  width: 150,
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.red[300],
                    valueColor: AlwaysStoppedAnimation<Color?>(
                      Colors.red[900],
                    ),
                    strokeWidth: 2.5,
                  ),
                );
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 900),
                child: child,
              );
            },
          ),
        ),
      ),
    );
  }
}
