import 'package:flutter/material.dart';
import 'package:flutter_application_1/configuration_details.dart';
import 'package:flutter_application_1/utilities/multilingual_service.dart';

class Killsheetfour extends StatefulWidget {
   SelectedMethodRig methodRig;
  var current;
  Killsheetfour(this.current,this.methodRig);
  @override
  _KillsheetfourState createState() => _KillsheetfourState(current,methodRig);
}

class _KillsheetfourState extends State<Killsheetfour> {
   SelectedMethodRig methodRig;
  var current;
  _KillsheetfourState(this.current,this.methodRig);

  double surfaceLeackOffTest;
  double casingShoeTVD;
  double leakOffTestMudWeight;
  double maximumMudWeight;
  double drillingMudWeight;
  double casingTVD;
  double surfaceToBitStrokes;

  double maximumAllowableAnnulusSurfacePressure;

  double sicp;
  double sidpp;
  double tvdFromRKBH;
  double tvdFromRKB;
  double killMud;
  double casingYeild;
  double safetyFactor;
  double bitToSurfaceStrokes;
  double totalStrokesToKillWell;
  double surfaceToBitTime;
  double bitToSurfaceTime;
  double totalTime;
  double chokeLinePsi;
  // double killMudPpg;
  double originalMudppg;
  double diffCLF;
  double pumpOutput;


