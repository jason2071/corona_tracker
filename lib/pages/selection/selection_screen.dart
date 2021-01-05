import 'package:corona_tracker/constants.dart';
import 'package:corona_tracker/models/countries.dart';
import 'package:corona_tracker/models/countries_argument.dart';
import 'package:corona_tracker/models/coutry_info.dart';
import 'package:corona_tracker/services/country_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SelectionScreen extends StatefulWidget {
  static const routeName = '/selection_screen';

  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  final TextEditingController _typeAheadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search Country",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Container(
          decoration: BoxDecoration(),
          child: TypeAheadFormField(
            textFieldConfiguration: TextFieldConfiguration(
              decoration: InputDecoration(
                labelText: 'Country',
                border: InputBorder.none,
              ),
              controller: this._typeAheadController,
            ),
            suggestionsCallback: (pattern) {
              return CountryService.getSuggestions2(pattern);
            },
            itemBuilder: (context, CountriesArgument suggestion) {
              return ListTile(
                tileColor: Colors.white,
                title: Text(suggestion.country),
              );
            },
            transitionBuilder: (context, suggestionsBox, controller) {
              return suggestionsBox;
            },
            onSuggestionSelected: (CountriesArgument suggestion) {
              this._typeAheadController.text = suggestion.country;
              Navigator.of(context).pop(suggestion);
            },
          ),
        ),
      ),
    );
  }
}
