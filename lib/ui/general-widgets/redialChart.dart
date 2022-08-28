
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
class RedialChart extends StatefulWidget {
double value;
double max;
double left;
double mount;
double unitSize;
String unit;
RedialChart(this.value,this.max,this.left,this.unit,this.mount,this.unitSize);

  @override
  _RedialChartState createState() => _RedialChartState();
}

class _RedialChartState extends State<RedialChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 160,
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
            max: widget.max,
            initialValue: widget.value,
          ),
          Positioned(
            left: widget.left,
              top: 50,
              child: Container(height: 50,color:Color.fromRGBO(225, 0, 50, 1) ,child: Row(
                children: [
                  Text(widget.value.toString(),style: TextStyle(color: Colors.white,fontSize: widget.mount),),
                  Text(widget.unit.toString(),style: TextStyle(color: Colors.white,fontSize: widget.unitSize),),
                ],
              )))
        ],
      ),
    );
  }
}