  void initState() {
    setState(() {
      var _config = current.configuration;
      var _sectionInfo = current.sectionInfo;
      var ks = current.killSheet;
      print('strokePressure chart: ${ks.arrWwmStrokesPressure[0][1] ?? "NA"}');

      leakOffTestMudWeight = _config.leakOffTests.mudWeight.value;
      surfaceLeackOffTest = _config.leakOffTests.mudWeight.value;
      casingShoeTVD = _config.casing.depth.value;
      maximumMudWeight = ks.maximumMudWeight.value;
      drillingMudWeight = ks.originalMud.density.value;
      casingTVD = _config.casing.depth.value;
      maximumAllowableAnnulusSurfacePressure =
          ks.maximumAllowableAnnulusSurfacePressure.value;
      sidpp = ks.sidpp.value;
    
      tvdFromRKB = ks.tvd.value;
    
      killMud = ks.killMud.density.value;
      casingTVD = _config.casing.depth.value;
      safetyFactor = _config.general.macpSafetyFactor.value;
      casingYeild = _config.casing.yieldStrength.value;
      originalMudppg = ks.originalMud.density.value;
      surfaceToBitStrokes = current.killSheet.surfaceToBitStrokes.value;
      bitToSurfaceStrokes = current.killSheet.bitToSurfaceStrokes.value;
      totalStrokesToKillWell = surfaceToBitStrokes + bitToSurfaceStrokes;
      surfaceToBitTime = current.killSheet.surfaceToBitTime.value;
      bitToSurfaceTime = current.killSheet.bitToSurfaceTime.value;
      totalTime = surfaceToBitTime + bitToSurfaceTime;
      pumpOutput =ks.pumpOutput.value; 
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
          flex: 2,
          child: Container(
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleContainer(getText('pressure_step_down_chart', context)),
                pressureStepDownChartWidget(),
                titleContainer(getText('i_c_p', context)),
                icpWidget(),
                titleContainer(getText('f_c_p', context)),
                fcpWidget(),
                titleContainer(getText('changeinP', context)),
                changeInPWidget(),

                 methodRig.isSubsea ? titleContainer(getText('adjusted_choke_line_friction', context)):SizedBox(),
               methodRig.isSubsea ? adjustedClfWidget() : SizedBox(),

                titleContainer(getText('complete_circulation', context)),
                completeCirculationWidget(),

                  methodRig.isSubsea ? titleContainer(getText('riser_data', context)):SizedBox(),
               methodRig.isSubsea ? riserDataWidget() : SizedBox(),
                
              ],
            )
                //  height: 40,

                ),
          )),
      Expanded(
        child: Container(
           
            child: methodRig.isDrillersMethod ? 
             Center(
             child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text('STROKE PRESSURE',style: TextStyle(fontWeight: FontWeight.bold)),
                 Text('(For Wait & Weight)',style: TextStyle(fontSize:10),)
               ],
             )
            )
            : Column(
              children: [
                 Container(
       height: 50,
      color: Colors.grey.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                   getText('strokes_pressure',context),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(getText('for_wait_&_weight',context),
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),
                )
              ],
            ),
          ],
        ),
      ),
    ),
                Expanded(
                                  child: SingleChildScrollView(
          child: Table(border: TableBorder.all(color: Colors.grey[400]),

                  
                    children: [
                      for (var i = 0; i <= 16; i++)
                        TableRow(children: [
                          Container(
                              height: 30,
                              child: Center(
                                  child: Text(current
                                      .killSheet.arrWwmStrokesPressure[i][0]
                                      .toStringAsFixed(0)))),
                          Container(
                              height: 30,
                              child: Center(
                                  child: Text(current
                                      .killSheet.arrWwmStrokesPressure[i][1]
                                      .toStringAsFixed(0)))),
                        ])
                    ]),
        ),
                ),
              ],
            )
           
            ),
      ),
    ])));
  }

  titleContainer(String title) {
    return
     Container(
      // height: 50,
      color: Colors.grey.withOpacity(0.4),
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget icpWidget() {
    return Container(
        margin: const EdgeInsets.all(6.0),
        padding: const EdgeInsets.only(top: 18.0, bottom: 18),
        // decoration:
        //     BoxDecoration(border: Border.all(color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    FittedBox(
                      child: Text(
                        getText('scr_riser_psi', context),
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
                          contentPadding: EdgeInsets.all(8),
                          isDense: true,
                          hintText: '276',
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 14),
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
                padding: const EdgeInsets.only(top: 12.0),
                child: Text("+"),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      getText('sidpp_psi', context),
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
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
                          contentPadding: EdgeInsets.all(8),
                          hintText: sidpp.toStringAsFixed(0),
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 14),
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
                padding: const EdgeInsets.only(top: 12.0),
                child: Text("="),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      getText('initial_circulating_pressure', context),
                      style:
                          TextStyle(fontSize: 9, fontWeight: FontWeight.w500),
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
                          contentPadding: EdgeInsets.all(8),
                          hintText: '692',
                          suffixIcon: Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, right: 2.0),
                            child: Text("psi"),
                          ),
                          suffixIconConstraints:
                              BoxConstraints(minWidth: 0, minHeight: 0),
                          suffixStyle:
                              TextStyle(color: Colors.black, fontSize: 6),
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 14),
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
        ));
  }

  Widget fcpWidget() {
    return Container(
        margin: const EdgeInsets.all(6.0),
        padding: const EdgeInsets.only(top: 18.0, bottom: 18),
        // decoration:
        //     BoxDecoration(border: Border.all(color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    FittedBox(
                      child: Text(
                        getText('scr_riser_psi', context),
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w500),
                      ),
                    ),

                    SizedBox(
                      height: 18,
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.12,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        readOnly: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          isDense: true,
                          hintText: '276',
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 14),
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
                padding: const EdgeInsets.only(top: 12.0),
                child: Text("\u00D7"),
              ),
              Expanded(
                  child: Column(
                children: [
                  Text(
                    getText('kill_mud_ppg', context),
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                  ),

                  SizedBox(
                    height: 18,
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.12,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      readOnly: true,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(8),
                        hintText: killMud.toStringAsFixed(0),
                        hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                  )
                  // Text("My Awesome Border"),
                ],
              )),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text("\u00F7"),
              ),
              Expanded(
                child: Column(
                  children: [
                    FittedBox(
                      child: Text(
                        getText('drilling_mud_weight_ppg', context),
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w500),
                      ),
                    ),

                    SizedBox(
                      height: 18,
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.12,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        readOnly: true,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.all(8),
                          hintText: drillingMudWeight.toStringAsFixed(0),
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 14),
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
                padding: const EdgeInsets.only(top: 12.0),
                child: Text("="),
              ),
              Expanded(
                child: Column(
                  children: [
                    FittedBox(
                      child: Text(
                        getText('final_circulating_pressure', context),
                        style:
                            TextStyle(fontSize: 9, fontWeight: FontWeight.w500),
                      ),
                    ),

                    SizedBox(
                      height: 18,
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.12,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        readOnly: true,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.all(8),
                          hintText: '304',
                          suffixIcon: Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, right: 2.0),
                            child: Text("psi"),
                          ),
                          suffixIconConstraints:
                              BoxConstraints(minWidth: 0, minHeight: 0),
                          suffixStyle:
                              TextStyle(color: Colors.black, fontSize: 6),
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 14),
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
        ));
  }

  changeInPWidget() {
    return Container(
        margin: const EdgeInsets.all(6.0),
        padding: const EdgeInsets.only(top: 18.0, bottom: 18),
        // decoration:
        //     BoxDecoration(border: Border.all(color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    FittedBox(
                      child: Text(
                        getText('difference_icp_fcp', context),
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
                          contentPadding: EdgeInsets.all(8),
                          isDense: true,
                          hintText: '692-304',
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 14),
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
                padding: const EdgeInsets.only(top: 12.0),
                child: Text("\u00D7"),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      getText('surface_to_bit_strokes', context),
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
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
                          contentPadding: EdgeInsets.all(8),
                          hintText: surfaceToBitStrokes.toStringAsFixed(0),
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 14),
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
                padding: const EdgeInsets.only(top: 12.0),
                child: Text("="),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      getText('pressure_stepdown', context),
                      style:
                          TextStyle(fontSize: 9, fontWeight: FontWeight.w500),
                    ),

                    SizedBox(
                      height: 18,
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.18,
                      child: Stack(
                        children: [
                          TextFormField(
                            textAlign: TextAlign.center,
                            readOnly: true,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(8),
                              hintText: '0.36',
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              //  suffixIcon: Padding(
                              //   padding:
                              //       const EdgeInsets.only(top: 10.0, right: 2.0),
                              //   child: Text("psi/strk",style: TextStyle(fontSize: 8),),
                              // ),
                              // suffixIconConstraints:
                              //     BoxConstraints(minWidth: 0, minHeight: 0),
                              // suffixStyle:
                              //     TextStyle(color: Colors.black, fontSize: 1),
                            ),
                          ),
                          Positioned(
                            bottom: 2,right:2,
                            child: Text('psi/stk',style: TextStyle(fontSize: 12)))
                        ],
                      ),
                    )
                    // Text("My Awesome Border"),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  completeCirculationWidget() {
    return Container(
        margin: const EdgeInsets.all(6.0),
        padding: const EdgeInsets.only(top: 18.0, bottom: 18),
        // decoration:
        //     BoxDecoration(border: Border.all(color: Colors.black)),
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
                              contentPadding: EdgeInsets.all(8),
                              isDense: true,
                              hintText: surfaceToBitStrokes.toStringAsFixed(0),
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 14),
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
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text("+"),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          getText('bit_to_surface_strokes', context),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
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
                              contentPadding: EdgeInsets.all(8),
                              hintText: bitToSurfaceStrokes.toStringAsFixed(0),
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 14),
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
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text("="),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          getText('total_strokes_to_kill_well', context),
                          style: TextStyle(
                              fontSize: 9, fontWeight: FontWeight.w500),
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
                              contentPadding: EdgeInsets.all(8),
                              hintText:
                                  totalStrokesToKillWell.toStringAsFixed(0),
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 14),
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
              SizedBox(height: 38),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                              contentPadding: EdgeInsets.all(8),
                              isDense: true,
                              hintText: surfaceToBitTime.toStringAsFixed(0),
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 14),
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
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text("+"),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          getText('bit_to_surface_time', context),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
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
                              contentPadding: EdgeInsets.all(8),
                              hintText: bitToSurfaceTime.toStringAsFixed(0),
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 14),
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
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text("="),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          getText('total_time_to_kill_well', context),
                          style: TextStyle(
                              fontSize: 9, fontWeight: FontWeight.w500),
                        ),

                        SizedBox(
                          height: 18,
                        ),

                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.18,
                          child: Stack(
                            children: [
                              TextFormField(
                                textAlign: TextAlign.center,
                                readOnly: true,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(8),
                                  hintText: totalTime.toStringAsFixed(0),
                                 
                                  hintStyle:
                                      TextStyle(color: Colors.black, fontSize: 14),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 2,
                                right: 2,
                                child:Text('min')
                              )
                            ],
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
        ));


        
  }

   Widget adjustedClfWidget() {
    return Container(
        margin: const EdgeInsets.all(6.0),
        padding: const EdgeInsets.only(top: 18.0, bottom: 18),
        // decoration:
        //     BoxDecoration(border: Border.all(color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    FittedBox(
                      child: Text(
                        getText('choke_line_psi', context),
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w500),
                      ),
                    ),

                    SizedBox(
                      height: 18,
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.12,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        readOnly: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          isDense: true,
                          hintText: '603',
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 14),
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
                padding: const EdgeInsets.only(top: 12.0),
                child: Text("\u00D7"),
              ),
              Expanded(
                  child: Column(
                children: [
                  Text(
                    getText('kill_mud_ppg', context),
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                  ),

                  SizedBox(
                    height: 18,
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.12,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      readOnly: true,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(8),
                        hintText: killMud.toStringAsFixed(0),
                        hintStyle: TextStyle(color: Colors.black, fontSize: 14),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                  )
                  // Text("My Awesome Border"),
                ],
              )),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text("\u00F7"),
              ),
              Expanded(
                child: Column(
                  children: [
                    FittedBox(
                      child: Text(
                        getText('original_mud_ppg', context),
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w500),
                      ),
                    ),

                    SizedBox(
                      height: 18,
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.12,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        readOnly: true,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.all(8),
                          hintText: originalMudppg.toStringAsFixed(0),
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 14),
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
                padding: const EdgeInsets.only(top: 12.0),
                child: Text("="),
              ),
              Expanded(
                child: Column(
                  children: [
                    FittedBox(
                      child: Text(
                        getText('changeinP',context)+' '+getText('clf', context),
                       
                        style:
                            TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                      ),
                    ),

                    SizedBox(
                      height: 18,
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.12,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        readOnly: true,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.all(8),
                          hintText: '664',
                          suffixIcon: Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, right: 2.0),
                            child: Text("psi"),
                          ),
                          suffixIconConstraints:
                              BoxConstraints(minWidth: 0, minHeight: 0),
                          suffixStyle:
                              TextStyle(color: Colors.black, fontSize: 6),
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 14),
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
        ));
  }



