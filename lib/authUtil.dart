import 'package:parse_server_sdk/parse_server_sdk.dart';

class AuthUtil {
  static Future<ParseResponse> signInUserParse(
    username,
    password,
  ) async {
    ParseUser user = ParseUser(
      username,
      password,
      username,
    );
    return await user.login();
  }

  static Future<ParseResponse> registerUserParse(
    username,
    password,
  ) async {
    var user = ParseUser.createUser(username, password, username);
    return await user.signUp();
  }

  static Future<dynamic> getCurrentUser() async {
    try {
      var user = await ParseUser.currentUser();
      // var user = ParseUser.getCurrentUserFromServer('safsdkfsdfjskbj',)
      if (user == null) {
        print("haven't login yet");
      } else {
        print(user);
      }
      return user;
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  static Future<ParseResponse> logOut() async {
    var user = await ParseUser.currentUser();
    var response = await user.logout();
    if (response.success) {
      print('User logout');
    }
  }

  static Future<dynamic> fullTextSearch() async {
    // print('1111111');
    QueryBuilder<ParseObject> parseQuery =
        QueryBuilder<ParseObject>(ParseObject('User'))
          ..whereContainsWholeWord('email', 'vyhnt');
    var apiResponse = await parseQuery.query();
    return apiResponse;
  }
}
