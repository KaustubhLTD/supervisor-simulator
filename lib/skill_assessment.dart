import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/constants.dart';
import 'package:flutter_application_1/utilities/multilingual_service.dart';

class SkillAssessment extends StatefulWidget {
  @override
  _SkillAssessmentState createState() => _SkillAssessmentState();
}

class _SkillAssessmentState extends State<SkillAssessment> {
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
                 
                 
                 
                ])
              ],
            ),

            Table(
                      columnWidths: {
                        1: FlexColumnWidth(3),
                      },
                      border: TableBorder.all(width: 1.0, color: Colors.grey),
                      children: [
                        TableRow(children: [
                          Container(
                            height: 80,
                            child: Center(
                              child: Text(
                                getText('pits_and_valves', context),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
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
                                      getText(
                                          'line_up_pits_pumps_and_valves_to_kill_well',
                                          context),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                              TableRow(children: [
                                Container(
                                  height: 40,
                                  child: Center(
                                    child: Text(
                                      getText('adjust_pit_levels', context),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
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
                                horizontalInside:
                                    BorderSide(color: Colors.grey),
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
                                      '2.0',
                                      //  getText('1.0',context),
                                      style: TextStyle(fontSize: 14),
                                    )),
                                  ),
                                ]),
                                TableRow(children: [
                                  Container(
                                    height: 40,
                                    child: Center(
                                        child: Text(
                                      '2.0',
                                      // getText('1.0',context),
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
                                    '0.0/0.0',
                                    style: TextStyle(fontSize: 14),
                                  )),
                                ),
                              ]),
                              TableRow(children: [
                                Container(
                                  height: 40,
                                  child: Center(
                                      child: Text(
                                    '0.0/2.0',
                                    // getText('1.0',context),
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
                        1: FlexColumnWidth(3),
                      },
                      border: TableBorder(
                          verticalInside: BorderSide(color: Colors.grey),
                          horizontalInside: BorderSide(
                            color: Colors.grey,
                          ),
                          // top: BorderSide(color: Colors.grey),
                          bottom: BorderSide(color: Colors.grey),
                          right: BorderSide(color: Colors.grey),
                          left: BorderSide(color: Colors.grey)),
                      children: [
                        TableRow(children: [
                          Container(
                            height: 80,
                            child: Center(
                              child: Text(
                                getText('kill_mud_weight', context),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            height: 80,
                            child: Center(
                              child: Text(
                                getText(
                                    'inform_crew_to_prepare_kill_mud_weight_for_the_second_circulation',
                                    context),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 80,
                            child: Center(
                              child: Text(
                                '3.0',
                                // getText('3.0', context),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          Container(
                            height: 80,
                            child: Center(
                              child: Text(
                                '0.0/0.0',
                                // getText('pits_and_valves', context),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ])
                      ],
                    ),
                    Table(
                      columnWidths: {
                        1: FlexColumnWidth(3),
                      },
                      border: TableBorder(
                          verticalInside: BorderSide(color: Colors.grey),
                          horizontalInside: BorderSide(
                            color: Colors.grey,
                          ),
                          // top: BorderSide(color: Colors.grey),
                          bottom: BorderSide(color: Colors.grey),
                          right: BorderSide(color: Colors.grey),
                          left: BorderSide(color: Colors.grey)),
                      children: [
                        TableRow(children: [
                          Container(
                            height: 80,
                            child: Center(
                              child: Text(
                                getText('communicating_kill_plan', context),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            height: 80,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 4.0, right: 4.0),
                                child: Text(
                                  getText(
                                      'critical_action_inform_relevant_personnel_of_the_kill_plan_and_their_duties_during_kill_operation',
                                      context),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 80,
                            child: Center(
                              child: Text(
                                '5.0',
                                // getText('3.0', context),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          Container(
                            height: 80,
                            child: Center(
                              child: Text(
                                '5.0/5.0',
                                // getText('pits_and_valves', context),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
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
                                  getText('module_2_scoring', context),
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Checkbox(value: true, onChanged: null),
                                Text(
                                  getText('passed', context),
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Checkbox(value: false, onChanged: null),
                                Text(
                                  getText('failed', context),
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                          ),
                         
                        ])
                      ],
                    ),

                       
                                Table(
                  columnWidths: {
                    1: FlexColumnWidth(3),
                  },
                  border: TableBorder.all(width: 1.0, color: Colors.grey),
                  children: [
                    TableRow(children: [
                      Container(
                        height: 80,
                        child: Center(
                               child: Text(
                        getText('start_up', context),
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
                        getText('bring_pumps_up_to_kill_speed', context),
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
                        getText('switch_from_start_up_to_kill_procedure', context),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14,),
                    ), 
                                  ),
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
                                          '3.0',
                                    //  getText('1.0',context),
                                      style: TextStyle(fontSize: 14),
                                    )),
                                  ),
                                ]),
                                TableRow(children: [
                                  Container(
                                    height: 40,
                                    child: Center(
                                        child: Text(
                                           '3.0',
                                      // getText('1.0',context),
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
                                    '0.0',
                                    style: TextStyle(fontSize: 14),
                                  )),
                                ),
                          ]),
                          TableRow(children: [
                                Container(
                                  height: 40,
                                  child: Center(
                                      child: Text(
                                         '0.0',
                                    // getText('1.0',context),
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
                    1: FlexColumnWidth(3),
                  },
                  // border: TableBorder.all(width: 1.0, color: Colors.grey),
                   border: TableBorder(
                                verticalInside: BorderSide(color: Colors.grey),
                                horizontalInside: BorderSide(color: Colors.grey),
                                // top: BorderSide(color: Colors.grey),
                                //  bottom: BorderSide(color: Colors.grey),
                                // right: BorderSide(color: Colors.grey),
                                // left: BorderSide(color: Colors.grey)),
                          ),
                  children: [
                    TableRow(children: [
                      Container(
                        height: 150,
                        child: Center(
                               child: Text(
                        getText('maintain_bhp', context),
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
                                  height: 50,
                                  child: Center(
                                     child: Text(
                        getText('follow_kill_procedure_from_completion_of_start_up_to_gas_influx_reaching_the_choke_line', context),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14,),
                    ), 
                                  ),
                                ),
                          ]),
                           TableRow(children: [
                                Container(
                                  height: 50,
                                  child: Center(
                                     child: Text(
                        getText('critical_action_prevent_formation_breakdown', context),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14,),
                    ), 
                                  ),
                                ),
                          ]),
                          TableRow(children: [
                                Container(
                                  height: 50,
                                  child: Center(
                                     child: Text(
                        getText('critical_action_minimize_further_influx_due_to_underbalance', context),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14,),
                    ), 
                                  ),
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
                                    height: 50,
                                    child: Center(
                                        child: Text(
                                          '3.0',
                                    //  getText('1.0',context),
                                      style: TextStyle(fontSize: 14),
                                    )),
                                  ),
                                ]),
                                TableRow(children: [
                                  Container(
                                    height: 50,
                                    child: Center(
                                        child: Text(
                                           '3.0',
                                      // getText('1.0',context),
                                      style: TextStyle(fontSize: 14),
                                    )),
                                  ),
                                ]),
                                  TableRow(children: [
                                  Container(
                                    height: 50,
                                    child: Center(
                                        child: Text(
                                          '3.0',
                                    //  getText('1.0',context),
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
                                  height: 50,
                                  child: Center(
                                      child: Text(
                                    '0.0',
                                    style: TextStyle(fontSize: 14),
                                  )),
                                ),
                          ]),
                          TableRow(children: [
                                Container(
                                  height: 50,
                                  child: Center(
                                      child: Text(
                                         '0.0',
                                    // getText('1.0',context),
                                    style: TextStyle(fontSize: 14),
                                  )),
                                ),
                          ]),
                            TableRow(children: [
                                  Container(
                                    height: 50,
                                    child: Center(
                                        child: Text(
                                          '3.0',
                                    //  getText('1.0',context),
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
                    1: FlexColumnWidth(3),
                  },
                  border: TableBorder.all(width: 1.0, color: Colors.grey),
                  children: [
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.only(left:10.0,right: 10.0),
                        child: Container(
                          height: 120,
                          child: Center(
                                 child: Text(
                          getText('handle_influx_at_choke', context),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                    ), 
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
                                  height: 60,
                                  child: Center(
                                     child: Text(
                        getText('recognize_influx_entering_choke_line_and_adjust_choke_to_maintan_correct_pressure_during_circulation_of_influx_from_well_subsea_only', context),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14,),
                    ), 
                                  ),
                                ),
                          ]),
                          TableRow(children: [
                                Container(
                                  height: 60,
                                  child: Center(
                                     child: Text(
                        getText('adjust_choke_to_maintain_correct_pressures_during_circulation_as_mud_replaces_influx_at_remote_choke_and_choke_lines', context),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14,),
                    ), 
                                  ),
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
                                top: BorderSide(color: Colors.grey),
                                bottom: BorderSide(color: Colors.grey),
                                // right: BorderSide(color: Colors.grey),
                                // left: BorderSide(color: Colors.grey)),
                          ),
                          children: [
                                TableRow(children: [
                                  Container(
                                    height: 60,
                                    child: Center(
                                        child: Text(
                                          '3.0',
                                    //  getText('1.0',context),
                                      style: TextStyle(fontSize: 14),
                                    )),
                                  ),
                                ]),
                                TableRow(children: [
                                  Container(
                                    height: 60,
                                    child: Center(
                                        child: Text(
                                           '3.0',
                                      // getText('1.0',context),
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
                          top: BorderSide(color: Colors.grey),
                          bottom: BorderSide(color: Colors.grey),
                          // right: BorderSide(color: Colors.grey),
                        ),
                        children: [
                          TableRow(children: [
                                Container(
                                  height: 60,
                                  child: Center(
                                      child: Text(
                                    '0.0',
                                    style: TextStyle(fontSize: 14),
                                  )),
                                ),
                          ]),
                          TableRow(children: [
                                Container(
                                  height: 60,
                                  child: Center(
                                      child: Text(
                                         '0.0',
                                    // getText('1.0',context),
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
                    1: FlexColumnWidth(3),
                  },
                   border: TableBorder(
                            verticalInside: BorderSide(color: Colors.grey),
                          horizontalInside: BorderSide(
                                color: Colors.grey,
                          ),
                          // top: BorderSide(color: Colors.grey),
                          bottom: BorderSide(color: Colors.grey),
                          right: BorderSide(color: Colors.grey),
                          left: BorderSide(color: Colors.grey)
                        ),
                  children: [
                    TableRow(children: [
                      Container(
                        height: 80,
                        child: Center(
                               child: Text(
                        getText('handle_kill_problem', context),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                    ), 
                              ),
                      ),
                        Container(
                        height: 80,
                        child: Center(
                               child: Text(
                        getText('critical_action_no_problem', context),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14,),
                    ), 
                              ),
                      ),
                        Container(
                        height: 80,
                        child: Center(
                               child: Text(
                                 '3.0',
                        // getText('3.0', context),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                    ), 
                              ),
                      ),
                        Container(
                        height: 80,
                        child: Center(
                               child: Text(
                                 '0.0/0.0',
                        // getText('pits_and_valves', context),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14,),
                    ), 
                              ),
                      ),
                    ])
                  ],
                ),

                Table(
                  columnWidths: {
                    1: FlexColumnWidth(3),
                  },
                  // border: TableBorder.all(width: 1.0, color: Colors.grey),
                   border: TableBorder(
                                verticalInside: BorderSide(color: Colors.grey),
                                horizontalInside: BorderSide(color: Colors.grey),
                                // top: BorderSide(color: Colors.grey),
                                //  bottom: BorderSide(color: Colors.grey),
                                // right: BorderSide(color: Colors.grey),
                                // left: BorderSide(color: Colors.grey)),
                          ),
                  children: [
                    TableRow(children: [
                      Container(
                        height: 150,
                        child: Center(
                               child: Text(
                        getText('shut_down_kill_operation', context),
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
                                  height: 50,
                                  child: Center(
                                     child: Text(
                        getText('shut_down_kill_operation_when_initial_gas_influx_has_been_circulated_out', context),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14,),
                    ), 
                                  ),
                                ),
                          ]),
                           TableRow(children: [
                                Container(
                                  height: 50,
                                  child: Center(
                                     child: Text(
                        getText('interpret_and_explain_readings_on_drillpipe_and_casing_gauge', context),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14,),
                    ), 
                                  ),
                                ),
                          ]),
                          TableRow(children: [
                                Container(
                                  height: 50,
                                  child: Center(
                                     child: Text(
                        getText('explain_how_to_continue_with_kill_operation', context),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14,),
                    ), 
                                  ),
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
                                    height: 50,
                                    child: Center(
                                        child: Text(
                                          '3.0',
                                    //  getText('1.0',context),
                                      style: TextStyle(fontSize: 14),
                                    )),
                                  ),
                                ]),
                                TableRow(children: [
                                  Container(
                                    height: 50,
                                    child: Center(
                                        child: Text(
                                           '3.0',
                                      // getText('1.0',context),
                                      style: TextStyle(fontSize: 14),
                                    )),
                                  ),
                                ]),
                                  TableRow(children: [
                                  Container(
                                    height: 50,
                                    child: Center(
                                        child: Text(
                                          '3.0',
                                    //  getText('1.0',context),
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
                                  height: 50,
                                  child: Center(
                                      child: Text(
                                    '0.0',
                                    style: TextStyle(fontSize: 14),
                                  )),
                                ),
                          ]),
                          TableRow(children: [
                                Container(
                                  height: 50,
                                  child: Center(
                                      child: Text(
                                         '0.0',
                                    // getText('1.0',context),
                                    style: TextStyle(fontSize: 14),
                                  )),
                                ),
                          ]),
                            TableRow(children: [
                                  Container(
                                    height: 50,
                                    child: Center(
                                        child: Text(
                                          '3.0',
                                    //  getText('1.0',context),
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
                TableRow(
                  children: [
                  Container(
                      color: Colors.grey[200],
                    height: 60,
                    child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                     getText('module_3_scoring',context),
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
