import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/configuration_details.dart';
import 'package:flutter_application_1/getting_started.dart';
import 'package:flutter_application_1/kill_sheet.dart';
import 'package:flutter_application_1/mode_selection.dart';
import 'package:flutter_application_1/sign_in.dart';
import 'package:flutter_application_1/splash_screen.dart';
import 'package:page_transition/page_transition.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
  DeviceOrientation.landscapeLeft,
  DeviceOrientation.landscapeRight,
]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: routing,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
       
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }

  Route routing(RouteSettings settings){
    switch(settings.name){
       case '/signin':
       return PageTransition(
          child: SignIn(),
           type: PageTransitionType.rightToLeftWithFade
       );
       break;
        case '/modeselection':
       return PageTransition(
          child: ModeSelection(),
           type: PageTransitionType.rightToLeftWithFade
       );
       break;
        case '/guidelines':
       return PageTransition(
          child: Guidelines(),
           type: PageTransitionType.rightToLeftWithFade
       );
       break;
        case '/configuration':
       return PageTransition(
          child: Configuration(),
           type: PageTransitionType.rightToLeftWithFade
       );
       break;


    }
   

  }
}

