import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
            RoundedContainer(Color.fromRGBO(225, 0, 50, 1),hydro.notification.isEmpty?"":hydro.notification.last),
            SizedBox(height: 30,),
            Button("Fan 1",(value){hydro.toggleSwitchFan1(hydro.isSwitchedFan1);},Color.fromRGBO(225, 0, 50, 1),hydro.isSwitchedFan1,'images/fan.png'),
            Button("Fan 2", (value){hydro.toggleSwitchFan2(hydro.isSwitchedFan2);},Color.fromRGBO(225, 0, 50, 1),hydro.isSwitchedFan2,'images/fan.png'),
            Button("Pump", (value){hydro.toggleSwitchPump(hydro.isSwitchedPump);},Color.fromRGBO(225, 0, 50, 1),hydro.isSwitchedPump,'images/pump.png'),
            Button("Light", (value){hydro.toggleSwitchLight(value);},Color.fromRGBO(225, 0, 50, 1),hydro.isSwitchedLight,'images/light.png')
          ],
        ),
      ),
    ));
  }
}
