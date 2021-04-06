import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/sign_in.dart';
import 'package:flutter_application_1/utilities/multilingual_service.dart';
import 'package:flutter_application_1/widgets/multilingual.dart';

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
              child: Stack(
                children: [
                
 Center(
             child:  Card(
                 color: Colors.white.withOpacity(0.8),
                 child: Padding(
                   padding: const EdgeInsets.only(top:16.0,bottom: 16.0,left: 24,right: 24),
                   child: Column(
                      mainAxisSize: MainAxisSize.min,
                     children: [
                       Text(getText("well_control_simulator", context),
                       style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold) ,
                       ),
                      // Text('Well Control Simulator',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      Text(getText("drilling_operations_driller_and_supervisor_course",context),style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500)),
                     
                     ],
                   ),
                 ),
             )
          ),

          Positioned(
            bottom: 26,
            right: 4,
            child: Image(
                image: AssetImage('assets/images/iconCompanyLogo.png'),
                height: MediaQuery.of(context).size.height*0.15,
                width: MediaQuery.of(context).size.height*0.5,
                fit: BoxFit.contain,
              ),)
                ],
                            
              ),
              
    );
  }
}
