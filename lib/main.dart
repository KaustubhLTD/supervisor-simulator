import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/activity_log.dart';
import 'package:flutter_application_1/activity_selection_screen.dart';
import 'package:flutter_application_1/configuration_details.dart';
import 'package:flutter_application_1/getting_started.dart';
import 'package:flutter_application_1/kill_log.dart';
import 'package:flutter_application_1/kill_sheet.dart';
import 'package:flutter_application_1/kill_sheet_page2.dart';
import 'package:flutter_application_1/kill_sheet_page3.dart';
import 'package:flutter_application_1/kill_sheet_page4.dart';
import 'package:flutter_application_1/mode_selection.dart';
import 'package:flutter_application_1/module1_score.dart';
import 'package:flutter_application_1/module2_score.dart';
import 'package:flutter_application_1/module3_score.dart';
import 'package:flutter_application_1/sign_in.dart';
import 'package:flutter_application_1/simulation_graph.dart';
import 'package:flutter_application_1/skill_assessment.dart';
import 'package:flutter_application_1/splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'widgets/multilingual.dart';




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
        errorColor: Colors.grey,
       
        primarySwatch: Colors.blue,
       
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: KillLog(),  
       supportedLocales: [
        Locale('en', 'US'),
  ],
      localizationsDelegates: [
        Multilingual.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocaleLanguage in supportedLocales) {
          if (supportedLocaleLanguage.languageCode == locale.languageCode &&
              supportedLocaleLanguage.countryCode == locale.countryCode) {
            return supportedLocaleLanguage;
          }
        }
        return supportedLocales.first;
      },
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
          child: Guidelines(settings.arguments),
           type: PageTransitionType.rightToLeftWithFade
       );
       break;
        case '/configuration':
       return PageTransition(
          child: Configuration(settings.arguments),
           type: PageTransitionType.rightToLeftWithFade
       );
       break;
       
        case '/activityselection':
       return PageTransition(
          child: 
            // ActivitySelectionScreen(),
           ActivitySelectionScreen(settings.arguments),
           type: PageTransitionType.rightToLeftWithFade
       );
       break;
         case '/activitylog':
       return PageTransition(
          child: 
            // ActivitySelectionScreen(),
           ActivityLog
           (),
           type: PageTransitionType.rightToLeftWithFade
       );
       break;

        case '/killlog':
       return PageTransition(
          child: 
            // ActivitySelectionScreen(),
           KillLog(),
           type: PageTransitionType.rightToLeftWithFade
       );
       break;

        case '/killsheet':
       return PageTransition(
          child: KillSheet(settings.arguments),
           type: PageTransitionType.rightToLeftWithFade
       );
       break;


    }
   

  }
}

