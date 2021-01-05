import 'dart:convert';
import 'package:corona_tracker/models/api_response.dart';
import 'package:corona_tracker/models/countries.dart';
import 'package:corona_tracker/models/country.dart';
import 'package:http/http.dart' as http;

class HomeService {
  static const API = 'https://disease.sh/v3/covid-19';

  Future<APIResponse<Country>> getCountry(String iso3) {
    return http.get(API + "/countries/$iso3?strict=true").then((data) {
      if (data.statusCode == 200) {
        final body = utf8.decode(data.bodyBytes);
        final jsonDecode = json.decode(body);
        final response = Country.fromJson(jsonDecode);
        return APIResponse<Country>(data: response);
      } else {
        return APIResponse<Country>(
          error: true,
          errorMessage: 'An error occurred',
        );
      }
    }).catchError((_) {
      print(_.toString());

      return APIResponse<Country>(
        error: true,
        errorMessage: 'An error occurred',
      );
    });
  }

  Future<APIResponse<List<Countries>>> getCountries() {
    return http.get(API + '/countries').then((data) {
      if (data.statusCode == 200) {
        final body = utf8.decode(data.bodyBytes);
        final jsonDecode = json.decode(body);

        final response = <Countries>[];

        for (var item in jsonDecode) {
          response.add(Countries.fromJson(item));
        }

        return APIResponse<List<Countries>>(data: response);
      } else {
        return APIResponse<List<Countries>>(
          error: true,
          errorMessage: 'An error occurred',
        );
      }
    }).catchError((e) {
      return APIResponse<List<Countries>>(
        error: true,
        errorMessage: 'An error occurred',
      );
    });
  }
}
