import 'package:corona_tracker/models/countries.dart';
import 'package:corona_tracker/models/countries_argument.dart';

class CountryService {
  static final List<String> cities = [
    'Beirut',
    'Damascus',
    'San Fransisco',
    'Rome',
    'Los Angeles',
    'Madrid',
    'Bali',
    'Barcelona',
    'Paris',
    'Bucharest',
    'New York City',
    'Philadelphia',
    'Sydney',
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = [];
    matches.addAll(cities);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  static List<CountriesArgument> getSuggestions2(String query) {
    List<CountriesArgument> matches = [];
    for (var item in countriesList) {
      matches.add(
        CountriesArgument(
          country: item.country,
          countryInfo: item.countryInfo,
        ),
      );
    }

    matches.retainWhere(
      (s) => s.country.toLowerCase().contains(query.toLowerCase()),
    );

    return matches;
  }
}
