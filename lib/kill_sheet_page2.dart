import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/multilingual_service.dart';
import 'package:mm_initial_data/mmid_dm_wwm_initial_data.dart';

import 'configuration_details.dart';

class Killsheettwo extends StatefulWidget {
  SelectedMethodRig methodRig;
  var current;
  Killsheettwo(this.current,this.methodRig);
  @override
  _KillsheettwoState createState() => _KillsheettwoState(current,methodRig);
}

class _KillsheettwoState extends State<Killsheettwo> {
  var current;
   SelectedMethodRig methodRig;
  _KillsheettwoState(this.current,this.methodRig);

  double drillStringVolume;
  double pumpOutPut;
  double surfaceToBitStrokes;
  double slowCirculatingRate;
  double surfaceToBitTime;
  double bitToShoeVolume;
  double bitToShoeStrokes;
  double bitToShoeTime;
  double bitToSurfaceVolume;
  double bitToSurfaceStrokes;
  double bitToSurfaceTime;
  double clf;

  List listSCR = [];
  var list = [
    {'id': "123123", "date": "20/08/2016"},
    {'id': "123124", "date": "26/08/2016"},
    {'id': "123125", "date": "26/08/2016"}
  ];

  @override
  void initState() {
    setState(() {
      surfaceToBitStrokes = current.killSheet.surfaceToBitStrokes.value;
      pumpOutPut = current.killSheet.pumpOutput.value;
      surfaceToBitTime = current.killSheet.surfaceToBitTime.value;
      bitToShoeVolume = current.killSheet.bitToShoeVolume.value;
      bitToShoeStrokes = current.killSheet.bitToShoeStrokes.value;
      bitToShoeTime = current.killSheet.bitToShoeStrokes.value;
      bitToSurfaceVolume = current.killSheet.bitToSurfaceVolume.value;
      bitToSurfaceStrokes = current.killSheet.bitToSurfaceStrokes.value;
      bitToSurfaceTime = current.killSheet.bitToSurfaceTime.value;

      current.killSheet.recordedPressureForAllScr.forEach((key, value) {
        listSCR.add(key);
        print('dlsks'+current.killSheet.recordedPressureForAllScr[key].toString());
        print('');
        print(
            '   spm: ${key} | tplOrChokeLine: ${value["tplOrChokeLine"]} | riser: ${value["riser"]} | clf: ${value["clf"]}');
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  child: Image(image: AssetImage('assets/images/KSImage.png')),
                  //  child: Center(child: Text('Choose Configuration',style: TextStyle(color: Colors.white),)),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  //  color: Colors.red,
                  // child: chooseConfiguration(),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // height: 50,
                          color: Colors.grey.withOpacity(0.4),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 4.0, bottom: 4.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: FittedBox(
                                    child: Text(
                                      getText(
                                          'read_and_record_slow_circulation_rate',
                                          context),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:methodRig.isSubsea ? readAndRecordSCRSubsea() :readAndRecordSCR() ,
                        ),

                        Container(
                          // height: 50,
                          color: Colors.grey.withOpacity(0.4),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 4.0, bottom: 4.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    getText('drill_string_data', context),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        drillStringData(),
                        Container(
                          // height: 50,
                          color: Colors.grey.withOpacity(0.4),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 4.0, bottom: 4.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    getText('open_hole_data', context),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        openHoleData(),
                        Container(
                          // height: 50,
                          color: Colors.grey.withOpacity(0.4),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 4.0, bottom: 4.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    getText('annulus_data', context),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        annulusData(),
                     methodRig.isSubsea ?    Container(
                          // height: 50,
                          color: Colors.grey.withOpacity(0.4),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 4.0, bottom: 4.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    getText('riser_data', context),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ) : SizedBox(),

                      methodRig.isSubsea ?   riserData() : SizedBox(),
                        //  calculationBox(),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget readAndRecordSCR() {
    return Table(
      // textDirection: TextDirection.rtl,
      // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
      border: TableBorder.all(width: 1.0, color: Colors.grey),
      children: [
        TableRow(children: [
          Container(
              height: 40,
              child: Center(
                  child: Text(
                getText('s_c_r', context),
                textScaleFactor: 1,
              ))),
          Container(
              height: 40,
              child: Center(
                  child: Text(
                getText('pump_no', context) + '1',
                textScaleFactor: 1,
              ))),
          Container(
              height: 40,
              child: Center(
                  child: Text(
                getText('pump_no', context) + '2',
                textScaleFactor: 1,
              ))),
        ]),
        TableRow(children: [
          Container(
              height: 40,
              child: Center(
                  child: Text(
                '10 spm',
                textScaleFactor: 1,
              ))),
          Container(
              height: 40,
              child: Center(
                  child: Text(
                '127 psi',
                textScaleFactor: 1,
              ))),
          Container(
              height: 40,
              child: Center(
                  child: Text(
                '127 psi',
                textScaleFactor: 1,
              ))),
        ]),
        TableRow(children: [
          Container(
              height: 40,
              child: Center(
                  child: Text(
                '20 spm',
                textScaleFactor: 1,
              ))),
          Container(
              height: 40,
              child: Center(
                  child: Text(
                '178 psi',
                textScaleFactor: 1,
              ))),
          Container(
              height: 40,
              child: Center(
                  child: Text(
                '178 psi',
                textScaleFactor: 1,
              ))),
        ]),
        TableRow(children: [
          Container(
              height: 40,
              child: Center(
                  child: Text(
                '30 spm',
                textScaleFactor: 1,
              ))),
          Container(
              height: 40,
              child: Center(
                  child: Text(
                '276 psi',
                textScaleFactor: 1,
              ))),
          Container(
              height: 40,
              child: Center(
                  child: Text(
                '276 psi',
                textScaleFactor: 1,
              ))),
        ]),
      ],
    );
  }

  Widget readAndRecordSCRSubsea() {
    return Column(
      children: [
        Table(
          columnWidths: {
            0: FlexColumnWidth(0.5),
            4: FlexColumnWidth(0.5),
          },
          children: [
            TableRow(children: [
              Container(
                  height: 40,
                  child: Center(
                      child: Text(
                    '',
                    textScaleFactor: 1,
                  ))),
              Container(
                  height: 40,
                  child: Center(
                      child: Text(
                    getText('pump_no', context),
                    textScaleFactor: 1,
                  ))),
              Container(
                  height: 40,
                  child: Center(
                      child: Text(
                    '',
                    textScaleFactor: 1,
                  ))),
              Container(
                  height: 40,
                  child: Center(
                      child: Text(
                    getText('pump_output_bbl_stk', context),
                    textScaleFactor: 1,
                   textAlign: TextAlign.center,
                  ))),
              Container(
                  height: 40,
                  child: Center(
                      child: Text(
                    '',
                    textScaleFactor: 1,
                  ))),
            ]),
            TableRow(children: [
              Container(
                  height: 40,
                  child: Center(
                      child: Text(
                    '',
                    textScaleFactor: 1,
                  ))),
              Container(
                  height: 40,
                  child: Center(
                      child: TextFormField(
                         readOnly: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      isDense: true,
                      hintText: '1',
                      hintStyle: TextStyle(
                          color: Colors.black,
                          
                          fontSize: 14),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ))),
              Container(
                  height: 40,
                  child: Center(
                      child: Text(
                    '',
                    textScaleFactor: 1,
                  ))),
              Container(
                  height: 40,
                  child: Center(
                      child: TextFormField(
                        readOnly: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      isDense: true,
                      hintText: pumpOutPut.toStringAsFixed(3),
                      hintStyle: TextStyle(
                          color: Colors.black,
                          
                          fontSize: 14),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ))),
              Container(
                  height: 40,
                  child: Center(
                      child: Text(
                    '',
                    textScaleFactor: 1,
                  ))),
            ])
          ],
        ),
        SizedBox(height: 8),
        // current.killSheet.recordedPressureForAllScr.forEach((key, value) {
        //   print(
        //       '   spm: ${key} | tplOrChokeLine: ${value["tplOrChokeLine"]} | riser: ${value["riser"]} | clf: ${value["clf"]}');
        // }),
        // Table(border: TableBorder.all(color: Colors.black), columnWidths: {
        //   0: FixedColumnWidth(100.0),
        //   1: FixedColumnWidth(100.0)
        // }, children: [
        //   current.killSheet.recordedPressureForAllScr.forEach((key, value) {
            
        //     TableRow(
        //       children: [
        //         Text('hey'),
        //         Text('hiii')
        //       // Text(key),
        //       // Text(value["tplOrChokeLine"].toString()),
        //       // Text(value["riser"].toString()),
        //       // Text(value["clf"].toString()),
        //     ]);
        //   })
        // ]),
         Table(
          columnWidths: {
            2: FlexColumnWidth(0.5),
            4: FlexColumnWidth(0.5),
          },
          // textDirection: TextDirection.rtl,
          // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
          // border:TableBorder.all(width: 1.0,color: Colors.grey),
          children: [
            TableRow(children: [
              Container(
                  height: 40,
                  child: Text(
                    getText('s_c_r', context),
                    textScaleFactor: 1,
                  )),
              Container(
                  height: 40,
                  child: Text(
                    getText('choke_line', context),
                    textScaleFactor: 1,
                  )),
              Container(
                  height: 40,
                  child: Text(
                    '',
                    textScaleFactor: 1,
                  )),
              Container(
                  height: 40,
                  child: Text(
                    getText('riser', context),
                    textScaleFactor: 1,
                  )),
              Container(
                  height: 40,
                  child: Center(
                      child: Text(
                    '',
                    textScaleFactor: 1,
                  ))),
              Container(
                  height: 40,
                  child: Text(
                    '\u0394'+'P.'+getText('clf', context),
                    textScaleFactor: 1,
                  )),
            ]),
            ]),

         Table(
      // border: TableBorder.all(color: Colors.black),
     
       columnWidths: {
            2: FlexColumnWidth(0.5),
            4: FlexColumnWidth(0.5),
          },
      
      children:[
        for(var item in listSCR )  
      //   TableRow(children: [
      //     Text(item),
      //     Text(current.killSheet.recordedPressureForAllScr[item]['tplOrChokeLine'].toStringAsFixed(0))   ,
      //     Text(current.killSheet.recordedPressureForAllScr[item]['riser'].toStringAsFixed(0))   ,
      //     Text(current.killSheet.recordedPressureForAllScr[item]['clf'].toStringAsFixed(0))   ,
          
      // //  Text(listSCR[item].toString()),
      // //  Text(current.killSheet.recordedPressureForAllScr[item]['tplOrChokeLine'].toString())   ,

         
      // ])
          // var item = item.toStringAsFixed(0),
         TableRow(children: [
             
              Container(
                  height: 40,
                  child: Text(
                    item.substring(0, 2) +' spm',
                    textScaleFactor: 1,
                  )),
              Container(
                  height: 40,
                  child: Center(
                      child: TextFormField(
                         readOnly: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      isDense: true,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(top: 10.0, right: 2.0),
                        child: Text("psi"),
                      ),
                      suffixIconConstraints:
                          BoxConstraints(minWidth: 0, minHeight: 0),
                      suffixStyle: TextStyle(
                          color: Colors.black,
                          
                          fontSize: 6),
                      hintText: current.killSheet.recordedPressureForAllScr[item]['tplOrChokeLine'].toStringAsFixed(0),
                      hintStyle: TextStyle(
                          color: Colors.black,
                          
                          fontSize: 14),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ))),
              Container(
                  height: 40,
                  child: Center(
                      child: Text(
                    '-',
                    textScaleFactor: 1,
                  ))),
              Container(
                  height: 40,
                  child: Center(
                      child: TextFormField(
                         readOnly: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      isDense: true,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(top: 10.0, right: 2.0),
                        child: Text("psi"),
                      ),
                      suffixIconConstraints:
                          BoxConstraints(minWidth: 0, minHeight: 0),
                      suffixStyle: TextStyle(
                          color: Colors.black,
                          
                          fontSize: 6),
                      hintText: current.killSheet.recordedPressureForAllScr[item]['riser'].toStringAsFixed(0),
                      hintStyle: TextStyle(
                          color: Colors.black,
                          
                          fontSize: 14),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ))),
              Container(
                  height: 40,
                  child: Center(
                      child: Text(
                    '=',
                    textScaleFactor: 1,
                  ))),
              Container(
                  height: 40,
                  child: Center(
                      child: TextFormField(
                         readOnly: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      isDense: true,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(top: 10.0, right: 2.0),
                        child: Text("psi"),
                      ),
                      suffixIconConstraints:
                          BoxConstraints(minWidth: 0, minHeight: 0),
                      suffixStyle: TextStyle(
                          color: Colors.black,
                          
                          fontSize: 6),
                      hintText: current.killSheet.recordedPressureForAllScr[item]['clf'].toStringAsFixed(0),
                      hintStyle: TextStyle(
                          color: Colors.black,
                          
                          fontSize: 14),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ))),
            ])
      
      ]
       ),

       
      ],
    );
  }

  drillStringData() {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      FittedBox(
                        child: Text(
                          getText('drill_string_volume_bbls', context),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ),

                      SizedBox(
                        height: 18,
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          readOnly: true,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: '134',
                            hintStyle: TextStyle(
                                color: Colors.black,
                                
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                      )
                      // Text("My Awesome Border"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text("\u00F7"),
                ),
                Expanded(
                  child: Column(
                    children: [
                      FittedBox(
                        child: Text(
                          getText('pump_output_bbl_stk', context),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ),

                      SizedBox(
                        height: 18,
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          readOnly: true,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: pumpOutPut.toStringAsFixed(3),
                            hintStyle: TextStyle(
                                color: Colors.black,
                                
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                      )
                      // Text("My Awesome Border"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text("="),
                ),
                Expanded(
                  child: Column(
                    children: [
                      FittedBox(
                        child: Text(
                          getText('surface_to_bit_strokes', context),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ),

                      SizedBox(
                        height: 18,
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          readOnly: true,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: surfaceToBitStrokes.toStringAsFixed(0),
                            hintStyle: TextStyle(
                                color: Colors.black,
                                
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                      )
                      // Text("My Awesome Border"),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      FittedBox(
                        child: Text(
                          getText('surface_to_bit_strokes', context),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ),

                      SizedBox(
                        height: 18,
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          readOnly: true,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: '1089',
                            hintStyle: TextStyle(
                                color: Colors.black,
                                
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                      )
                      // Text("My Awesome Border"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text("\u00F7"),
                ),
                Expanded(
                  child: Column(
                    children: [
                      FittedBox(
                        child: Text(
                          getText('slow_circulating_rate_spm', context),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ),

                      SizedBox(
                        height: 18,
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          readOnly: true,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: '30',
                            hintStyle: TextStyle(
                                color: Colors.black,
                                
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                      )
                      // Text("My Awesome Border"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text("="),
                ),
                Expanded(
                  child: Column(
                    children: [
                      FittedBox(
                        child: Text(
                          getText('surface_to_bit_time', context),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ),

                      SizedBox(
                        height: 18,
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          readOnly: true,
                          decoration: InputDecoration(
                            isDense: true,
                            suffixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(top: 28.0, right: 6.0),
                              child: Text(
                                "min",
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                            suffixIconConstraints:
                                BoxConstraints(minWidth: 0, minHeight: 0),
                            suffixStyle: TextStyle(
                                color: Colors.black,
                                
                                fontSize: 6),
                            hintText: '36.3',
                            hintStyle: TextStyle(
                                color: Colors.black,
                                
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                      )
                      // Text("My Awesome Border"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  openHoleData() {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      FittedBox(
                        child: Text(
                          getText('bit_to_shoe_volume_bbls', context),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ),

                      SizedBox(
                        height: 18,
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          readOnly: true,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: bitToShoeVolume.toStringAsFixed(1),
                            hintStyle: TextStyle(
                                color: Colors.black,
                                
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                      )
                      // Text("My Awesome Border"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text("\u00F7"),
                ),
                Expanded(
                  child: Column(
                    children: [
                      FittedBox(
                        child: Text(
                          getText('pump_output_bbl_stk', context),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ),

                      SizedBox(
                        height: 18,
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          readOnly: true,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: pumpOutPut.toStringAsFixed(3),
                            hintStyle: TextStyle(
                                color: Colors.black,
                                
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                      )
                      // Text("My Awesome Border"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text("="),
                ),
                Expanded(
                  child: Column(
                    children: [
                      FittedBox(
                        child: Text(
                          getText('bit_to_shoe_strokes', context),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ),

                      SizedBox(
                        height: 18,
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          readOnly: true,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: bitToShoeStrokes.toStringAsFixed(0),
                            hintStyle: TextStyle(
                                color: Colors.black,
                                
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                      )
                      // Text("My Awesome Border"),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      FittedBox(
                        child: Text(
                          getText('bit_to_shoe_strokes', context),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ),

                      SizedBox(
                        height: 18,
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          readOnly: true,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: bitToShoeStrokes.toStringAsFixed(0),
                            hintStyle: TextStyle(
                                color: Colors.black,
                                
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                      )
                      // Text("My Awesome Border"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text("\u00F7"),
                ),
                Expanded(
                  child: Column(
                    children: [
                      FittedBox(
                        child: Text(
                          getText('slow_circulating_rate_spm', context),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ),

                      SizedBox(
                        height: 18,
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          readOnly: true,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: '30',
                            hintStyle: TextStyle(
                                color: Colors.black,
                                
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                      )
                      // Text("My Awesome Border"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text("="),
                ),
                Expanded(
                  child: Column(
                    children: [
                      FittedBox(
                        child: Text(
                          getText('bit_to_shoe_time', context),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ),

                      SizedBox(
                        height: 18,
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          readOnly: true,
                          decoration: InputDecoration(
                            isDense: true,
                            suffixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(top: 28.0, right: 6.0),
                              child: Text(
                                "min",
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                            suffixIconConstraints:
                                BoxConstraints(minWidth: 0, minHeight: 0),
                            suffixStyle: TextStyle(
                                color: Colors.black,
                                
                                fontSize: 6),
                            hintText: '36.3',
                            hintStyle: TextStyle(
                                color: Colors.black,
                                
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                      )
                      // Text("My Awesome Border"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  annulusData() {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        getText('bit_to_surface_volume_via_cl_bbls', context),
                        style:
                            TextStyle(fontSize: 8, fontWeight: FontWeight.w500),
                      ),

                      SizedBox(
                        height: 12,
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          readOnly: true,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: bitToSurfaceVolume.toStringAsFixed(1),
                            hintStyle: TextStyle(
                                color: Colors.black,
                                // 
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                      )
                      // Text("My Awesome Border"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text("\u00F7"),
                ),
                Expanded(
                  child: Column(
                    children: [
                      FittedBox(
                        child: Text(
                          getText('pump_output_bbl_stk', context),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ),

                      SizedBox(
                        height: 18,
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          readOnly: true,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: pumpOutPut.toStringAsFixed(3),
                            hintStyle: TextStyle(
                                color: Colors.black,
                                
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                      )
                      // Text("My Awesome Border"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text("="),
                ),
                Expanded(
                  child: Column(
                    children: [
                      FittedBox(
                        child: Text(
                          getText('bit_to_surface_strokes', context),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ),

                      SizedBox(
                        height: 18,
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          readOnly: true,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: bitToSurfaceStrokes.toStringAsFixed(0),
                            hintStyle: TextStyle(
                                color: Colors.black,
                                
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                      )
                      // Text("My Awesome Border"),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      FittedBox(
                        child: Text(
                          getText('bit_to_surface_strokes', context),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ),

                      SizedBox(
                        height: 18,
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          readOnly: true,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: bitToSurfaceStrokes.toStringAsFixed(0),
                            hintStyle: TextStyle(
                                color: Colors.black,
                                // 
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                      )
                      // Text("My Awesome Border"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text("\u00F7"),
                ),
                Expanded(
                  child: Column(
                    children: [
                      FittedBox(
                        child: Text(
                          getText('slow_circulating_rate_spm', context),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ),

                      SizedBox(
                        height: 18,
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          readOnly: true,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: '30',
                            hintStyle: TextStyle(
                                color: Colors.black,
                                
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                      )
                      // Text("My Awesome Border"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text("="),
                ),
                Expanded(
                  child: Column(
                    children: [
                      FittedBox(
                        child: Text(
                          getText('bit_to_surface_time', context),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ),

                      SizedBox(
                        height: 18,
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          readOnly: true,
                          decoration: InputDecoration(
                            isDense: true,
                            suffixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(top: 28.0, right: 6.0),
                              child: Text(
                                "min",
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                            suffixIconConstraints:
                                BoxConstraints(minWidth: 0, minHeight: 0),
                            suffixStyle: TextStyle(
                                color: Colors.black,
                                
                                fontSize: 6),
                            hintText: bitToSurfaceTime.toStringAsFixed(1),
                            hintStyle: TextStyle(
                                color: Colors.black,
                                
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                      )
                      // Text("My Awesome Border"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  riserData() {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      FittedBox(
                        child: Text(
                          getText('riser_volume', context),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ),

                      SizedBox(
                        height: 18,
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          readOnly: true,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: '175.3',
                            hintStyle: TextStyle(
                                color: Colors.black,
                                
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                      )
                      // Text("My Awesome Border"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text("\u00F7"),
                ),
                Expanded(
                  child: Column(
                    children: [
                      FittedBox(
                        child: Text(
                          getText('pump_output_bbl_stk', context),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ),

                      SizedBox(
                        height: 18,
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          readOnly: true,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: '0.123',
                            hintStyle: TextStyle(
                                color: Colors.black,
                                
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                      )
                      // Text("My Awesome Border"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text("="),
                ),
                Expanded(
                  child: Column(
                    children: [
                      FittedBox(
                        child: Text(
                          getText('riser_stroke', context),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ),

                      SizedBox(
                        height: 18,
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          readOnly: true,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: '1425',
                            hintStyle: TextStyle(
                                color: Colors.black,
                                
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                      )
                      // Text("My Awesome Border"),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      FittedBox(
                        child: Text(
                          getText('riser_stroke', context),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ),

                      SizedBox(
                        height: 18,
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          readOnly: true,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: '1089',
                            hintStyle: TextStyle(
                                color: Colors.black,
                                
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                      )
                      // Text("My Awesome Border"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text("\u00F7"),
                ),
                Expanded(
                  child: Column(
                    children: [
                      FittedBox(
                        child: Text(
                          getText('slow_circulating_rate_spm', context),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ),

                      SizedBox(
                        height: 18,
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          readOnly: true,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: '30',
                            hintStyle: TextStyle(
                                color: Colors.black,
                                
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                      )
                      // Text("My Awesome Border"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text("="),
                ),
                Expanded(
                  child: Column(
                    children: [
                      FittedBox(
                        child: Text(
                          getText('time_to_displace_riser', context),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        ),
                      ),

                      SizedBox(
                        height: 18,
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          readOnly: true,
                          decoration: InputDecoration(
                            isDense: true,
                            suffixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(top: 28.0, right: 6.0),
                              child: Text(
                                "min",
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                            suffixIconConstraints:
                                BoxConstraints(minWidth: 0, minHeight: 0),
                            suffixStyle: TextStyle(
                                color: Colors.black,
                                
                                fontSize: 6),
                            hintText: '36.3',
                            hintStyle: TextStyle(
                                color: Colors.black,
                                
                                fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                      )
                      // Text("My Awesome Border"),
                    ],
                  ),
                ),
              ],
            ),

            //              ks.recordedPressureForAllScr.forEach((key, value) {
            //  drawTabelWidget(key,value["tplOrChokeLine"],value["riser"],value["clf"]);

            //      })
          ],
        ),
      ),
    );
  }

  Widget drawTabelWidget(
      dynamic key, dynamic value, dynamic value2, dynamic value3) {
    return Row(
      children: [
        Text(key.toString()),
        Text(value.toString()),
        Text(value2.toString()),
        Text(value3.toString())
      ],
    );
  }
}
