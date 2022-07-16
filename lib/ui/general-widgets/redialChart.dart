
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
class RedialChart extends StatefulWidget {
double value;

RedialChart(this.value);

  @override
  _RedialChartState createState() => _RedialChartState();
}

class _RedialChartState extends State<RedialChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(225, 0, 50, 1),
        boxShadow: [
          BoxShadow(color: Colors.black, spreadRadius: 3),
        ],
      ),
      padding: EdgeInsets.all(10),
      child: Stack(
        children:[
          SleekCircularSlider(
            appearance: CircularSliderAppearance(

              customColors:CustomSliderColors(trackColor: Colors.white,dotColor:Colors.white,progressBarColor:  Color.fromRGBO(225, 0, 50, 1),shadowColor: Colors.white, ) ,
                customWidths: CustomSliderWidths(progressBarWidth: 15,trackWidth: 15,shadowWidth: 30)),
            min: 0,
            max: 1000,
            initialValue: widget.value,
          ),
          Positioned(
            left: 45,
              top: 50,
              child: Container(height: 50,color:Color.fromRGBO(225, 0, 50, 1) ,child: Text(widget.value.toString(),style: TextStyle(color: Colors.white,fontSize: 30),)))
        ],
      ),
    );
  }
}
