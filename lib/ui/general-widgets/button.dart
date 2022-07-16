import 'package:flutter/material.dart';
class Button extends StatefulWidget {
 String name;
 Function function;
 Color color;
 Button(this.name, this.function,this.color);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 100),
          child: Text(
              widget.name.toUpperCase(),
              style: TextStyle(fontSize: 18,color: Colors.white)
          ),
        ),
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(widget.color),
            backgroundColor: MaterialStateProperty.all<Color>(widget.color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    side: BorderSide(color: Colors.black,width: 2)
                )
            )
        ),
        onPressed: widget.function
    );
  }
}
