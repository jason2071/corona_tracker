import 'package:flutter/material.dart';

import 'components/body.dart';

class SelectionScreen extends StatelessWidget {
  static const routeName = '/selection_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search Country",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Body(),
    );
  }
}
