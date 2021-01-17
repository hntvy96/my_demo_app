import 'package:flutter/material.dart';
import 'welcome.dart';
import 'AuthUtil.dart';

class SignInPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SignInPageState();
  }
}

class SignInPageState extends State<SignInPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[700],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(10, 100, 10, 30),
                  child: Text(
                    'SUPPER APP',
                    style: TextStyle(
                        color: Colors.deepPurple[900],
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: new Theme(
                  data: new ThemeData(
                    primaryColor: Colors.deepPurple[700],
                    primaryColorDark: Colors.deepPurple[700],
                  ),
                  child: TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: new Theme(
                  data: new ThemeData(
                    primaryColor: Colors.deepPurple[700],
                    primaryColorDark: Colors.deepPurple[700],
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: _isHidden,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      suffix: InkWell(
                        onTap: _togglePasswordView,
                        child: Icon(
                          Icons.visibility,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: new Theme(
                  data: new ThemeData(
                    primaryColor: Colors.deepPurple[700],
                    primaryColorDark: Colors.deepPurple[700],
                  ),
                  child: TextFormField(
                    obscureText: _isHidden,
                    controller: confirmPassController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm password',
                      suffix: InkWell(
                        onTap: _togglePasswordView,
                        child: Icon(
                          Icons.visibility,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: new Theme(
                  data: new ThemeData(
                    primaryColor: Colors.deepPurple[700],
                    primaryColorDark: Colors.deepPurple[700],
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: new Theme(
                  data: new ThemeData(
                    primaryColor: Colors.deepPurple[700],
                    primaryColorDark: Colors.deepPurple[700],
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone Number',
                    ),
                  ),
                ),
              ),
              Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.deepPurple[700],
                    child: Text(
                      'Sign In',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        AuthUtil.registerUserParse(usernameController.text,
                                passwordController.text)
                            .then((response) {
                          // print("response is ${response.result}");
                          if (response.success == true) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          } else {
                            print(response.error);
                          }
                        });
                      } else {
                        print('register error');
                      }
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
