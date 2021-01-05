import 'package:flutter/material.dart';

class RoundBottomSheet extends StatelessWidget {
  const RoundBottomSheet({
    Key key,
    @required this.child,
    this.height = 300,
  }) : super(key: key);

  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: height,
      child: Container(
          padding: EdgeInsets.only(
            top: 16,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: child),
    );
  }
}
