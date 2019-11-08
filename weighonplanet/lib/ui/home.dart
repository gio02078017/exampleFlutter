import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }
}

class HomeState extends State<Home>{

  final TextEditingController _weightControler = new TextEditingController();
  int radioValue = 0;
  double _finalResult = 0.0;
  String _formattedText ="";

  void handleRadioValueChanged(int value){
    setState(() {
      radioValue = value;
      print("value $radioValue");
      switch(radioValue){
        case 0:
        _finalResult = calculateWeight(_weightControler.text, 0.06);
        _formattedText = "Your weight on Pluto is ${_finalResult.toStringAsFixed(1)} lbs";
        break;
        case 1:
        _finalResult = calculateWeight(_weightControler.text, 0.38);
        _formattedText = "Your weight on Mars is ${_finalResult.toStringAsFixed(1)} lbs";
        break;
        case 2:
        _finalResult = calculateWeight(_weightControler.text, 0.91);
        _formattedText = "Your weight on Venus is ${_finalResult.toStringAsFixed(1)} lbs";
        break;
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight on Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            Image.asset('images/planet.png',
              height: 133.0,
              width: 200.0,
            ),
            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightControler,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Your weight on Earth",
                      hintText: 'In Pounds',
                      icon: new Icon(Icons.person_outline),
                    ),
                  ),

                  new Padding(padding: new EdgeInsets.all(5.0)),

                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                        activeColor: Colors.brown,
                        value: 0, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      Text("Pluto", style: new TextStyle(color: Colors.white30),
                      ),
                      new Radio<int>(
                        activeColor: Colors.red,
                        value: 1, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      Text("Mars", style: new TextStyle(color: Colors.white30),
                      ),
                      new Radio<int>(
                        activeColor: Colors.orangeAccent,
                        value: 2, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      Text("Venus", style: new TextStyle(color: Colors.white30),
                      ),
                    ],
                  ),

                  new Padding(padding: new EdgeInsets.all(5.6)),

                  new Text(
                    _weightControler.text.isEmpty ? "Please enter weight" : _formattedText,
                    //"$_formattedText",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 19.4,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier){
    if(/*weight.isNotEmpty && */int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0){
      return int.parse(weight) * multiplier;
    }else{
      print("Wrong!");
      return int.parse("1800") * 0.38;
    }
  }
}