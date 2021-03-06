import 'package:corona_tracker/constants.dart';
import 'package:corona_tracker/models/countries_argument.dart';
import 'package:corona_tracker/services/country_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _typeAheadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Container(
        margin: EdgeInsets.only(top: kDefaultPadding),
        decoration: BoxDecoration(
          border: Border.all(color: kSecondaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TypeAheadFormField(
          textFieldConfiguration: TextFieldConfiguration(
            autofocus: true,
            decoration: InputDecoration(
              hintText: "Search by country",
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            ),
            controller: this._typeAheadController,
          ),
          suggestionsCallback: (pattern) {
            return CountryService.getSuggestions2(pattern);
          },
          itemBuilder: (context, CountriesArgument suggestion) {
            return Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        suggestion.countryInfo.flag,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    suggestion.country,
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            );
          },
          noItemsFoundBuilder: (context) {
            return Container(
              color: Colors.white,
              height: 50,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Text(
                "No Items Found!",
                style: TextStyle(
                  color: Theme.of(context).errorColor,
                  fontSize: 18,
                ),
              ),
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
    );
  }
}
