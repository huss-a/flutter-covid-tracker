import 'package:flutter/material.dart';

import 'package:covid_tracker/components/CustomButton.dart';

class CountrySelector extends StatefulWidget {
  final List<dynamic> countries;
  final Function(String) countryChangeCallback;
  final String currentCountry;
  CountrySelector(this.countries, this.countryChangeCallback, this.currentCountry);

  @override
  _CountrySelectorState createState() => _CountrySelectorState();
}

class _CountrySelectorState extends State<CountrySelector> {
  String? _selectedCountry;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton(
          style: TextStyle(fontSize: 18.0, color: Colors.black),
          iconEnabledColor: Colors.red[900],
          value: _selectedCountry,
          items: widget.countries.map((c) {
            return DropdownMenuItem(
              value: c["Country"],
              child: Text(
                c["Country"],
              ),
              onTap: () {},
            );
          }).toList(),
          hint: Text("Global"),
          onChanged: (value) {
            widget.countryChangeCallback(value.toString());
            setState(() => _selectedCountry = value.toString());
            print(value);
          },
        ),
        if (_selectedCountry != null)
          CustomButton(
            onPressed: () {
              widget.countryChangeCallback("Global");
              setState(() => _selectedCountry = null);
            },
            text: "Clear Selection",
          ),
      ],
    );
  }
}
