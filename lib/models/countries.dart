import 'dart:convert';

import 'coutry_info.dart';

List<Countries> countriesFromJson(String str) =>
    List<Countries>.from(json.decode(str).map((x) => Countries.fromJson(x)));

String countriesToJson(List<Countries> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Countries {
  Countries({
    this.updated,
    this.country,
    this.countryInfo,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.todayRecovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.tests,
    this.testsPerOneMillion,
    this.population,
    this.continent,
    this.oneCasePerPeople,
    this.oneDeathPerPeople,
    this.oneTestPerPeople,
    this.activePerOneMillion,
    this.recoveredPerOneMillion,
    this.criticalPerOneMillion,
  });

  int updated;
  String country;
  CountryInfo countryInfo;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int todayRecovered;
  int active;
  int critical;
  int casesPerOneMillion;
  double deathsPerOneMillion;
  int tests;
  int testsPerOneMillion;
  int population;
  String continent;
  int oneCasePerPeople;
  int oneDeathPerPeople;
  int oneTestPerPeople;
  double activePerOneMillion;
  double recoveredPerOneMillion;
  double criticalPerOneMillion;

  factory Countries.fromJson(Map<String, dynamic> json) => Countries(
        updated: json["updated"],
        country: json["country"],
        countryInfo: CountryInfo.fromJson(json["countryInfo"]),
        cases: json["cases"],
        todayCases: json["todayCases"],
        deaths: json["deaths"],
        todayDeaths: json["todayDeaths"],
        recovered: json["recovered"],
        todayRecovered: json["todayRecovered"],
        active: json["active"],
        critical: json["critical"],
        casesPerOneMillion: json["casesPerOneMillion"],
        deathsPerOneMillion: json["deathsPerOneMillion"].toDouble(),
        tests: json["tests"],
        testsPerOneMillion: json["testsPerOneMillion"],
        population: json["population"],
        continent: json["continent"],
        oneCasePerPeople: json["oneCasePerPeople"],
        oneDeathPerPeople: json["oneDeathPerPeople"],
        oneTestPerPeople: json["oneTestPerPeople"],
        activePerOneMillion: json["activePerOneMillion"].toDouble(),
        recoveredPerOneMillion: json["recoveredPerOneMillion"].toDouble(),
        criticalPerOneMillion: json["criticalPerOneMillion"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "updated": updated,
        "country": country,
        "countryInfo": countryInfo.toJson(),
        "cases": cases,
        "todayCases": todayCases,
        "deaths": deaths,
        "todayDeaths": todayDeaths,
        "recovered": recovered,
        "todayRecovered": todayRecovered,
        "active": active,
        "critical": critical,
        "casesPerOneMillion": casesPerOneMillion,
        "deathsPerOneMillion": deathsPerOneMillion,
        "tests": tests,
        "testsPerOneMillion": testsPerOneMillion,
        "population": population,
        "continent": continent,
        "oneCasePerPeople": oneCasePerPeople,
        "oneDeathPerPeople": oneDeathPerPeople,
        "oneTestPerPeople": oneTestPerPeople,
        "activePerOneMillion": activePerOneMillion,
        "recoveredPerOneMillion": recoveredPerOneMillion,
        "criticalPerOneMillion": criticalPerOneMillion,
      };
}

List<Countries> countriesList = [];
