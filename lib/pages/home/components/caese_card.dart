import 'package:corona_tracker/constants.dart';
import 'package:corona_tracker/size_config.dart';
import 'package:corona_tracker/utils/format_decimal.dart';
import 'package:flutter/material.dart';

class CaeseCard extends StatefulWidget {
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
  _CaeseCardState createState() => _CaeseCardState();
}

class _CaeseCardState extends State<CaeseCard> {
  double sw = SizeConfig.screenWidth;
  double sh = SizeConfig.screenHeight;
  double fontDynamicSize = 30;

  @override
  void initState() {
    super.initState();
    int totalCasesLength = widget.totalCaese.toString().length;

    if (totalCasesLength >= 7) {
      fontDynamicSize = 20;
    } else if (totalCasesLength >= 5) {
      fontDynamicSize = 22;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sw * 0.46,
      height: sh * 0.15,
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: widget.color,
        boxShadow: [kShadow],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
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
                formatDecimal(widget.totalCaese),
                style: TextStyle(
                  color: widget.numberColor,
                  fontSize: fontDynamicSize,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 10),
              if (widget.newCases != null)
                Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Icon(
                    widget.iconData,
                    color: widget.numberColor,
                    size: 20,
                  ),
                ),
              if (widget.newCases != null)
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    formatDecimal(widget.newCases),
                    style: TextStyle(
                      color: widget.numberColor,
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
