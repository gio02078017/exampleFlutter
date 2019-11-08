import 'package:flutter/material.dart';

class CustomLoginForm extends StatefulWidget {
  @override
  _CustomLoginFormState createState() => _CustomLoginFormState();
}

//LoginData
class _loginData{
  String name = "";
  String password ="";
}

class _CustomLoginFormState extends State<CustomLoginForm> {

  final _formKey = GlobalKey<FormState>();
  _loginData _data = new _loginData();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.asset("images/face.png",
                width: 90,
                height: 90,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(
                    gapPadding: 3.3,
                    borderRadius: BorderRadius.circular(3.3)
                  )
                ),
                validator: (value){
                  if(value.isEmpty){
                    return "Please enter name";
                  }else{
                    print("All is good");
                    _data.name = value;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                        gapPadding: 3.3,
                        borderRadius: BorderRadius.circular(3.3)
                    )
                ),
                validator: (value){
                  if(value.isEmpty){
                    return "Please enter password";
                  }else{
                  print("All is good");
                  _data.password = value;
                  }
                },
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: (){
                        if(_formKey.currentState.validate()){
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text("All is good"),));
                          setState(() {
                            _data.name = _data.name;
                          });
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: (){
                        if(_formKey.currentState.validate()){
                          _formKey.currentState.reset();
                          setState(() {
                            _data.name = "";
                          });
                        }
                      },
                      child: Text('Clear'),
                    ),
                  ),

                ],
              ),
            ),
            Center(
              child: _data.name.isEmpty ? Text("") : Text(
                "Wellcome ${_data.name}",
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            ),

          ],
      ),
    );
  }
}
