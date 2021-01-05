import 'package:corona_tracker/constants.dart';
import 'package:corona_tracker/models/api_response.dart';
import 'package:corona_tracker/models/countries.dart';
import 'package:corona_tracker/pages/home/components/table_content_row.dart';
import 'package:corona_tracker/services/home_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CountryList extends StatefulWidget {
  const CountryList({
    Key key,
  }) : super(key: key);

  @override
  _CountryListState createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  HomeService get service => GetIt.I<HomeService>();
  APIResponse _apiResponse;
  bool _isLoading = false;

  @override
  void initState() {
    if (countriesList.length == 0) {
      _fetchData();
    }
    super.initState();
  }

  void _fetchData() async {
    setState(() {
      _isLoading = true;
    });
    _apiResponse = await service.getCountries();
    countriesList = _apiResponse.data;

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : SafeArea(
            top: false,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                ),
                child: Column(
                  children: [
                    ...List.generate(
                      countriesList.length,
                      (index) {
                        Countries _item = countriesList[index];
                        return TableContentRow(
                          title: _item.country,
                          confirmed: _item.cases,
                          recovered: _item.recovered,
                          active: _item.active,
                          deaths: _item.deaths,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
