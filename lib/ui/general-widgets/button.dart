import 'package:flutter/material.dart';
class Button extends StatefulWidget {
 String name;
 Function function;
 Color color;
 bool value;
 String img;
 Button(this.name, this.function,this.color,this.value,this.img);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 250,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.color,
        boxShadow: [
          BoxShadow(color: Colors.black, spreadRadius: 3),
        ],
      ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(widget.img,width: 100,height: 100,),
              Text(
                  widget.name.toUpperCase(),
                  style: TextStyle(fontSize: 18,color: Colors.white)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "OFF",
                      style: TextStyle(fontSize: 18,color: Colors.white)
                  ),
                  Switch(
                    onChanged: widget.function,

                    value: widget.value,
                    activeColor: Colors.white,
                    activeTrackColor: Colors.black,
                    inactiveThumbColor: Colors.black,
                    inactiveTrackColor: Colors.white,
                  ),
                  Text(
                      "ON",
                      style: TextStyle(fontSize: 18,color: Colors.white)
                  ),
                ],
              )
            ],
          ),
        ),

    );
  }
}
