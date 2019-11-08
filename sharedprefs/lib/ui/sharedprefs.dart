import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref extends StatefulWidget {
  @override
  _SharedPrefState createState() => _SharedPrefState();
}

class _SharedPrefState extends State<SharedPref> {

  var _enterDateField = new TextEditingController();
  String _savedData = "";

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  _loadSavedData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      if(preferences.getString("data") != null && preferences.getString("data").isNotEmpty) {
        _savedData = preferences.getString("data");
      }else{
        _savedData = "Empty SP";
      }
    });
  }

  _saveData(String message) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("data", message);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Shared Prefs"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: new Container(
        padding: const EdgeInsets.all(13.4),
        alignment: Alignment.topCenter,
        child: new ListTile(
          title: new TextField(
            controller: _enterDateField,
            decoration: new InputDecoration(labelText: "Write Something"),
          ),
          subtitle: new FlatButton(
              color: Colors.redAccent,
              onPressed: () {
                _saveData(_enterDateField.text);
              },
              child: new Column(
                children: <Widget>[
                  new Text('Save data'),
                  new Padding(padding: new EdgeInsets.all(14.5)),
                  new Text(_savedData)
                ],
              )
          ),
        ),
      ),
    );
  }
}
