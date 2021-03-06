import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/mode_selection.dart';

class Guidelines extends StatefulWidget {
  SelectedConfigurations sc;
  Guidelines(this.sc);
  @override
  _GuidelinesState createState() => _GuidelinesState(sc);
}

class _GuidelinesState extends State<Guidelines> {
   SelectedConfigurations sc;
  _GuidelinesState(this.sc);

  bool _lights = false;
  @override
  Widget build(BuildContext context) {
     print('hello' +sc.selectedRig.toString());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              color: Colors.grey.withOpacity(0.2),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/iconCompanyLogo.png'),
                    height: 50,
                    width: 100,
                  ),
                  Text(
                    'Getting Started With',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Simulator for Drilling Operations Supervisor Course',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Container(
                  width: double.infinity,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                          'At the end of this simulation, you will be able to learn and/or evaluate yourself on how to:',
                          style: TextStyle(
                            fontSize: kIsWeb? 22 : 0,
                            ),
                        ),
                      SizedBox(height: 12),
                      Text(
                          '\u2022 Verify pre-operational setups before begining the kill operations.',
                          style: TextStyle(
                              fontSize: kIsWeb? 18 : 0,
                            )),
                      Text(
                          '\u2022 Prepare yourself and the crew for the kill operation.',
                          style: TextStyle(   fontSize: kIsWeb? 18 : 0,)),
                      Text(
                          '\u2022 Carry-out the kill operation while keeping the BHP constant.',
                          style: TextStyle(   fontSize: kIsWeb? 18 : 0,)),
                      Text(
                          '\u2022 Detect and resolve the problems occuring during kill operation.',
                          style: TextStyle(   fontSize: kIsWeb? 18 : 0,))
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Image(
                image: AssetImage('assets/images/guideline.PNG',),
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 6,
                      ),
                      Text('This is what you need to do:',
                        style: TextStyle(   fontSize: kIsWeb? 18 : 0,)
                       ),
                      SizedBox(height: 12),
                      Text(
                          '\u2022 Tap the first procedure in each Module, e.g. Line-up BOP Panel.',
                          style: TextStyle(   fontSize: kIsWeb? 18 : 0,)),
                      Text(
                          '\u2022 On the next screen perform the activity based on the Hints provided.',
                          style: TextStyle(   fontSize: kIsWeb? 18 : 0,)),
                      Text(
                          '\u2022 Once you are done with the procedure return back to the Home Screen by tapping on the "Done" button.',
                          style: TextStyle(   fontSize: kIsWeb? 18 : 0,)),
                      Text(
                          '\u2022 Continue int this manner for all activities under Module 1 2 and 3 until you obtain your final score under "Skill Assesment Grade".',
                          style: TextStyle(   fontSize: kIsWeb? 18 : 0,))
                    ],
                  )),
            ),
            // Container(
            //   color: Colors.grey.withOpacity(0.2),
            //   width: double.infinity,
            //   child: Row(
            //     // crossAxisAlignment: CrossAxisAlignment.center,
            //     // mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
                 
            //       SizedBox(height: 10)
            //     ],
            //   ),
            // ),
          
                  
                                    Padding(
                                      padding: const EdgeInsets.only(left:8.0,right: 8.0),
                                      child: Row(
                                          children: [
                                              CupertinoSwitch(
                                              value: _lights,
                                              onChanged: (bool value) {
                                                setState(() {
                                                  _lights = value;
                                                });
                                              },
                                            ),
                                             Text('Dont show me again'),
                                             Spacer(),
                                               RaisedButton(
                                                 shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(18.0),
 
),

             color:Colors.blue,
             child: Text('Continue',style: TextStyle(color: Colors.white),),
            onPressed: (){
              Navigator.pushNamed(context, '/configuration',arguments: sc);
           
          }),
                                          ],
                                         
                                       
                  ),
                                    ),
          ]
        )),
      ),
    );
  }
}
