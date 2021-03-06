import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/sign_in.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignIn())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/SplashScreenNew.png'),
              fit: BoxFit.cover)),
              child: Center(
             child:  Card(
               color: Colors.white.withOpacity(0.8),
               child: Padding(
                 padding: const EdgeInsets.only(top:16.0,bottom: 16.0,left: 24,right: 24),
                 child: Column(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                    Text('Well Control Simulator',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Text('Drilling Operations Driller and Supervisor Course',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500))
                   ],
                 ),
               ),
             )
          ),
              
    );
  }
}