riserDataWidget() {
    return Container(
        margin: const EdgeInsets.all(6.0),
        padding: const EdgeInsets.only(top: 18.0, bottom: 18),
        // decoration:
        //     BoxDecoration(border: Border.all(color: Colors.black)),
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
                              contentPadding: EdgeInsets.all(8),
                              isDense: true,
                              hintText: '1380.4',
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 14),
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
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text("\u00F7"),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          getText('pump_output_bbl_stk', context),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
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
                              contentPadding: EdgeInsets.all(8),
                              hintText: pumpOutput.toStringAsFixed(3),
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 14),
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
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text("="),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          getText('riser_stroke', context),
                          style: TextStyle(
                              fontSize: 9, fontWeight: FontWeight.w500),
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
                              contentPadding: EdgeInsets.all(8),
                              hintText: '10458',
                                  // totalStrokesToKillWell.toStringAsFixed(0),
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 14),
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
              SizedBox(height: 38),
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
                              contentPadding: EdgeInsets.all(8),
                              isDense: true,
                              hintText: '10458',
                              // surfaceToBitTime.toStringAsFixed(0),
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 14),
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
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text("\u00F7"),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          getText('slow_circulating_rate_spm', context),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500),
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
                              contentPadding: EdgeInsets.all(8),
                              hintText: '30',
                              // bitToSurfaceTime.toStringAsFixed(0),
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 14),
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
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text("="),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          getText('time_to_displace_riser', context),
                          style: TextStyle(
                              fontSize: 9, fontWeight: FontWeight.w500),
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
                              contentPadding: EdgeInsets.all(8),
                              hintText: '348.6',
                              // totalTime.toStringAsFixed(0),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, right: 2.0),
                                child: Text("min"),
                              ),
                              suffixIconConstraints:
                                  BoxConstraints(minWidth: 0, minHeight: 0),
                              suffixStyle:
                                  TextStyle(color: Colors.black, fontSize: 6),
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 14),
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
        ));


        
  }

  pressureStepDownChartWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Row(
            children: [
              Text(
                '1',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 8),
              Text(getText('establish_i_c_p', context)),
            ],
          ),
          Divider(),
          Row(
            children: [
              Text(
                '2',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 8),
              Text(getText('calculate_f_c_p', context)),
            ],
          ),
          Divider(),
          Row(
            children: [
              Text(
                '3',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 8),
              Text(getText('calculate_stepdown', context)),
            ],
          ),
          Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '4',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 8),
              Expanded(
                  child: Text(getText(
                      'in_the_left_hand_column_record_strokes_in_100_stroke_intervals_until_final_circulating_pressure_is_reached',
                      context))),
            ],
          ),
          Divider(),
          Row(
            children: [
              Text(
                '5',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 8),
              Expanded(
                  child: Text(getText(
                      'record_i_c_p_in_top_right_column_and_deduct_pressure_changeinP_until_fcp_is_reached',
                      context))),
            ],
          ),
          Divider(),
        methodRig.isSubsea? Row(
            children: [
              Text(
                '6',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 8),
              Text(getText(
                  'calculate_adjusted_choke_line_friction_kill_mud', context)),
            ],
          ): SizedBox(),
          methodRig.isSubsea?   Divider() : SizedBox(),
          Row(
            children: [
            methodRig.isSubsea?   Text(
                '7',
                style: TextStyle(fontWeight: FontWeight.bold),
              ) : 
              Text(
                '6',
                style: TextStyle(fontWeight: FontWeight.bold),
              )
              ,
              SizedBox(width: 8),
              Text(getText('calculate_complete_circulation_in_strokes_and_time',
                  context)),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
