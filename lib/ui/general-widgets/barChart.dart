import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:hydro_app/model/subscribe.dart';
class BarChart extends StatelessWidget {
  final List<SubscriberSeries> data;
  String txt;
  BarChart( this.data,this.txt);

  @override
  Widget build(BuildContext context) {

    List<charts.Series<SubscriberSeries, String>> series = [
      charts.Series(
          id: "Subscribers",
          data: data,
          domainFn: (SubscriberSeries series, _) => series.year,
          measureFn: (SubscriberSeries series, _) => series.subscribers,
          colorFn: (SubscriberSeries series, _) => series.barColor
      )
    ];

    return Container(

      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        shape: Border.all(color: Colors.black,width: 2,),
        elevation: 10,
        shadowColor: Color.fromRGBO(225, 0, 50, 1),
        color: Color.fromRGBO(225, 0, 50, 1),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                txt,
                style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: charts.BarChart(
                  series,
                  animate: true,
                  domainAxis: new charts.OrdinalAxisSpec(
                      renderSpec: new charts.SmallTickRendererSpec(

                        // Tick and Label styling here.
                          labelStyle: new charts.TextStyleSpec(
                              fontSize: 11, // size in Pts.
                              color: charts.MaterialPalette.white),

                          // Change the line colors to match text color.
                          lineStyle: new charts.LineStyleSpec(
                              color: charts.MaterialPalette.white))),

                  /// Assign a custom style for the measure axis.
                  primaryMeasureAxis: new charts.NumericAxisSpec(
                      renderSpec: new charts.GridlineRendererSpec(

                        // Tick and Label styling here.
                          labelStyle: new charts.TextStyleSpec(
                              fontSize: 13, // size in Pts.
                              color: charts.MaterialPalette.white),

                          // Change the line colors to match text color.
                          lineStyle: new charts.LineStyleSpec(
                              color: charts.MaterialPalette.white))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}