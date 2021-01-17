import 'package:flutter/material.dart';
import 'AuthUtil.dart';
import 'welcome.dart';
import 'signInPage.dart';

class Login extends StatefulWidget {
  // const Login({this.onSignedIn});
  // final VoidCallback onSignedIn;
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Sample App'),
      //   backgroundColor: Colors.deepPurple[700],
      // ),
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
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
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
                    obscureText: _isHidden,
                    controller: passwordController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
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
              FlatButton(
                onPressed: () {},
                textColor: Colors.deepPurple[700],
                child: Text('Forgot Password'),
              ),
              Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.deepPurple[700],
                    child: Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        AuthUtil.signInUserParse(usernameController.text.trim(),
                                passwordController.text.trim())
                            .then((response) {
                          // print("sign in user response is ${response.success}");
                          if (response.success == true) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          }
                        });
                      } else {
                        print('login error');
                      }
                    },
                  )),
              Container(
                  child: Row(
                children: <Widget>[
                  Text('Does not have account?'),
                  FlatButton(
                    textColor: Colors.deepPurple[700],
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: _goToSignUpPage,
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ))
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

  _goToSignUpPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignInPage()));
  }

  // _goToMainPage() {
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => MainPage()));
  // }
}
