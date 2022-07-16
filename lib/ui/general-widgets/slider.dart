import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:hydro_app/provider/provider.dart';
import 'package:provider/provider.dart';
class SliderSeek extends StatefulWidget {
Color color;
Function function;
double value;
String type;

SliderSeek(this.color,this.function,this.value,this.type);

  @override
  _SliderSeekState createState() => _SliderSeekState();
}

class _SliderSeekState extends State<SliderSeek> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      child: Column(
        children: [
          Slider(
            min: 0.0,
            max: 100.0,
            activeColor: widget.color,
            value: widget.value,
            onChanged: widget.function
          ),
          Text(widget.type+(widget.value.toInt()).toString(),style: TextStyle(color: Color.fromRGBO(225, 0, 50, 1),fontSize: 20),)

        ],
      ),
    );
  }
}
