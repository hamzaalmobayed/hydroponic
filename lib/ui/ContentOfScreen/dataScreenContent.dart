import 'package:flutter/material.dart';
import 'package:hydro_app/provider/provider.dart';
import 'package:hydro_app/ui/general-widgets/redialChart.dart';
import 'package:hydro_app/ui/general-widgets/roundedContainer.dart';
import 'package:hydro_app/ui/general-widgets/slider.dart';
import 'package:hydro_app/ui/general-widgets/waterContainer.dart';
import 'package:provider/provider.dart';
class DataScreenContent extends StatefulWidget {

  @override
  _DataScreenContentState createState() => _DataScreenContentState();
}

class _DataScreenContentState extends State<DataScreenContent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HydroProvider>(
        builder:(context,hydro,x)=>Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RoundedContainer(Color.fromRGBO(225, 0, 50, 1), "Temp is "+hydro.temp.last.subscribers.toString()+"\n"+"Himidity is "+hydro.hemditiy.last.subscribers.toString()),
            Row(
              children: [
                Column(
                  children: [

                    Container(
                      width: 150,
                      margin: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.black, spreadRadius: 3),
                        ],
                      ),
                      child: Column(
                        children: [
                          WaterContainer(150,50,Colors.blueAccent),
                          WaterContainer(150,100,Colors.lightBlueAccent),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("water level",style: TextStyle(fontSize: 20,color: Color.fromRGBO(225, 0, 50, 1)),),

                  ],
                ),
                Column(
                  children: [
                    SliderSeek(Color.fromRGBO(225, 0, 50, 1),(value){
                      hydro.valueTemp(value);
                      hydro.writeData();
                    },
                    hydro.tempr,
                        "Temp:"
                    ),
                    SliderSeek(Color.fromRGBO(225, 0, 200, 1),(value){
                      hydro.valueHem(value);
                      hydro.writeData();
                    },
                    hydro.hem,
                        "Himidity:"
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RedialChart(hydro.temp.isEmpty?0.0:hydro.temp.last.subscribers.toDouble()),
                SizedBox(width: 10,),
                RedialChart(hydro.hemditiy.isEmpty?0.0:hydro.hemditiy.last.subscribers.toDouble()),

              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RedialChart(hydro.tds.isEmpty?0.0:double.parse(hydro.feeds.last.tdsMeter)),
                SizedBox(width: 10,),
                RedialChart(hydro.water.isEmpty?0.0:double.parse(hydro.feeds.last.waterTemp)),


              ],
            ),
            SizedBox(height: 20,),

          ],
        ),
      ),
    ));
  }
}
