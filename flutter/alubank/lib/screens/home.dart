import 'package:alubank/components/sections/account_actions.dart';
import 'package:alubank/components/sections/account_points.dart';
import 'package:alubank/components/sections/header.dart';
import 'package:alubank/components/sections/recent_activity.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Header(),
          RecentActivity(),
          AccountActions(),
          AccountPoints()
        ],
      ),
    ));
  }
}
