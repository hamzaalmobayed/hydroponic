import 'package:flutter/material.dart';
import 'package:hydro_app/provider/provider.dart';
import 'package:hydro_app/ui/general-widgets/button.dart';
import 'package:hydro_app/ui/general-widgets/roundedContainer.dart';
import 'package:provider/provider.dart';
class ButtonScreenContent extends StatefulWidget {

  @override
  _ButtonScreenContentState createState() => _ButtonScreenContentState();
}

class _ButtonScreenContentState extends State<ButtonScreenContent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HydroProvider>(
        builder:(context,hydro,x)=> Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
            RoundedContainer(Color.fromRGBO(225, 0, 50, 1),"Min pH is 5.5",),
            SizedBox(height: 30,),
            Row(
              children: [
                SizedBox(width: 10,),
                Button("Fan 1", ()=>hydro.writeButtonData("Fan 1"),hydro.fan1?Colors.blueAccent:Color.fromRGBO(225, 0, 50, 1)),
                SizedBox(width: 20,),
                Button("Fan 2", ()=>hydro.writeButtonData("Fan 2"),hydro.fan2?Colors.blueAccent:Color.fromRGBO(225, 0, 50, 1)),

              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                SizedBox(width: 10,),
                Button("Pump", ()=>hydro.writeButtonData("Pump"),hydro.pump?Colors.blueAccent:Color.fromRGBO(225, 0, 50, 1)),
                SizedBox(width: 20,),
                Button("Light", ()=>hydro.writeButtonData("Light"),hydro.light?Colors.blueAccent:Color.fromRGBO(225, 0, 50, 1)),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
