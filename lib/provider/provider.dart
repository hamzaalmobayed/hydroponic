import 'package:flutter/material.dart';
import 'package:hydro_app/helper/apiHelper.dart';
import 'package:hydro_app/model/feeds.dart';
import 'package:hydro_app/model/subscribe.dart';
import 'package:charts_flutter/flutter.dart' as charts;




class HydroProvider extends ChangeNotifier{
  /*************  constructor  ************************************************************/
  HydroProvider() {
getFeeds();
Future.delayed(Duration(seconds: 2)).then((value) => checkTH());
//getLastFeeds();
  }

  /*************  variables  *************************************************************/
  List<Feeds> feeds=[];
  List<SubscriberSeries> temp=[];
  List<SubscriberSeries> hemditiy=[];
  List<SubscriberSeries> lastTemp=[];
  List<SubscriberSeries> lastHemditiy=[];
  List<String> tds=[];
  List<String> water=[];
  double tempr=50;
  double hem=50;
  bool isSwitchedFan1=false;
  bool isSwitchedFan2=false;
  bool isSwitchedPump=false;
  bool isSwitchedLight=false;
  bool visible=false;
  int unread=0;
  List<String> notification=[];
  /*************  DropDown Buttons Function  *************************************************/
  getFeeds() async{
    int i=225;

    temp.clear();
    hemditiy.clear();
    feeds= await ApiService.apiService.getFeeds();
    feeds.forEach((element) {
      print(element.temp+"+++"+element.humidity);
      print(element.waterTemp+"*******"+element.tdsMeter);
      temp.add(SubscriberSeries(element.createdAt.split("T")[1].split(":")[0]+":"+element.createdAt.split("T")[1].split(":")[1]+"\n"+element.createdAt.split("T")[0].split("-")[2]+"-"+element.createdAt.split("T")[0].split("-")[1], element.temp.isEmpty?0.0:double.parse(element.temp),charts.ColorUtil.fromDartColor( Color.fromRGBO(225, 225, 225, 1))));
      hemditiy.add(SubscriberSeries(element.createdAt.split("T")[1].split(":")[0]+":"+element.createdAt.split("T")[1].split(":")[1]+"\n"+element.createdAt.split("T")[0].split("-")[2]+"-"+element.createdAt.split("T")[0].split("-")[1], element.humidity.isEmpty?0.0:double.parse(element.humidity),charts.ColorUtil.fromDartColor( Color.fromRGBO(225, 225, 225, 1))));
      tds.add(element.tdsMeter);
      water.add(element.waterTemp);
      i-=20;
    });
    int j=feeds.indexOf(feeds.last);
    for(int i=0;i<10;i++){
      lastTemp.add(temp[j]);
      lastHemditiy.add(hemditiy[j]);
      --j;
    }
    print("done");
    notifyListeners();
}

writeData()async{
    await ApiService.apiService.writeData(tempr.toString(), hem.toString());
    print("done");

}



valueTemp(value){
    tempr=value;
    notifyListeners();
}

valueHem(value){
    hem=value;
    notifyListeners();
  }


  toggleSwitchFan1(bool value) {
    isSwitchedFan1=!isSwitchedFan1;
    ApiService.apiService.writeButtons(isSwitchedFan1?"1":"0",isSwitchedFan2?"1":"0",isSwitchedPump?"1":"0",isSwitchedLight?"1":"0");
    print("done");
    if(isSwitchedFan1){
      notification.add("Fan1 is on");
    }else{
      notification.add("Fan1 is off");
    }
    notifyListeners();

  }

  toggleSwitchFan2(bool value) {
    isSwitchedFan2=!isSwitchedFan2;
    ApiService.apiService.writeButtons(isSwitchedFan1?"1":"0",isSwitchedFan2?"1":"0",isSwitchedPump?"1":"0",isSwitchedLight?"1":"0");
    print("done");
    if(isSwitchedFan2){
      notification.add("Fan2 is on");
    }else{
      notification.add("Fan2 is off");
    }
    notifyListeners();


  }


  toggleSwitchLight(bool value) {

    isSwitchedLight=!isSwitchedLight;
    ApiService.apiService.writeButtons(isSwitchedFan1?"1":"0",isSwitchedFan2?"1":"0",isSwitchedPump?"1":"0",isSwitchedLight?"1":"0");
    print("done");
    if(isSwitchedLight){
      notification.add("light is on");
    }else{
      notification.add("light is off");
    }
    notifyListeners();

  }

  toggleSwitchPump(bool value) {
    isSwitchedPump=!isSwitchedPump;
    ApiService.apiService.writeButtons(isSwitchedFan1?"1":"0",isSwitchedFan2?"1":"0",isSwitchedPump?"1":"0",isSwitchedLight?"1":"0");
    print("done");
    if(isSwitchedPump){
      notification.add("pump is on");
    }else{
      notification.add("pump is off");
    }
    notifyListeners();


  }

  changeVisibilty(){
    this.visible=!this.visible;
    notifyListeners();
  }

  checkTH(){
    if(temp.last.subscribers.toDouble()>=25){
      notification.add("Tempurature is more than expected");
    }
    if(hemditiy.last.subscribers.toDouble()>=85){
      notification.add("hemditiy is more than expected");
    }
  }

}