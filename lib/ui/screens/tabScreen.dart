import 'package:flutter/material.dart';
import 'package:hydro_app/provider/provider.dart';
import 'package:hydro_app/ui/screens/buttonScreen.dart';
import 'package:hydro_app/ui/screens/chartScreen.dart';
import 'package:hydro_app/ui/screens/tableScreen.dart';
import 'package:provider/provider.dart';

import 'DataScreen.dart';


class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(225, 0, 50, 1),
          centerTitle: true,
          title: Center(
            child: Text(
              'Hydroponic ',
              style: TextStyle(color: Colors.white),
            ),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  )),
              Tab(
                  icon: Icon(
                    Icons.monitor,
                    color: Colors.white,
                  )),
              Tab(
                  icon: Icon(
                    Icons.construction_rounded,
                    color: Colors.white,
                  )),
              Tab(
                  icon: Icon(
                    Icons.stacked_bar_chart,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TableScreen(),
            DataScreen(),
            ButtonScreen(),
            ChartScreen(),
          ],
        ),
      ),
    );
  }
}