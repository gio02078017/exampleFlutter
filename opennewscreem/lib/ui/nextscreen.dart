import 'package:flutter/material.dart';

class NextScreen extends StatefulWidget {

  final String name;
    NextScreen({Key key, this.name}): super(key: key);

  @override
  NextScreenState createState() => NextScreenState();
}

class NextScreenState extends State<NextScreen> {

  var _backTextFieldControler = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.greenAccent,
        title: new Text('Second Screen'),
        centerTitle: true,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new ListTile(
              title: new Text('${widget.name}'),
            ),      new ListTile(
              title: new TextField(
                controller: _backTextFieldControler,
              ),
            ),
            new ListTile(
              title: new FlatButton(
                  onPressed: () {
                    Navigator.pop(context, {
                      'info': _backTextFieldControler.text
                    });
                  },
                  child: new Text('Send Data Back')
              ),
            )
          ],
        ),
      )
    );
  }
}
