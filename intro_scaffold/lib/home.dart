import 'package:flutter/material.dart';

class Home extends StatelessWidget{

  void _onPress(){
    print("Search Tapped!");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
       /*appBar: new AppBar(
         backgroundColor: Colors.amberAccent,
         title: new Text("Fency day"),
         actions: <Widget>[
           new IconButton(icon: new Icon(Icons.send), onPressed: () => debugPrint("Icon Tapped! send")),
           new IconButton(icon: new Icon(Icons.search), onPressed: _onPress),
         ],
       ),*/
      appBar: new AppBar(
         backgroundColor: Colors.greenAccent.shade700,
         title: new Text("Fency day"),
         actions: <Widget>[
           new IconButton(icon: new Icon(Icons.send), onPressed: () => debugPrint("Icon Tapped! send")),
           new IconButton(icon: new Icon(Icons.search), onPressed: _onPress),
         ],
       ),
      backgroundColor: Colors.grey.shade100,
      body: new Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Bonni",
            style: new TextStyle(
              fontSize: 14.5,
              fontWeight: FontWeight.w400,
              color: Colors.deepOrange,
            ),),
            new InkWell(
              child: new Text("Button!"),
              onTap: () => debugPrint("Button Tapped!"),
            ),
          ],

        ),
      ),
      
      floatingActionButton: new FloatingActionButton(
          onPressed: () => debugPrint("Pressed floatingActionButton!"),
          backgroundColor: Colors.lightGreen,
        tooltip: 'Going Up!',
        child: new Icon(Icons.call_missed),
      ),
      
      bottomNavigationBar: new BottomNavigationBar(items: [
        new BottomNavigationBarItem(icon: new Icon(Icons.add), title: new Text("Hey")),
        new BottomNavigationBarItem(icon: new Icon(Icons.print), title: new Text("Nope")),
        new BottomNavigationBarItem(icon: new Icon(Icons.add), title: new Text("Hello")),
      ], onTap: (int i) => debugPrint("Hey Touched $i"),),
    );
  }

}