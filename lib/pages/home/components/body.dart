import 'package:corona_tracker/constants.dart';
import 'package:corona_tracker/models/api_response.dart';
import 'package:corona_tracker/models/countries_argument.dart';
import 'package:corona_tracker/models/country.dart';
import 'package:corona_tracker/pages/home/components/background_container.dart';
import 'package:corona_tracker/pages/home/components/caese_card.dart';
import 'package:corona_tracker/pages/home/components/country_list.dart';
import 'package:corona_tracker/pages/home/components/table_title_row.dart';
import 'package:corona_tracker/pages/selection/selection_screen.dart';
import 'package:corona_tracker/services/home_service.dart';
import 'package:corona_tracker/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  HomeService get service => GetIt.I<HomeService>();
  APIResponse _apiResponse;
  bool _isLoading = false;
  Country _country;
  String iso3 = 'tha';

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  void _fetchData() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await service.getCountry(iso3);
    if (!_apiResponse.error) {
      _country = _apiResponse.data;
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _receiveCountry(value) {
    CountriesArgument argument = value;
    iso3 = argument.countryInfo.iso3;
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      child: AnimatedSwitcher(
        duration: kAnimationDuration,
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Text(
                      "Covid-19 Tracker",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SelectionScreen.routeName)
                          .then((value) {
                        if (value != null) {
                          _receiveCountry(value);
                        }
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPadding,
                        vertical: 8,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                _country.countryInfo.flag,
                                fit: BoxFit.cover,
                                width: 35,
                                height: 35,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: SizeConfig.screenWidth * 0.7,
                            ),
                            child: Text(
                              _country.country,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: SvgPicture.asset(
                              "assets/icons/icon_arrow_down.svg",
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Text(
                      "Latest update 1 hour ago",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        CaeseCard(
                          title: "Comfirmed",
                          totalCaese: _country.cases,
                          newCases: _country.todayCases,
                          iconData: Icons.arrow_upward,
                          color: Color(0xFFFFB259),
                        ),
                        CaeseCard(
                          title: "Active",
                          totalCaese: _country.active,
                          color: Color(0xFF4DB5FF),
                        ),
                        CaeseCard(
                          title: "Recovered",
                          totalCaese: _country.recovered,
                          newCases: _country.todayRecovered,
                          iconData: Icons.arrow_upward,
                          color: Color(0xFF4CD97B),
                        ),
                        CaeseCard(
                          title: "Deathed",
                          totalCaese: _country.deaths,
                          newCases: _country.todayDeaths,
                          iconData: Icons.arrow_upward,
                          color: Color(0xFFFF5959),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: kDefaultPadding),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: TableTitleRow(),
                  ),
                  Expanded(
                    child: CountryList(),
                  ),
                ],
              ),
      ),
    );
  }
}
