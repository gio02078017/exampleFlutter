import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

Map _data;
List _features;
void main() async{

  _data = await getQuakes();
  _features = _data['features'];

  print(_data);

  runApp(new MaterialApp(
    title: "Quakes",
    home: Quakes(),
  ));
}

class Quakes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Quakes"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),

      body: new Center(
        child: new ListView.builder(
            itemCount: _features.length,
            padding: const EdgeInsets.all(15.0),
            itemBuilder: (BuildContext context, int position) {
              if (position.isOdd) return new Divider();
              final index = position ~/ 2;
              //var format =  new DateFormat("yMd");
              //var format =  new DateFormat.yMMMMd("en_US");
              var format = new DateFormat.yMMMMd("en_US").add_jm();
              var date = format.format(new DateTime.fromMicrosecondsSinceEpoch(
                  _features[position]['properties']['time'] * 1000,
                  isUtc: true));
              return new ListTile(
                title: new Text("At: $date",
                  style: new TextStyle(
                      fontSize: 19.5,
                      color: Colors.orange,
                      fontWeight: FontWeight.w500),
                ),
                subtitle: new Text(
                  "${_features[position]['properties']['place']}",
                  style: new TextStyle(
                      fontSize: 14.5,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic),
                ),
                leading: new CircleAvatar(
                  backgroundColor: Colors.green,
                  child: new Text("${_features[position]['properties']['mag']}",
                    style: new TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16.5,
                    ),
                  ),
                ),
                //onTap: () {_showAlertMessage(context, "${_features[position]['index']['type']}");},
                onTap: () {_showAlertMessage(context, "${_features[position]['properties']['title']}");},
              );
            }),
      ),
    );
  }

  void _showAlertMessage(BuildContext context, String message){
    var alertDialog = new AlertDialog(
      title: Text("Quakes"),
      content: new Text(message),
      actions: <Widget>[
        FlatButton(
          //onPressed: () => debugPrint("Ok pressed"),
          onPressed: () => Navigator.of(context).pop(),
          child: Text("Ok"),
        )
      ],
    );

    showDialog(context: context, builder: (context){
      return alertDialog;
    });
  }
}

Future<Map> getQuakes() async{
   String apiUrl ="https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson";

   http.Response response = await http.get(apiUrl);
   return json.decode(response.body);
}



