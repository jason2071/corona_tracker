import 'package:corona_tracker/models/country.dart';
import 'package:corona_tracker/models/coutry_info.dart';

class CountriesArgument {
  CountryInfo countryInfo;
  String country;

  CountriesArgument({this.countryInfo, this.country});
}

CountriesArgument countriesArgument = CountriesArgument();
