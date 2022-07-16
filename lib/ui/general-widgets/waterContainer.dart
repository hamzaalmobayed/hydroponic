import 'package:flutter/material.dart';
class WaterContainer extends StatefulWidget {
double width,height;
Color color;

WaterContainer(this.width, this.height, this.color);

  @override
  _WaterContainerState createState() => _WaterContainerState();
}

class _WaterContainerState extends State<WaterContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color:widget.color,
    );
  }
}
