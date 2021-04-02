import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/constants.dart';
import 'package:flutter_application_1/utilities/multilingual_service.dart';

class Module2Score extends StatefulWidget {
  @override
  _Module2ScoreState createState() => _Module2ScoreState();
}

class _Module2ScoreState extends State<Module2Score> {
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
                      style: TextStyle(
                          color: Constants.textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
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
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )),
                  ),
                  Container(
                      color: Colors.yellow[100],
                      height: 50,
                      child: Center(
                        child: Text(
                          getText('action_to_take', context),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      )),
                  Container(
                    color: Colors.yellow[100],
                    height: 50,
                    child: Center(
                      child: Text(
                        getText('maximum_points', context),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
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
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
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
                          Container(
                            color: Colors.grey[200],
                            height: 60,
                            child: Center(
                                child: RaisedButton(
                                    color: Constants.textColor,
                                    // color: Constants.themeBlue,
                                    textColor: Colors.white,
                                    child: Text(getText("done", context)),
                                    onPressed: () {})),
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
