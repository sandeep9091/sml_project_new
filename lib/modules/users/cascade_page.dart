import 'package:flutter/material.dart';


class CascadingDropdownExample extends StatefulWidget {
  @override
  _CascadingDropdownExampleState createState() =>
      _CascadingDropdownExampleState();
}

class _CascadingDropdownExampleState extends State<CascadingDropdownExample> {
  String selectedCountry = '';
  String selectedState = '';
  String selectedCity = '';

  // Sample data
  List<String> countries = ['Country1', 'Country2'];
  Map<String, List<String>> states = {
    'Country1': ['State1', 'State2'],
    'Country2': ['State3', 'State4'],
  };
  Map<String, List<String>> cities = {
    'State1': ['City1', 'City2'],
    'State2': ['City3', 'City4'],
    'State3': ['City5', 'City6'],
    'State4': ['City7', 'City8'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cascading Dropdown Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedCountry.isNotEmpty ? selectedCountry : null,
              hint: Text('Select Country'),
              onChanged: (value) {
                setState(() {
                  selectedCountry = value!;
                  selectedState = '';
                  selectedCity = '';
                });
              },
              items: countries.map((country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              value: selectedState.isNotEmpty ? selectedState : null,
              hint: Text('Select State'),
              onChanged: (value) {
                setState(() {
                  selectedState = value!;
                  selectedCity = '';
                });
              },
              items: states[selectedCountry]?.map((state) {
                return DropdownMenuItem<String>(
                  value: state,
                  child: Text(state),
                );
              }).toList() ?? [],
            ),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              value: selectedCity.isNotEmpty ? selectedCity : null,
              hint: Text('Select City'),
              onChanged: (value) {
                setState(() {
                  selectedCity = value!;
                });
              },
              items: cities[selectedState]?.map((city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList() ?? [],
            ),
          ],
        ),
      ),
    );
  }
}
