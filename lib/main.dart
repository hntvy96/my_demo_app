import 'package:my_demo_app/authUtil.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'welcome.dart';

Future<AuthStatus> initParse() async {
  // final parse = await Parse().initialize(
  //   "af90508ed159044819d017636853a15c8",
  //   "http://10.60.156.110:8337/parse",
  //   masterKey: "5755cf1a6cc444029b21bc4775cd5a70",
  //   debug: true,
  //   coreStore: await CoreStoreSharedPrefsImp.getInstance(),
  // );

  try {
    // final data = await AuthUtil.fullTextSearch();
    // print(data.toString());
    final response = await AuthUtil.getCurrentUser();
    final authStatus =
        response == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
    return authStatus;
  } catch (e) {
    print(e);
    throw e;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Parse().initialize(
    "af90508ed159044819d017636853a15c8",
    "http://10.60.156.110:8337/parse",
    masterKey: "5755cf1a6cc444029b21bc4775cd5a70",
    debug: true,
    coreStore: await CoreStoreSharedPrefsImp.getInstance(),
  );
  AuthStatus authStatus = AuthStatus.notSignedIn;
  try {
    authStatus = await initParse();
  } catch (e) {
    print(e);
  }
  runApp(MaterialApp(
    home: DashBoard(authStatus: authStatus),
  ));
}

enum AuthStatus {
  notDetermined,
  notSignedIn,
  signedIn,
}

class DashBoard extends StatefulWidget {
  final AuthStatus authStatus;
  DashBoard({this.authStatus = AuthStatus.notSignedIn});
  @override
  State<StatefulWidget> createState() => DashBoardState();
}

class DashBoardState extends State<DashBoard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.authStatus) {
      case AuthStatus.notDetermined:
        return _buildWaitingScreen();
      case AuthStatus.notSignedIn:
        return Login(
            // onSignedIn: _signedIn,
            );
      case AuthStatus.signedIn:
        return HomePage(
            // onSignedOut: _signedOut,
            );
    }
    return null;
  }

  Widget _buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text('WAITING'),
      ),
    );
  }
}
