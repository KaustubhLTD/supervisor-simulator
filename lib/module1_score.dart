import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/constants.dart';
import 'package:flutter_application_1/utilities/multilingual_service.dart';

class Module1Score extends StatefulWidget {
  @override
  _Module1ScoreState createState() => _Module1ScoreState();
}

class _Module1ScoreState extends State<Module1Score> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 90,
              color: Colors.grey,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      getText('your_score', context),
                      style: TextStyle(color: Constants.textColor,fontSize: 20,fontWeight: FontWeight.bold ),
                    ),
                  )
                ],
              ),
            ),
            Table(
              columnWidths: {
                1: FlexColumnWidth(3),
              },
              border: TableBorder(
                verticalInside: BorderSide(color: Colors.grey),
                horizontalInside: BorderSide(color: Colors.grey),

                top: BorderSide(color: Colors.grey),
                // left: BorderSide(color: Colors.grey),
                right: BorderSide(color: Colors.grey),
              ),
              children: [
                TableRow(children: [
                  Container(
                    color: Colors.yellow[100],
                    height: 50,
                    child: Center(
                        child: Text(
                      getText('assessment_topic', context),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                    )),
                  ),
                  Container(
                    color: Colors.yellow[100],
                    height: 50,
                     child: Center(
                       child: Text(
                        getText('action_to_take', context),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                    ),
                     )
                  ),
                  Container(
                    color: Colors.yellow[100],
                    height: 50,
                    child: Center(
                       child: Text(
                        getText('maximum_points', context),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                    ), 
                    ),
                  ),
                  Container(
                    color: Colors.yellow[100],
                    height: 50,
                    child: Center(
                        child: Text(
                        getText('score', context),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                    ), 
                       ),
                  ),
                ])
              ],
            ),
            Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Table(
                  columnWidths: {
                    1: FlexColumnWidth(3),
                  },
                  border: TableBorder.all(width: 1.0, color: Colors.grey),
                  children: [
                    TableRow(children: [
                      Container(
                        height: 200,
                        child: Center(
                               child: Text(
                        getText('line_up_equipment', context),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                    ), 
                              ),
                      ),
                      Container(
                          child: Table(
                        border: TableBorder(
                          // verticalInside: BorderSide(color: Colors.black,width: 1),
                          horizontalInside: BorderSide(
                                color: Colors.grey,
                          ),
                          // top: BorderSide(color: Colors.grey),
                          // bottom: BorderSide(color: Colors.grey),
                          // right: BorderSide(color: Colors.grey),
                          // left: BorderSide(color: Colors.grey)
                        ),
                        children: [
                          TableRow(children: [
                                Container(
                                  height: 40,
                                  child: Center(
                                     child: Text(
                        getText('line_up_bop_panel', context),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14,),
                    ), 
                                  ),
                                ),
                          ]),
                          TableRow(children: [
                                Container(
                                  height: 40,
                                  child: Center(
                                     child: Text(
                        getText('line_up_choke_panel', context),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14,),
                    ), 
                                  ),
                                ),
                          ]),
                          TableRow(children: [
                                Container(
                                  height: 40,
                                  child: Center(
                                      child: Text(
                        getText('line_up_standpipe_manifold', context),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14,),
                    ), 
                                  ),
                                ),
                          ]),
                          TableRow(children: [
                                Container(
                                  height: 40,
                                  child: Center(
                                      child: Text(
                        getText('line_up_choke_manifold', context),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14,),
                    ), 
                                  ),
                                ),
                          ]),
                          TableRow(children: [
                                Container(
                                  height: 40,
                                  child: Center(
                                      child: Text(
                        getText('line_up_trip_tank', context),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14,),
                    ), 
                                  ),
                                ),
                          ])
                        ],
                      )
                          // height: 40,
                          // child: Center(
                          //     child: Text(
                          //  'b',
                          //   style: TextStyle(fontSize: 14),
                          // )),
                          ),
                      Container(
                        child: Table(
                          border: TableBorder(
                                verticalInside: BorderSide(color: Colors.grey),
                                horizontalInside: BorderSide(color: Colors.grey),
                                top: BorderSide(color: Colors.grey),
                                bottom: BorderSide(color: Colors.grey),
                                // right: BorderSide(color: Colors.grey),
                                // left: BorderSide(color: Colors.grey)),
                          ),
                          children: [
                                TableRow(children: [
                                  Container(
                                    height: 40,
                                    child: Center(
                                        child: Text(
                                     getText('1.0',context),
                                      style: TextStyle(fontSize: 14),
                                    )),
                                  ),
                                ]),
                                TableRow(children: [
                                  Container(
                                    height: 40,
                                    child: Center(
                                        child: Text(
                                      getText('1.0',context),
                                      style: TextStyle(fontSize: 14),
                                    )),
                                  ),
                                ]),
                                TableRow(children: [
                                  Container(
                                    height: 40,
                                    child: Center(
                                        child: Text(
                                      getText('1.0',context),
                                      style: TextStyle(fontSize: 14),
                                    )),
                                  ),
                                ]),
                                TableRow(children: [
                                  Container(
                                    height: 40,
                                    child: Center(
                                        child: Text(
                                      getText('1.0',context),
                                      style: TextStyle(fontSize: 14),
                                    )),
                                  ),
                                ]),
                                TableRow(children: [
                                  Container(
                                    height: 40,
                                    child: Center(
                                        child: Text(
                                     getText('1.0',context),
                                      style: TextStyle(fontSize: 14),
                                    )),
                                  ),
                                ])
                          ],
                        ),
                      ),
                      Container(
                          child: Table(
                        border: TableBorder(
                          verticalInside: BorderSide(color: Colors.grey),
                          horizontalInside: BorderSide(color: Colors.grey),
                          top: BorderSide(color: Colors.grey),
                          bottom: BorderSide(color: Colors.grey),
                          // right: BorderSide(color: Colors.grey),
                        ),
                        children: [
                          TableRow(children: [
                                Container(
                                  height: 40,
                                  child: Center(
                                      child: Text(
                                    getText('1.0',context),
                                    style: TextStyle(fontSize: 14),
                                  )),
                                ),
                          ]),
                          TableRow(children: [
                                Container(
                                  height: 40,
                                  child: Center(
                                      child: Text(
                                    getText('1.0',context),
                                    style: TextStyle(fontSize: 14),
                                  )),
                                ),
                          ]),
                          TableRow(children: [
                                Container(
                                  height: 40,
                                  child: Center(
                                      child: Text(
                                     getText('1.0',context),
                                    style: TextStyle(fontSize: 14),
                                  )),
                                ),
                          ]),
                          TableRow(children: [
                                Container(
                                  height: 40,
                                  child: Center(
                                      child: Text(
                                    getText('1.0',context),
                                    style: TextStyle(fontSize: 14),
                                  )),
                                ),
                          ]),
                          TableRow(children: [
                                Container(
                                  height: 40,
                                  child: Center(
                                      child: Text(
                                    getText('1.0',context),
                                    style: TextStyle(fontSize: 14),
                                  )),
                                ),
                          ])
                        ],
                      )),
                    ])
                  ],
                ),

                 Table(
              columnWidths: {
                1: FlexColumnWidth(3),
              },
                border: TableBorder(
                        verticalInside: BorderSide(color: Colors.grey),
                        // horizontalInside: BorderSide(color: Colors.grey),
                        // top: BorderSide(color: Colors.grey),
                        bottom: BorderSide(color: Colors.grey),
                        right: BorderSide(color: Colors.grey),
                        left: BorderSide(color: Colors.grey),
                      ),
              // border: TableBorder.all(width: 1.0, color: Colors.grey),
              children: [
                TableRow(children: [
                  Container(
                    height: 160,
                    child: Center(
                         child: Text(
                        getText('check_set_pressure', context),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                    ), 
                    ),
                  ),
                  Container(
                      child: Table(
                    border: TableBorder(
                      // verticalInside: BorderSide(color: Colors.black,width: 1),
                      horizontalInside: BorderSide(
                        color: Colors.grey,
                      ),
                      // top: BorderSide(color: Colors.grey),
                      // bottom: BorderSide(color: Colors.grey),
                      // right: BorderSide(color: Colors.grey),
                      // left: BorderSide(color: Colors.grey)
                    ),
                    children: [
                      TableRow(children: [
                        Container(
                          height: 40,
                          child: Center(
                              child: Text(
                        getText('check_air_pressure', context),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14,),
                    ), 
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Container(
                          height: 40,
                          child: Center(
                              child: Text(
                        getText('check_accumulator_pressure', context),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14,),
                    ), ),
                        ),
                      ]),
                      TableRow(children: [
                        Container(
                          height: 40,
                          child: Center(
                              child: Text(
                        getText('check_ram_and_stack_valve_operating_pressure', context),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14,),
                    ), ),
                        ),
                      ]),
                      TableRow(children: [
                        Container(
                          height: 40,
                          child: Center(
                              child: Text(
                        getText('check_annular_operating_pressure', context),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14,),
                    ), ),
                        ),
                      ]),
                     
                    ],
                  )
                      // height: 40,
                      // child: Center(
                      //     child: Text(
                      //  'b',
                      //   style: TextStyle(fontSize: 14),
                      // )),
                      ),
                  Container(
                    child: Table(
                      border: TableBorder(
                        verticalInside: BorderSide(color: Colors.grey),
                        horizontalInside: BorderSide(color: Colors.grey),
                        // top: BorderSide(color: Colors.grey),
                        // bottom: BorderSide(color: Colors.grey),
                        // right: BorderSide(color: Colors.grey),
                        // left: BorderSide(color: Colors.grey)),
                      ),
                      children: [
                        TableRow(children: [
                          Container(
                            height: 40,
                            child: Center(
                                child: Text(
                             getText('1.0',context),
                              style: TextStyle(fontSize: 14),
                            )),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            height: 40,
                            child: Center(
                                child: Text(
                              getText('1.0',context),
                              style: TextStyle(fontSize: 14),
                            )),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            height: 40,
                            child: Center(
                                child: Text(
                               getText('1.0',context),
                              style: TextStyle(fontSize: 14),
                            )),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            height: 40,
                            child: Center(
                                child: Text(
                               getText('1.0',context),
                              style: TextStyle(fontSize: 14),
                            )),
                          ),
                        ]),
                       
                      ],
                    ),
                  ),
                  Container(
                      child: Table(
                    border: TableBorder(
                      verticalInside: BorderSide(color: Colors.grey),
                      horizontalInside: BorderSide(color: Colors.grey),
                      // top: BorderSide(color: Colors.grey),
                      // bottom: BorderSide(color: Colors.grey),
                      // right: BorderSide(color: Colors.grey),
                    ),
                    children: [
                      TableRow(children: [
                        Container(
                          height: 40,
                          child: Center(
                              child: Text(
                            getText('1.0',context),
                            style: TextStyle(fontSize: 14),
                          )),
                        ),
                      ]),
                      TableRow(children: [
                        Container(
                          height: 40,
                          child: Center(
                              child: Text(
                             getText('1.0',context),
                            style: TextStyle(fontSize: 14),
                          )),
                        ),
                      ]),
                      TableRow(children: [
                        Container(
                          height: 40,
                          child: Center(
                              child: Text(
                             getText('1.0',context),
                            style: TextStyle(fontSize: 14),
                          )),
                        ),
                      ]),
                      TableRow(children: [
                        Container(
                          height: 40,
                          child: Center(
                              child: Text(
                             getText('1.0',context),
                            style: TextStyle(fontSize: 14),
                          )),
                        ),
                      ]),
                    
                    ],
                  )),
                ])
              ],
            ),
              Table(
              columnWidths: {
                0: FlexColumnWidth(4),
              },
              border: TableBorder(
                verticalInside: BorderSide(color: Colors.grey),
                horizontalInside: BorderSide(color: Colors.grey),
                // top: BorderSide(color: Colors.grey),
                // top: BorderSide(color: Colors.grey),
                // left: BorderSide(color: Colors.grey),
                right: BorderSide(color: Colors.grey),
              ),
              children: [
                TableRow(children: [
                  Container(
                   color: Colors.grey[200],
                    height: 40,
                    child: Center(
                        child: Text(
                      '',
                      style: TextStyle(fontSize: 14),
                    )),
                  ),
                  Container(
                     color: Colors.grey[200],
                    height: 40,
                    child: Center(
                        child: Text(
                      '9.0',
                      style: TextStyle(fontSize: 14),
                    )),
                  ),
                  Container(
                     color: Colors.grey[200],
                    height: 40,
                    child: Center(
                        child: Text(
                      '7.0',
                      style: TextStyle(fontSize: 14),
                    )),
                  ),
                 
                ])
              ],
            ),

             Table(
              columnWidths: {
                0: FlexColumnWidth(4),
              },
              border: TableBorder(
                // verticalInside: BorderSide(color: Colors.grey),
                horizontalInside: BorderSide(color: Colors.grey),
                top: BorderSide(color: Colors.grey),
                // top: BorderSide(color: Colors.grey),
                // left: BorderSide(color: Colors.grey),
                // right: BorderSide(color: Colors.grey),
              ),
              children: [
                TableRow(children: [
                  Container(
                      color: Colors.grey[200],
                    height: 60,
                    child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                     getText('module_1_scoring',context),
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                    ),
                    Checkbox(value: true, onChanged: null ),
                      Text(
                     getText('passed',context),
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                    ),
                     Checkbox(value: false, onChanged: null ),
                      Text(
                     getText('failed',context),
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                    ),
                          ],
                        )),
                  ),
                  Container(
                   color: Colors.grey[200],
                    height: 60,
                    child: Center(
                        child: 
                        RaisedButton(
                          color: Constants.textColor,
                            // color: Constants.themeBlue,
                            textColor: Colors.white,
                            child: Text(getText("reattempt", context)),
                            onPressed: () {
                             
                             
                            })),
                  ),
                 
                 
                ])
              ],
            ),



                              ],
                            ),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
