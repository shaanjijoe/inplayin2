import 'package:flutter/services.dart';
import 'package:inplayin2/Services/context_utility.dart';
import 'package:inplayin2/forgot_password/forgotpassword.dart';
import 'package:inplayin2/pages/homepage.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/material.dart';

// class for hanldling universal links
class UniServices {
  static String _code = ''; //Stores path
  static String get code => _code; //Returns existing path
  static bool get hasCode => _code.isNotEmpty; //Returns whether _code initialized or not

  static void reset() => _code = ''; // Resets _code


  static init() async {
    print("URI services starting.");
    try{
      final Uri? uri = await getInitialUri();
      uriHandler(uri);
    } on PlatformException {
      print("Failed to recieve code");
    } on FormatException {
      print("Wrong Format Code Recieved");
    }

    uriLinkStream.listen((Uri? uri) async{
        uriHandler(uri);
    },
      onError: (error) {
      print("Onurilink error: $error");
      }
    );



  }


  static uriHandler(Uri? uri){
    print("uriHandler called");
    if(uri == null || uri.queryParameters.isEmpty) {
      return;
    }

    Map<String, String> parameters = uri.queryParameters;

    String recievedCode = parameters['code'] ?? '';
    print("Something");
    print(recievedCode);

    if(recievedCode=='forgotpassword'){
      Navigator.pushNamed(ContextUtility.context!, '/forgotpassword');
    }

  }
}