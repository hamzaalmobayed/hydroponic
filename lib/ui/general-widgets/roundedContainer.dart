import 'package:flutter/material.dart';
class RoundedContainer extends StatefulWidget {
Color color;
String txt;

RoundedContainer(this.color, this.txt);

  @override
  _RoundedContainerState createState() => _RoundedContainerState();
}

class _RoundedContainerState extends State<RoundedContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      margin: EdgeInsets.all(20),
      height: 100,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.color,
        boxShadow: [
          BoxShadow(color: Colors.black, spreadRadius: 3),
        ],
      ),
      child: Text(widget.txt,style: TextStyle(fontSize: 30,color: Colors.white),),
    );
  }
}
