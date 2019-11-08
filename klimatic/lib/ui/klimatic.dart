import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:klimatic/ui/changecity.dart';
import '../util/utils.dart' as util;

class Klimatic extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new KlimaticState();
  }
}

class KlimaticState extends State<Klimatic>{

  String _cityEntered;

  Future _goToNextscreem(BuildContext context) async{
    Map results = await Navigator.of(context).push(
      new MaterialPageRoute<Map>(builder: (BuildContext context){
        return new ChangeCity();
      })
    );

    if(results != null && results.containsKey("enter")){
      _cityEntered = results["enter"].toString();
    }
  }

  void showStuff() async{
    Map _data = await getWeather(util.appId, util.defaultCity);
    print(_data.toString());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Klimatic'),
        backgroundColor: Colors.redAccent,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.menu), onPressed: () {_goToNextscreem(context);})
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset('images/umbrella.png',
              width: 490.0,
              height: 1200.0,
              fit: BoxFit.fill,
            ),
          ),
          new Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.fromLTRB(0.0, 10.9, 20.9, 0.0),
            child: new Text('${_cityEntered == null ? util.defaultCity : _cityEntered}',
              style: cityStyle(),
            ),
          ),
          new Container(
            alignment: Alignment.center,
            child: new Image.asset('images/light_rain.png'),
          ),
          updateTempWidget(_cityEntered)
          /*new Container(
            //alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(30.0, 290.0, 0.0, 0.0),
            child: updateTempWidget(_cityEntered),
          ),*/
        ],
      ),
    );
  }

  Future<Map> getWeather(String appId, String city) async{
    String apiUrl= "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$appId&units=metric";

    http.Response response = await http.get(apiUrl);

    return json.decode(response.body);
  }

  Widget updateTempWidget(String city){
    return new FutureBuilder(
        future: getWeather(util.appId, city == null ? util.defaultCity : city),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot){
          if(snapshot.hasData){
            Map content = snapshot.data;
            return new Container(
              margin: const EdgeInsets.fromLTRB(30.0, 250.0, 0.0, 0.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new ListTile(
                    title: new Text("${content['main']['temp'].toString()} F",
                      style: new TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 49.9,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: new ListTile(
                      title: new Text(
                          "humidity: ${content['main']['humidity'].toString()}\n"
                              "Min: ${content['main']['temp_min'].toString()} F\n"
                              "Max: ${content['main']['temp_max'].toString()} F\n",
                        style: extraData(),
                      ),
                    ),
                  )
                ],
              )
            );
          }else{
            return new Container();
          }
      }
    );
  }
}

TextStyle cityStyle () {
  return new TextStyle(
      color: Colors.white,
      fontSize: 22.9,
      fontStyle: FontStyle.italic
  );
}

TextStyle tempStyle(){
  return new TextStyle(
    color: Colors.white,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontSize: 49.9,
  );
}

TextStyle extraData(){
  return new TextStyle(
    color: Colors.white70,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontSize: 17.0,
  );
}

