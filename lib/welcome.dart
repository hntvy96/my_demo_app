import 'package:flutter/material.dart';
import 'AuthUtil.dart';
import 'main.dart';

class HomePage extends StatelessWidget {
  // final String username;
  // HomePage({Key key, this.username}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('WELCOME'),
      // ),
      body: Container(
          height: 50,
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          margin: EdgeInsets.symmetric(vertical: 20),
          child: RaisedButton(
            textColor: Colors.white,
            color: Colors.deepPurple[700],
            child: Text(
              'log out',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            onPressed: () {
              AuthUtil.logOut().then((response) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DashBoard()));
              });
            },
          )),
    );
  }
}
