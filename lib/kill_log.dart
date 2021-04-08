import 'package:flutter/material.dart';
import 'package:flutter_application_1/mode_selection.dart';
import 'package:flutter_application_1/utilities/constants.dart';
import 'package:flutter_application_1/utilities/multilingual_service.dart';

class KillLog extends StatefulWidget {
   SelectedConfigurations sc;
   KillLog(this.sc);

  @override
  _KillLogState createState() => _KillLogState(sc);
}

class _KillLogState extends State<KillLog> {
   SelectedConfigurations sc;
   _KillLogState(this.sc);
  final List<Map<String, String>> listOfColumns = [
    {
      "time": "00:09:54",
      "strokes_pump": "0",
      "strokes_counter": "0",
      "dpp": "646",
      "cp": "748",
      "klp": "111",
      "bhp": "6732",
      "casing_shoe": "4805",
      "pit_volume": "8.1",
      "formation_pressure": "6739",
      "co": "0.0000",
      "spm": "0"
    },
   {
      "time": "00:09:54",
      "strokes_pump": "0",
      "strokes_counter": "0",
      "dpp": "646",
      "cp": "748",
      "klp": "111",
      "bhp": "6732",
      "casing_shoe": "4805",
      "pit_volume": "8.1",
      "formation_pressure": "6739",
      "co": "0.0000",
      "spm": "0"
    },
     {
      "time": "00:09:54",
      "strokes_pump": "0",
      "strokes_counter": "0",
      "dpp": "646",
      "cp": "748",
      "klp": "111",
      "bhp": "6732",
      "casing_shoe": "4805",
      "pit_volume": "8.1",
      "formation_pressure": "6739",
      "co": "0.0000",
      "spm": "0"
    },
     {
      "time": "00:09:54",
      "strokes_pump": "0",
      "strokes_counter": "0",
      "dpp": "646",
      "cp": "748",
      "klp": "111",
      "bhp": "6732",
      "casing_shoe": "4805",
      "pit_volume": "8.1",
      "formation_pressure": "6739",
      "co": "0.0000",
      "spm": "0"
    },
     {
      "time": "00:09:54",
      "strokes_pump": "0",
      "strokes_counter": "0",
      "dpp": "646",
      "cp": "748",
      "klp": "111",
      "bhp": "6732",
      "casing_shoe": "4805",
      "pit_volume": "8.1",
      "formation_pressure": "6739",
      "co": "0.0000",
      "spm": "0"
    },
     {
      "time": "00:09:54",
      "strokes_pump": "0",
      "strokes_counter": "0",
      "dpp": "646",
      "cp": "748",
      "klp": "111",
      "bhp": "6732",
      "casing_shoe": "4805",
      "pit_volume": "8.1",
      "formation_pressure": "6739",
      "co": "0.0000",
      "spm": "0"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      // ConstrainedBox(
      //   constraints: BoxConstraints.expand( 
      //             width: MediaQuery.of(context).size.width
      //   ),
      
      SafeArea(
              child: ConstrainedBox(
           constraints: BoxConstraints.expand( 
                    width: MediaQuery.of(context).size.width
          ),
                child: 
                Column(
                 
                  children: [
                     Container(
              height: 50,
              color: Colors.grey,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                    Navigator.pop(context);
                    },
                                      child: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70, width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          color: Constants.textColor,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.home,
                              color: Colors.white,
                            ),
                          )),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: Text(
                  //     getText('your_score', context),
                  //     style: TextStyle(color: Constants.textColor,fontSize: 20,fontWeight: FontWeight.bold ),
                  //   ),
                  // )
                ],
              ),
            ),
                   Container(
          
           margin: const EdgeInsets.all(2.0),
          padding: const EdgeInsets.only(top: 12.0, bottom: 12,left: 10.0,right:10.0),
          decoration:
            BoxDecoration(border: Border.all(color:Color(0xff012160))),
          child: 
          Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Expanded(
               
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                  Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:10),
                      Text('Name: Wait and Weight',style: TextStyle(color:Color(0xff012160),fontSize: 12,fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height:30),
                   Text('Session: 31/03/2021, 2:33 PM',style: TextStyle(color:Color(0xff012160),fontSize: 12,fontWeight: FontWeight.bold)),
                 
                ],),
              ),
              Expanded(
                // flex: 1,
                child: Center(child: Text('Kill Log',style: TextStyle(color:Color(0xff012160),fontSize:20,fontWeight: FontWeight.bold),))),
               Expanded(
                
                                child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                 
                   Text('Wait and Weight',style: TextStyle(color:Color(0xff012160),fontSize: 12,fontWeight: FontWeight.bold)),
                    SizedBox(height:30),
                  Text('Choke Plugging',style: TextStyle(color:Color(0xff012160),fontSize: 12,fontWeight: FontWeight.bold)),
              ],),
               ),
            ],
          ),
          ),
     
          
          
                    Padding(
                      padding: const EdgeInsets.only(left:2.0,right: 2.0),
                      child: Table(
                        children: [
                         sc.selectedRig=="Surface" ? 
                         TableRow(
                         decoration: new BoxDecoration(
                  color: Colors.grey
                ),
                            children: [
                             Container(
                               height: 40,
                               child: Center(
                                 child: Text(getText('time', context),
                                    textAlign: TextAlign.center,
                                     style: TextStyle(fontSize: 12),
                                    ),
                               ),
                             ) ,
                               Container(
                                    height: 40,
                                 child: Center(
                                 child: Text(getText('strokes_pump', context),
                                    textAlign: TextAlign.center,
                                     style: TextStyle(fontSize: 12),
                                    ),
                             ),
                               ) ,
                               Container(
                                    height: 40,
                                 child: Center(
                                 child: Text(getText('strokes_counter', context),
                                    textAlign: TextAlign.center,
                                     style: TextStyle(fontSize: 12),
                                    ),
                             ),
                               ),
                             Container(
                                  height: 40,
                               child: Center(
                                 child: Text(getText('dpp', context),
                                    textAlign: TextAlign.center,
                                     style: TextStyle(fontSize: 12),
                                    ),
                               ),
                             ) , 
                              Container(
                                   height: 40,
                                                            child: Center(
                                 child: Text(getText('cp', context),
                                    textAlign: TextAlign.center,
                                     style: TextStyle(fontSize: 12),
                                    ),
                             ),
                              ) ,
                             
                          //  sc.selectedRig == 'Subsea' ? Container(
                          //          height: 40,
                          //                                   child: Center(
                          //        child: Text(getText('KLP', context),
                          //           textAlign: TextAlign.center,
                          //            style: TextStyle(fontSize: 12),
                          //           ),
                          //    ),
                          //     ): SizedBox(),  
                               Container(
                                    height: 40,
                                 child: Center(
                                 child: Text(getText('bhp', context),
                                    textAlign: TextAlign.center,
                                     style: TextStyle(fontSize: 12),
                                    ),
                             ),
                               ) , 
                              Container(
                                   height: 40,
                                child: Center(
                                 child: Text(getText('casing_shoe', context),
                                    textAlign: TextAlign.center,
                                     style: TextStyle(fontSize: 12),
                                    ),
                             ),
                              ) , 
                              Container(
                                   height: 40,
                                child: Center(
                                 child: Text(getText('pit_volume', context),
                                    textAlign: TextAlign.center,
                                     style: TextStyle(fontSize: 12),
                                    ),
                             ),
                              ) , 
                              Container(
                                   height: 40,
                                child: Center(
                                 child: Text(getText('formation_pressure', context),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 12),
                                    ),
                             ),
                              ) , 
                              Container(
                                   height: 40,
                                child: Center(
                                 child: Text(getText('co', context),
                                    textAlign: TextAlign.center,
                                     style: TextStyle(fontSize: 12),
                                    ),
                             ),
                              ) , 
                              Container(
                                   height: 40,
                                child: Center(
                                 child: Text(getText('spm', context),
                                    textAlign: TextAlign.center,
                                     style: TextStyle(fontSize: 12),
                                    ),
                             ),
                              ) , 
                           


                            ]
                          ) 
                          :
                          TableRow(
                         decoration: new BoxDecoration(
                  color: Colors.grey
                ),
                            children: [
                             Container(
                               height: 40,
                               child: Center(
                                 child: Text(getText('time', context),
                                    textAlign: TextAlign.center,
                                     style: TextStyle(fontSize: 12),
                                    ),
                               ),
                             ) ,
                               Container(
                                    height: 40,
                                 child: Center(
                                 child: Text(getText('strokes_pump', context),
                                    textAlign: TextAlign.center,
                                     style: TextStyle(fontSize: 12),
                                    ),
                             ),
                               ) ,
                               Container(
                                    height: 40,
                                 child: Center(
                                 child: Text(getText('strokes_counter', context),
                                    textAlign: TextAlign.center,
                                     style: TextStyle(fontSize: 12),
                                    ),
                             ),
                               ),
                             Container(
                                  height: 40,
                               child: Center(
                                 child: Text(getText('dpp', context),
                                    textAlign: TextAlign.center,
                                     style: TextStyle(fontSize: 12),
                                    ),
                               ),
                             ) , 
                              Container(
                                   height: 40,
                                                            child: Center(
                                 child: Text(getText('cp', context),
                                    textAlign: TextAlign.center,
                                     style: TextStyle(fontSize: 12),
                                    ),
                             ),
                              ) ,
                             
                           Container(
                                   height: 40,
                                                            child: Center(
                                 child: Text(getText('KLP', context),
                                    textAlign: TextAlign.center,
                                     style: TextStyle(fontSize: 12),
                                    ),
                             )),
                     
                               Container(
                                    height: 40,
                                 child: Center(
                                 child: Text(getText('bhp', context),
                                    textAlign: TextAlign.center,
                                     style: TextStyle(fontSize: 12),
                                    ),
                             ),
                               ) , 
                              Container(
                                   height: 40,
                                child: Center(
                                 child: Text(getText('casing_shoe', context),
                                    textAlign: TextAlign.center,
                                     style: TextStyle(fontSize: 12),
                                    ),
                             ),
                              ) , 
                              Container(
                                   height: 40,
                                child: Center(
                                 child: Text(getText('pit_volume', context),
                                    textAlign: TextAlign.center,
                                     style: TextStyle(fontSize: 12),
                                    ),
                             ),
                              ) , 
                              Container(
                                   height: 40,
                                child: Center(
                                 child: Text(getText('formation_pressure', context),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 12),
                                    ),
                             ),
                              ) , 
                              Container(
                                   height: 40,
                                child: Center(
                                 child: Text(getText('co', context),
                                    textAlign: TextAlign.center,
                                     style: TextStyle(fontSize: 12),
                                    ),
                             ),
                              ) , 
                              Container(
                                   height: 40,
                                child: Center(
                                 child: Text(getText('spm', context),
                                    textAlign: TextAlign.center,
                                     style: TextStyle(fontSize: 12),
                                    ),
                             ),
                              ) , 
                           


                            ]
                          )
                        ],

                      ),
                    ),

                     Expanded(
                                            child: SingleChildScrollView(

                                              child: Padding(
                                                padding: const EdgeInsets.only(left:2.0,right:2),
                                                child: Table(
                                           border: TableBorder(
                            
                              horizontalInside: BorderSide(
                                    color: Colors.grey[300],
                              ),
                             
                            ),
                           children: [
                                  for(var element in listOfColumns )  
                         sc.selectedRig == 'Surface'?    TableRow(
                               children: [
                               Container(height:40,child: Center(child: FittedBox(child: Text(element["time"])))),
                                Container(height:40,child: Center(child: FittedBox(child: Text(element["strokes_pump"])))),
                                 Container(height:40,child: Center(child: FittedBox(child: Text(element["strokes_counter"])))),
                                  Container(height:40,child: Center(child: FittedBox(child: Text(element["dpp"]))))
                              ,
                              Container(height:40,child: Center(child: FittedBox(child: Text(element["cp"])))),
                  
                                Container(height:40,child: Center(child: FittedBox(child: Text(element["bhp"])))),
                                 Container(height:40,child: Center(child: FittedBox(child: Text(element["casing_shoe"])))),
                                  Container(height:40,child:Center(child: FittedBox(child: Text(element["pit_volume"])))),
                                 Container(height:40,child: Center(child: FittedBox(child: Text(element["formation_pressure"])))),
                              Container(height:40,child:  Center(child: FittedBox(child: Text(element["co"]))
                              )),
                              Container(height:40,child:  Center(child: FittedBox(child: Text(element["spm"])))),

                                

                               ]):
                             
                            TableRow(
                               children: [
                               Container(height:40,child: Center(child: FittedBox(child: Text(element["time"])))),
                                Container(height:40,child: Center(child: FittedBox(child: Text(element["strokes_pump"])))),
                                 Container(height:40,child: Center(child: FittedBox(child: Text(element["strokes_counter"])))),
                                  Container(height:40,child: Center(child: FittedBox(child: Text(element["dpp"]))))
                              ,
                              Container(height:40,child: Center(child: FittedBox(child: Text(element["cp"])))),
                                Container(height:40,child: Center(child: FittedBox(child: Text(element["klp"])))),
                  
                                Container(height:40,child: Center(child: FittedBox(child: Text(element["bhp"])))),
                                 Container(height:40,child: Center(child: FittedBox(child: Text(element["casing_shoe"])))),
                                  Container(height:40,child:Center(child: FittedBox(child: Text(element["pit_volume"])))),
                                 Container(height:40,child: Center(child: FittedBox(child: Text(element["formation_pressure"])))),
                              Container(height:40,child:  Center(child: FittedBox(child: Text(element["co"]))
                              )),
                              Container(height:40,child:  Center(child: FittedBox(child: Text(element["spm"])))),

                                

                               ])
                           ]
                             //  listOfColumns // Loops through dataColumnText, each iteration assigning the value to element
                             //           .map(
                             //             ((element) => 
                           
                             ),
                                              ),
                       ),
                     ),
                  ],
                ),
        ),
      ),
    );
  }
}
