import 'package:corona_tracker/constants.dart';
import 'package:corona_tracker/size_config.dart';
import 'package:corona_tracker/utils/format_decimal.dart';
import 'package:flutter/material.dart';

class TableContentRow extends StatelessWidget {
  const TableContentRow({
    Key key,
    this.title,
    this.confirmed,
    this.recovered,
    this.active,
    this.deaths,
  }) : super(key: key);

  final String title;
  final int confirmed, recovered, active, deaths;

  @override
  Widget build(BuildContext context) {
    double sw = SizeConfig.screenWidth;

    return Padding(
      padding: EdgeInsets.only(top: kDefaultPadding / 2),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            width: sw * 0.16,
            child: Center(
              child: Text(
                confirmed == 0 ? "-" : formatDecimal(confirmed),
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(
            width: sw * 0.16,
            child: Center(
              child: Text(
                recovered == 0 ? "-" : formatDecimal(recovered),
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(
            width: sw * 0.15,
            child: Center(
              child: Text(
                active == 0 ? "-" : formatDecimal(active),
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(
            width: sw * 0.15,
            child: Center(
              child: Text(
                deaths == 0 ? "-" : formatDecimal(deaths),
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
