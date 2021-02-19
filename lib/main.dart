import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haate_haate/sign_in.dart';
import 'package:haate_haate/sign_up.dart';
import 'package:haate_haate/splashscreen.dart';
import 'checkinginternetconnection.dart';


void main() {
  ConnectionStatusSingleton connectionStatus = ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown])
      .then((_) {
    runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new SplashScreen(),

    routes:  <String, WidgetBuilder>{
        //'SignUp': (BuildContext context) => new SignUp(),
      //'CheckConnection': (BuildContext context) => new CheckConnection(),
      'SignUp': (BuildContext context) => new SignUp(),
      },
    ));
  });

}

