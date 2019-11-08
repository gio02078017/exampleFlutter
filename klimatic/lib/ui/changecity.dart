import 'package:flutter/material.dart';

class ChangeCity extends StatelessWidget {
  var _cityFieldControler = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: new Text("Change City"),
        centerTitle: true,
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset('images/white_snow.png',
              width: 490.0,
              height: 1200.0,
              fit: BoxFit.fill,
            ),
          ),
          new ListView(
            children: <Widget>[
              new ListTile(
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Enter city",
                  ),
                  controller: _cityFieldControler,
                  keyboardType: TextInputType.text,
                ),
              ),
              new ListTile(
                title: new FlatButton(
                  onPressed: () {
                    Navigator.pop(context,{
                      'enter': _cityFieldControler.text
                    });
                  },
                  textColor: Colors.white70,
                  color: Colors.redAccent,
                  child: new Text("Get Weather"),
                ),
              )
            ],
          )
          /*new ListView(
            children: <Widget>[
              new Image.asset('images/white_snow.png',
                width: 490.0,
                height: 1200.0,
                fit: BoxFit.fill,
              ),
            ],
          )*/
        ],
      ),
    );
  }
}