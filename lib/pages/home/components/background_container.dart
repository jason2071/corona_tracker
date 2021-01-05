import 'package:corona_tracker/constants.dart';
import 'package:corona_tracker/size_config.dart';
import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    double sh = SizeConfig.screenHeight;

    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: sh * 0.3,
              color: kPrimaryColor,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
