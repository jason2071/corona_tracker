import 'package:corona_tracker/constants.dart';
import 'package:corona_tracker/size_config.dart';
import 'package:flutter/material.dart';

class CaeseCard extends StatelessWidget {
  const CaeseCard({
    Key key,
    this.title,
    this.totalCaese,
    this.newCases,
    this.iconData,
    this.color,
    this.numberColor = Colors.white,
  }) : super(key: key);

  final String title;
  final int totalCaese, newCases;
  final IconData iconData;
  final Color color, numberColor;

  @override
  Widget build(BuildContext context) {
    double sw = SizeConfig.screenWidth;
    double sh = SizeConfig.screenHeight;

    return Container(
      width: sw * 0.43,
      height: sh * 0.15,
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: color,
        boxShadow: [kShadow],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Spacer(),
          Row(
            children: [
              Text(
                totalCaese.toString(),
                style: TextStyle(
                  color: numberColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 10),
              if (newCases != null)
                Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Icon(
                    iconData,
                    color: numberColor,
                    size: 20,
                  ),
                ),
              if (newCases != null)
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    newCases.toString(),
                    style: TextStyle(
                      color: numberColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
