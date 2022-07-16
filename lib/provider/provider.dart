import 'package:flutter/material.dart';
import 'package:hydro_app/helper/apiHelper.dart';
import 'package:hydro_app/model/feeds.dart';
import 'package:hydro_app/model/subscribe.dart';
import 'package:charts_flutter/flutter.dart' as charts;




class HydroProvider extends ChangeNotifier{
  /*************  constructor  ************************************************************/
  HydroProvider() {
getFeeds();
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
  bool fan1=false;
  bool fan2=false;
  bool pump=false;
  bool light=false;
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

  writeButtonData(value){
    if(value=="Fan 1"){
      fan1=!fan1;
    }else if(value=="Fan 2"){
      fan2=!fan2;
    }else if(value=="Pump"){
      pump=!pump;
    }else if(value=="Light"){
      light=!light;
    }
    ApiService.apiService.writeButtons(fan1?"1":"0",fan2?"1":"0",pump?"1":"0",light?"1":"0");
    print("done");
    notifyListeners();
  }
  }