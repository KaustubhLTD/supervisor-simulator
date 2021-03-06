import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/constants.dart';

class KillSheet extends StatefulWidget {
  @override
  _KillSheetState createState() => _KillSheetState();
}

class _KillSheetState extends State<KillSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: SafeArea(
            child: Column(
          children: [
            Container(
              color: Colors.blue,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('1 of 4')],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
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
                        Text(
                          'Kill Sheet',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Text('Next',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              // color: Colors.blue,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('WELL CONTROL PRE-KICK DATA SHEET')],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('(surface BOP stack))')],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      overallMeasurement(), //Overall Mesurements
                      Container(
                        // height: 50,
                        color: Colors.grey.withOpacity(0.4),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                          child: Row(
                            children: [
                              Text('CAPACITIES AND VOLUME'),
                            ],
                          ),
                        ),
                      ),
                      capacitiesAndVolumeTableView(), //Capacities And Volume Table View
                    ],
                  ),
                ),
              ),
            )
          ],
        )));
  }

  Widget overallMeasurement() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: nameValue('Name:', '', '')),
                Expanded(child: nameValue('Date:', '', '')),
                Expanded(child: nameValue('Level:', '', '')),
              ],
            ),
            Row(
              children: [
                Expanded(child: nameValue('Mesured Depth from RKB:', '', 'ft')),
                SizedBox(width: 14),
                Expanded(
                    child:
                        nameValue('True Vertical Depth from RKB:', '', 'ft')),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: nameValue(
                        'Mesured Casing Shoe Depth from RKB:', '', 'ft')),
                SizedBox(width: 14),
                Expanded(
                    child: nameValue('TVD Casing Shoe from RKB:', '', 'ft')),
              ],
            ),
            Row(
              children: [
                Expanded(child: nameValue('Water Depth', '', 'ft')),
                SizedBox(width: 14),
                Expanded(child: nameValue('Air Gap:', '', 'ft')),
              ],
            ),
            Row(
              children: [
                Expanded(child: nameValue('Current Mud Weight', '', 'ppg')),
                SizedBox(width: MediaQuery.of(context).size.width * 0.5),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget nameValue(String name, String value, String unit) {
    return Row(children: [
      Text(
        name,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: TextFormField(
              decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.all(6.0),
            hintText: value,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(5.7),
            ),
          )),
        ),
      ),
      Text(unit),
    ]);
  }

  Widget capacitiesAndVolumeTableView() {
    return Container(
        margin: EdgeInsets.only(left:2,right: 2),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                   
                  ),
      // margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                 flex:2,
                child: Table(
                  columnWidths: {
                    0: FlexColumnWidth(3),
                    // 1: FlexColumnWidth(2),
                    // 2: FlexColumnWidth(4),
                  },    
                  
                    border: TableBorder(
                       verticalInside: BorderSide(color: Colors.grey),
                                 horizontalInside: BorderSide(color: Colors.grey),),
                               
                  children: [
                    TableRow(children: [
                      Container(
                        height: 60,
                       
                        child: Center(child: Text('DRILLING STRING DATA')),
                      ),
                      Container(
                        height: 60,
                        child: Center(child: Text('O.D.(in)')),
                      ),
                      Container(
                        height: 60,
                        child: Center(child: Text('I.D.(in)')),
                      ),
                      Container(
                        height: 60,
                        child: Center(child: Text('Wt.(lb/ft)')),
                      ),
                    ]),
                    TableRow(children: [
                      Container(
                        height: 60,
                         width:100,
                        child: Center(child: Text('DRILL PIPE')),
                      ),
                      Container(
                        height: 60,
                        child: Center(child: Text('5.0')),
                      ),
                      Container(
                        height: 60,
                        child: Center(child: Text('4.3')),
                      ),
                      Container(
                        height: 60,
                        child: Center(child: Text('')),
                      ),
                    ]),
                    TableRow(children: [
                      Container(
                        height: 60,
                         width:100,
                        child: Center(child: Text('HWDP')),
                      ),
                      Container(
                        height: 60,
                        child: Center(child: Text('5.0')),
                      ),
                      Container(
                        height: 60,
                        child: Center(child: Text('3.0')),
                      ),
                      Container(
                        height: 60,
                        child: Center(child: Text('')),
                      ),
                    ]),
                     TableRow(children: [
                      Container(
                        height: 60,
                         width:100,
                        child: Center(child: Text('DRILL COLLARS')),
                      ),
                      Container(
                        height: 60,
                        child: Center(child: Text('5.0')),
                      ),
                      Container(
                        height: 60,
                        child: Center(child: Text('3.0')),
                      ),
                      Container(
                        height: 60,
                        child: Center(child: Text('')),
                      ),
                    ]),
                  ],
                ),
              ),
              Expanded(
                flex:1,
                child: Column(
                  children: [
                    Table(
                        border: TableBorder(
                       verticalInside: BorderSide(color: Colors.grey),
                                 horizontalInside: BorderSide(color: Colors.grey),
                                  left: BorderSide(color: Colors.grey)
                                 ),
                                 
                      children: [
                        TableRow(children: [
                          Container(
                            height: 30,
                            child: Center(
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                  Text('CAPACITY'),
                                  Text('*'),
                                  Text('LENGTH'),
                                  Text('='),
                                  Text('VOLUME'),
                                ])),
                          ),
                        ])
                      ],
                    ),
                    // Container(
                    //   height: 30,
                    //   child: Text('hello')),
                    Table(
                      // defaultColumnWidth: FixedColumnWidth(120.0),
                       border: TableBorder(
                       verticalInside: BorderSide(color: Colors.grey),
                                 horizontalInside: BorderSide(color: Colors.grey),
                                  left: BorderSide(color: Colors.grey)
                                 ),
                      children: [
                        TableRow(children: [
                          Container(
                            height: 30,
                            child: Center(child: Text('(bbl/ft)',style: TextStyle(fontSize: 12),),),
                          ),
                          Container(
                            height: 30,
                            child: Center(child: Text('(ft)',style: TextStyle(fontSize: 12)),),
                          ),
                          Container(
                            height: 30,
                            child: Center(child: Text('(bbl)',style: TextStyle(fontSize: 12)),),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            height: 60,
                            child: Center(child: Text('0.0.178')),
                          ),
                          Container(
                            height: 60,
                            child: Center(child: Text('7160')),
                          ),
                          Container(
                            height: 60,
                            child: Center(child: Text('127.4')),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            height: 60,
                            child: Center(child: Text('0.0087')),
                          ),
                          Container(
                            height: 60,
                            child: Center(child: Text('240')),
                          ),
                          Container(
                            height: 60,
                            child: Center(child: Text('2.1')),
                          ),
                        ]),
                           TableRow(children: [
                          Container(
                            height: 60,
                            child: Center(child: Text('0.0087')),
                          ),
                          Container(
                            height: 60,
                            child: Center(child: Text('240')),
                          ),
                          Container(
                            height: 60,
                            child: Center(child: Text('2.1')),
                          ),
                        ]),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                              child: Table(children: [
                   TableRow(children: [
                            Container(
                              height: 30,
                              child: Center(child: Text('(bbl/ft)',style: TextStyle(fontSize: 12),),),
                            ),
                ],)
            ],
          ),
              )
        ],
      ),
        ]),
    );
  }
}
