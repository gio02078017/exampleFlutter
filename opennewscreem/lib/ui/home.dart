import 'package:flutter/material.dart';
import 'package:opennewscreem/ui/nextscreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _nameFieldControler = new TextEditingController();

  Future _goToNextscreen(BuildContext context) async{
    Map results = await Navigator.of(context).push(
        new MaterialPageRoute<Map>(builder: (BuildContext context){
          return new NextScreen(name: _nameFieldControler.text);
        })
    );

    debugPrint("resultsados $results" );

    if(results != null && results.containsKey("info")){
      print(results['info'].toString());
      _nameFieldControler.text = results['info'].toString();
    }else{
      debugPrint('Nothing');
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("First Screen"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        ),
      body: new ListView(
          children: <Widget>[
            new ListTile(
              title: new TextField(
                controller: _nameFieldControler,
                decoration: new InputDecoration(
                  labelText: 'Enter Your Name',
                ),                
              ),
            ),
            new ListTile(
              title: new RaisedButton(
                child: new Text("Send To Next Screen"),
                  onPressed: () {_goToNextscreen(context);}/*() {
                     var router = new MaterialPageRoute(
                         builder: (BuildContext context) => new NextScreen(name: _nameFieldControler.text ,));
                     Navigator.of(context).push(router);
                  }*/
              ),
            ),            
          ],
        ),
      );
  }
}
