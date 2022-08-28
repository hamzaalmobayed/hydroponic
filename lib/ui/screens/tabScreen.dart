import 'package:flutter/material.dart';
import 'package:hydro_app/provider/provider.dart';
import 'package:hydro_app/ui/general-widgets/triangle.dart';
import 'package:hydro_app/ui/screens/buttonScreen.dart';
import 'package:hydro_app/ui/screens/chartScreen.dart';
import 'package:hydro_app/ui/screens/tableScreen.dart';
import 'package:provider/provider.dart';

import 'DataScreen.dart';


class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  @override
  Widget build(BuildContext context) {

    return Consumer<HydroProvider>(
      builder:(context,hydro,x)=>DefaultTabController(
        length: 4,
        child: Stack(children:[Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(225, 0, 50, 1),
            centerTitle: true,
            title: Center(
              child: Text(
                'Hydroponic Smart System By: Shadi Alaydi ',
                style: TextStyle(color: Colors.white),
              ),
            ),
            leading:
              Column(
                children: [
                  SizedBox(height: 6,),
                  Stack(
                    children: [
                      IconButton(icon:Icon(Icons.notifications,color: Colors.white,size: 30,),onPressed: (){hydro.changeVisibilty();print(hydro.visible);},),
                      hydro.notification.isEmpty?SizedBox.shrink():Positioned(
                        top: 3,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 3),
                          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blueAccent),
                          alignment: Alignment.center,
                          child: Text(hydro.notification.length.toString()),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                    )),
                Tab(
                    icon: Icon(
                      Icons.monitor,
                      color: Colors.white,
                    )),
                Tab(
                    icon: Icon(
                      Icons.construction_rounded,
                      color: Colors.white,
                    )),
                Tab(
                    icon: Icon(
                      Icons.stacked_bar_chart,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          body: TabBarView(
            children: [
              TableScreen(),
              DataScreen(),
              ButtonScreen(),
              ChartScreen(),
            ],
          ),
        ),
          Visibility(
            visible: hydro.visible,
            child: Positioned(
              top: 70,
              left:5,
              child: Material(
                color: Colors.white.withOpacity(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 200),
                      child:CustomPaint(
                        painter: TrianglePainter(
                          strokeColor: Colors.white,
                          strokeWidth: 10,
                          paintingStyle: PaintingStyle.fill,
                        ),
                        child: Container(
                          height: 20,
                          width: 30,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 0),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                      width: 250,
                      height: 200,
                      child: SingleChildScrollView(

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              children: hydro.notification.map((e) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(e,style: TextStyle(fontSize: 18,color: Colors.blue),),
                                      SizedBox(height: 20,),
                                      Divider(color: Color.fromRGBO(225, 0, 50, 1),height: 2,thickness: 2,),
                                    ],
                                  ),
                                ),
                              )).toList()
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),]),
      ),
    );
  }
}


