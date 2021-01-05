import 'package:corona_tracker/size_config.dart';
import 'package:flutter/material.dart';

class TableTitleRow extends StatelessWidget {
  const TableTitleRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sw = SizeConfig.screenWidth;

    return Row(
      children: [
        Expanded(
            child: Text(
          "State/UT",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        )),
        SizedBox(
          width: sw * 0.15,
          child: Center(
            child: Text(
              "C",
              style: TextStyle(
                color: Colors.red[900],
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
        ),
        SizedBox(
          width: sw * 0.15,
          child: Center(
            child: Text(
              "R",
              style: TextStyle(
                color: Colors.blue[900],
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
        ),
        SizedBox(
          width: sw * 0.15,
          child: Center(
            child: Text(
              "A",
              style: TextStyle(
                color: Colors.green[900],
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
        ),
        SizedBox(
          width: sw * 0.15,
          child: Center(
            child: Text(
              "D",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
