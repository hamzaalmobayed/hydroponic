import 'package:flutter/material.dart';
import 'package:hydro_app/lists/hemdity.dart';
import 'package:hydro_app/provider/provider.dart';
import 'package:hydro_app/ui/general-widgets/barChart.dart';
import 'package:provider/provider.dart';
class ChartScreenContent extends StatefulWidget {


  @override
  _ChartScreenContentState createState() => _ChartScreenContentState();
}

class _ChartScreenContentState extends State<ChartScreenContent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HydroProvider>(
        builder:(context,hydro,x)=>Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            BarChart(hydro.lastTemp.reversed.toList(),"Tempreture last week"),
            BarChart(hydro.lastHemditiy.reversed.toList(),"Humidity last week"),
          ],
        ),
      ),
    ));
  }
}
