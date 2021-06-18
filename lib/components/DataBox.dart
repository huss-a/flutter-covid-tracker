import 'package:flutter/material.dart';

import 'package:covid_tracker/typedefs/CovidData.dart';

class DataBox extends StatefulWidget {
  final String casesOrDeaths;
  final CovidData covidData;
  final String currentCountry;
  DataBox(
      {required this.casesOrDeaths,
      required this.covidData,
      required this.currentCountry});
  @override
  _DataBoxState createState() => _DataBoxState();
}

class _DataBoxState extends State<DataBox> {
  String _addCommas(int n) {
    return n.toString().replaceAll(RegExp(r"\B(?=(\d{3})+(?!\d))"),
        ","); // regex for adding commas to nums
  }

  bool checkIfCases() {
    return widget.casesOrDeaths == "cases";
  }

  Map checkCountryAndReturnData() {
    if (widget.currentCountry == "Global")
      return widget.covidData.Global;
    else {
      return widget.covidData.Countries
          .firstWhere((c) => c["Country"] == widget.currentCountry);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.red[200]),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 50,
            vertical: 30,
          ),
          child: Column(
            children: [
              Text(
                checkIfCases() ? "Cases" : "Deaths",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Total ",
                    style:
                        TextStyle(fontSize: 22.5, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    _addCommas(checkCountryAndReturnData()[
                        widget.casesOrDeaths == "cases"
                            ? "TotalConfirmed"
                            : "TotalDeaths"]),
                    style: TextStyle(fontSize: 22.5),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.5,
                    ),
                  ),
                  Text(
                    _addCommas(checkCountryAndReturnData()[
                        widget.casesOrDeaths == "cases"
                            ? "NewConfirmed"
                            : "NewDeaths"]),
                    style: TextStyle(fontSize: 22.5),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
