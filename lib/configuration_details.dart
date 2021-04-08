import 'package:flutter/material.dart';
import 'package:flutter_application_1/mode_selection.dart';
import 'package:flutter_application_1/utilities/constants.dart';
import 'package:mm_initial_data/mmid_dm_wwm_initial_data.dart';

class Configuration extends StatefulWidget {
  SelectedConfigurations sc;
  Configuration(this.sc);
  @override
  _ConfigurationState createState() => _ConfigurationState(sc);
}

// class ConfigInfo{
//   String filename;
//   double id;
//   String key;
//   String name;

//   ConfigInfo(this.id,this.key,this.name);
// }

class SelectedMethodRig {
  bool isDrillersMethod;
  bool isSubsea;
  int selectedConfigIndex = 0;
}

class _ConfigurationState extends State<Configuration> {
  SelectedConfigurations sc;
  _ConfigurationState(this.sc);

  SelectedMethodRig methodRig = new SelectedMethodRig();
  double drillpipeOD;
  double drillpipeID;
  double drillCollarOD;
  double drillCollarID;
  double casingOD;
  double casingID;
  double drillbitSize;
  double surfaceLineVol;
  double chokeLineId;
  double openHoleDiameter;
  double fracturePressureGradient;
  double formationPressure;
  double lot;
  double fitLowerRange;
  double surfaceLineRadius;


  String drillpipeODUnit;

  bool isSelected = false;

  int selectedIndex = 0;

   bool isLoaded = false;

  // int selectedConfigIndex = 0;

  List<String> configList = [
    "Well Config 1",
    "Well Config 2",
    "IADC Config 1",
    "IADC Config 2",
    "IADC Config 3",
    "New Well Config 1",
    "New IADC Config 2",
    "New IADC Config 3"
  ];

  List<ConfigInfo> configData = [];

  @override
  void initState() {
    if (sc.selectedField == 'Wait and Weight' && sc.selectedRig == 'Subsea') {
      methodRig.isDrillersMethod = false;
      methodRig.isSubsea = true;
    } else if (sc.selectedField == 'Wait and Weight' &&
        sc.selectedRig == 'Surface') {
      methodRig.isDrillersMethod = false;
      methodRig.isSubsea = false;
    } else if (sc.selectedField == "Driller's Method" &&
        sc.selectedRig == 'Surface') {
      methodRig.isDrillersMethod = true;
      methodRig.isSubsea = false;
    } else if (sc.selectedField == "Driller's Method" &&
        sc.selectedRig == 'Subsea') {
      methodRig.isDrillersMethod = true;
      methodRig.isSubsea = true;
    }

    Units().initialize().then((value) {
      DmWwmInitialData().loadConfigMetaData().then((success) {
        if (DmWwmInitialData().configMetaData == null) {
          print('configMetaData is NULL');
          return;
        }

        DmWwmInitialData().configMetaData.configInfo.forEach((ci) {
          print(ci.toString());
          configData.add(ci);
          print(
              '** configMetaData configInfo id ${ci.id} key ${ci.key} name: ${ci.name}');
        });

         loadConfigurationDetails(0);
        isLoaded = true;
        setState(() {});
      });
    });

    // TODO: implement initState
    super.initState();
  }

  loadConfigurationDetails(int index) async{
 await   DmWwmInitialData()
        .configMetaData
        .configInfo[index]
        .loadConfig(
            isDrillersMethod: methodRig.isDrillersMethod,
            isSubsea: methodRig.isSubsea,
            influxType: InfluxType.gas)
        .then((success) {
      //  printConfig();
      setState(() {
        var _config = DmWwmInitialData().current.configuration;
        var name = DmWwmInitialData().current.configInfo.name;
        // print(name);
        // drillpipeOD = _config.drillstring[0].outerDiameter.value;
        // print(drillpipeOD);
        // drillpipeID = _config.drillstring[0].innerDiameter.value;
        // print(drillpipeID);
        // drillCollarOD = _config.drillstring[2].outerDiameter.value;
        // print(drillCollarOD);
        // drillCollarID = _config.drillstring[2].innerDiameter.value;
        // print(drillCollarID);
        // casingOD = _config.casing.outerDiameter.value;
        // print(casingOD);
        // casingID = _config.casing.innerDiameter.value;
        // print(casingID);
        // drillbitSize = _config.drillbit.width.value;
        // print(drillbitSize);
        // formationPressure =
        //     _config.fracturePressure.fracturePressureGradient.value;

        surfaceLineRadius = _config.surfaceLine.innerDiameter.value / 2;
        surfaceLineVol = 3.14 *
            surfaceLineRadius *
            surfaceLineRadius *
            _config.surfaceLine.length.value;
        drillpipeOD = _config.drillstring[0].outerDiameter.value;

        drillpipeID = _config.drillstring[0].innerDiameter.value;

        drillCollarOD = _config.drillstring[2].outerDiameter.value;

        drillCollarID = _config.drillstring[2].innerDiameter.value;

        casingOD = _config.casing.outerDiameter.value;

        casingID = _config.casing.innerDiameter.value;

        chokeLineId = _config.chokeLine.innerDiameter.value;

        openHoleDiameter = 8.5;

        formationPressure = 6739;

        drillbitSize = _config.drillbit.width.value;

        fracturePressureGradient =
            _config.fracturePressure.fracturePressureGradient.value;

        lot = _config.leakOffTests.mudWeight.value;
        fitLowerRange = 10.0;
        //  casingOD =  _config.casing.length.value;
        // print("length" + casingOD.toString());

        sc.selectedConfigIndex = index;
      });
      // print('suceed');
    });
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return orientation == Orientation.portrait
            ? buildVerticalLayout()
            : buildHorizontalLayout();
      },
    );
  }

  Widget buildVerticalLayout() {
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        child: Center(child: Text('Only lanscape mode as of now')),
      ),
    );
  }

  Widget buildHorizontalLayout() {
    return 
    
    
    Scaffold(

      
      // bottomNavigationBar: Row(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //    Padding(
      //      padding: const EdgeInsets.only(right:90.0,bottom: 50),
      //      child: SizedBox(
      //        width: 250,
      //        height: 40,
      //        child: RaisedButton(
      //          color: Color(0xFF166ABE),
      //          child: Center(
      //            child: Text(
      //              'Continue With this configuration',
      //              style: TextStyle(color: Colors.white),
      //              textAlign: TextAlign.center,
      //            ),
      //          ),
      //          onPressed: () {
      //            Navigator.pushNamed(context, '/activityselection', arguments: sc);
      //          },
      //        ),
      //      ),
      //    ),
      //   ],
      // ),
      body: 
      
       isLoaded == false
            ? Center(
                child:
                    CircularProgressIndicator(), // AssetProgressIndicator(currentValue: loadingPercentage),
              )
            :
      SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      height: 40,
                      color: Constants.configListBack,
                      //  color: Colors.red,
                      child: Center(
                          child: Text(
                        'Choose Configuration',
                        style: TextStyle(color: Colors.white),
                      )),
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      height: 40,
                      color: Constants.configDetailsBack,
                      child: Center(
                          child: Text(
                        'Configuration Details',
                        style: TextStyle(color: Colors.white),
                      )),
                    ))
              ],
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        // color: Colors.red,
                        child: chooseConfiguration(),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        //  color: Colors.yellow,
                        child: sc.selectedRig=='Subsea' ? configurationDetailsSubsea(): configurationDetails(),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget chooseConfiguration() {
    return ListView.builder(
        itemCount: configData.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return getConfigList(configData[index], context, index);
        });
  }

  Widget getConfigList(ConfigInfo ci, BuildContext context, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          trailing: selectedIndex == index
              ? Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                )
              : SizedBox(),
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          dense: true,
          contentPadding: EdgeInsets.all(0.0),
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              ci.name,
              style: TextStyle(fontSize: 16),
            ),
          ),
          onTap: () {
            setState(() {
              print(index);
              selectedIndex = index;

              loadConfigurationDetails(index);

              //  setColor = true;
            });
          },
        ),
        Divider()
      ],
    );
  }

  Widget configurationDetails() {
    return ListView(
      children: [
        Container(
          //  height: 50,
          color: Colors.grey.withOpacity(0.4),
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
            child: Row(
              children: [
                Text('Configuration Details'),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              Expanded(child: Text('Drillpipe OD')),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.black),
                            isDense: true,
                            contentPadding: EdgeInsets.all(8.0),
                            hintText: drillpipeOD.toString(),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(5.7),
                            ),
                          )),
                    ),
                    Text('  inches  ')
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(),
        Row(
          children: [
            Expanded(child: Text('Drillpipe ID')),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.black),
                          isDense: true,
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: drillpipeID.toString(),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5.7),
                          ),
                        )),
                  ),
                  Text('  inches  ')
                ],
              ),
            ),
          ],
        ),
        Divider(),
        //  Row(
        //   children: [
        //     Expanded(child: Text('Drillpipe ID')),
        //     Expanded(
        //       child: Row(
        //         children: [
        //           Expanded(
        //             child: TextFormField(
        //                 decoration: InputDecoration(
        //               isDense: true,
        //               contentPadding: EdgeInsets.all(8.0),
        //               hintText:  drillpipeID.toString(),
        //               border: OutlineInputBorder(
        //                 borderSide: BorderSide(color: Colors.white),
        //                 borderRadius: BorderRadius.circular(5.7),
        //               ),
        //             )),
        //           ),
        //           Text('  inches  ')
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        // Divider(),
        Row(
          children: [
            Expanded(child: Text('Drill collar OD')),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.black),
                          isDense: true,
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: drillCollarOD.toString(),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5.7),
                          ),
                        )),
                  ),
                  Text('  inches  ')
                ],
              ),
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            Expanded(child: Text('Drill collar ID')),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.black),
                          isDense: true,
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: drillCollarID.toString(),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5.7),
                          ),
                        )),
                  ),
                  Text('  inches  ')
                ],
              ),
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            Expanded(child: Text('Casing OD')),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.black),
                          isDense: true,
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: casingOD.toString(),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5.7),
                          ),
                        )),
                  ),
                  Text('  inches  ')
                ],
              ),
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            Expanded(child: Text('Casing ID')),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.black),
                          isDense: true,
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: casingID.toString(),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5.7),
                          ),
                        )),
                  ),
                  Text('  inches  ')
                ],
              ),
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            Expanded(child: Text('Drillbit size')),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.black),
                          isDense: true,
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: drillbitSize.toString(),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5.7),
                          ),
                        )),
                  ),
                  Text('  inches  ')
                ],
              ),
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            Expanded(child: Text('Formation Pressure')),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.black),
                          isDense: true,
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: formationPressure.toString(),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5.7),
                          ),
                        )),
                  ),
                  Text('  psi        ')
                ],
              ),
            ),
          ],
        ),

        SizedBox(
          height: 150,
        ),
        Container(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: 250,
              height: 50,
              child: RaisedButton(
                color: Color(0xFF166ABE),
                child: Center(
                  child: Text(
                    'Continue With this configuration',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                onPressed: () {
                  // Navigator.pushNamed(context, '/activityselection');
                    Navigator.pushNamed(context, '/activityselection', arguments: sc);
                  //  Navigator.pushNamed(context,  '/killsheet', arguments: sc);
                },
              ),
            ),
          ),
        ),

        SizedBox(
          height: 30,
        ),
        // RaisedButton(onPressed: (){})
        // ignore: deprecated_member_use
        //       Container(
        //         width: 50,
        //         child: RaisedButton(

        //          shape: RoundedRectangleBorder(

        // borderRadius: BorderRadius.circular(4.0),),
        //            color:Color(0xFF166ABE),
        //            child: Text('Continue With this Configuration',style: TextStyle(color: Colors.white),),
        //           onPressed: (){

        //         }),
        //       )
      ],
    );
  }

   Widget configurationDetailsSubsea() {
    return ListView(
      children: [


        Container(
          //  height: 50,
          color: Colors.grey.withOpacity(0.4),
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
            child: Row(
              children: [
                Text('Configuration Details'),
              ],
            ),
          ),
        ),


         Row(
          children: [
            Expanded(child: Text('Surface Line Volume')),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.black),
                          isDense: true,
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: surfaceLineVol.toString(),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5.7),
                          ),
                        )),
                  ),
                  Text('  inches  ')
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              Expanded(child: Text('Drillpipe OD')),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.black),
                            isDense: true,
                            contentPadding: EdgeInsets.all(8.0),
                            hintText: drillpipeOD.toString(),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(5.7),
                            ),
                          )),
                    ),
                    Text('  inches  ')
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(),
        Row(
          children: [
            Expanded(child: Text('Drillpipe ID')),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.black),
                          isDense: true,
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: drillpipeID.toString(),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5.7),
                          ),
                        )),
                  ),
                  Text('  inches  ')
                ],
              ),
            ),
          ],
        ),
        Divider(),
        //  Row(
        //   children: [
        //     Expanded(child: Text('Drillpipe ID')),
        //     Expanded(
        //       child: Row(
        //         children: [
        //           Expanded(
        //             child: TextFormField(
        //                 decoration: InputDecoration(
        //               isDense: true,
        //               contentPadding: EdgeInsets.all(8.0),
        //               hintText:  drillpipeID.toString(),
        //               border: OutlineInputBorder(
        //                 borderSide: BorderSide(color: Colors.white),
        //                 borderRadius: BorderRadius.circular(5.7),
        //               ),
        //             )),
        //           ),
        //           Text('  inches  ')
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        // Divider(),
        Row(
          children: [
            Expanded(child: Text('Drill collar OD')),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.black),
                          isDense: true,
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: drillCollarOD.toString(),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5.7),
                          ),
                        )),
                  ),
                  Text('  inches  ')
                ],
              ),
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            Expanded(child: Text('Drill collar ID')),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.black),
                          isDense: true,
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: drillCollarID.toString(),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5.7),
                          ),
                        )),
                  ),
                  Text('  inches  ')
                ],
              ),
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            Expanded(child: Text('Casing OD')),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.black),
                          isDense: true,
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: casingOD.toString(),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5.7),
                          ),
                        )),
                  ),
                  Text('  inches  ')
                ],
              ),
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            Expanded(child: Text('Casing ID')),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.black),
                          isDense: true,
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: casingID.toString(),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5.7),
                          ),
                        )),
                  ),
                  Text('  inches  ')
                ],
              ),
            ),
          ],
        ),
        Divider(),
         Row(
          children: [
            Expanded(child: Text('Choke Line ID')),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.black),
                          isDense: true,
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: chokeLineId.toString(),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5.7),
                          ),
                        )),
                  ),
                  Text('  inches  ')
                ],
              ),
            ),
          ],
        ),
         Divider(),
         Row(
          children: [
            Expanded(child: Text('Open Hole Diameter')),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.black),
                          isDense: true,
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: openHoleDiameter.toString(),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5.7),
                          ),
                        )),
                  ),
                  Text('  inches  ')
                ],
              ),
            ),
          ],
        ),
         Divider(),
        Row(
          children: [
            Expanded(child: Text('Formation Pressure')),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.black),
                          isDense: true,
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: formationPressure.toString(),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5.7),
                          ),
                        )),
                  ),
                  Text('  inches  ')
                ],
              ),
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            Expanded(child: Text('Fractual Pressure Gradient')),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.black),
                          isDense: true,
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: fracturePressureGradient.toString(),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5.7),
                          ),
                        )),
                  ),
                  Text('  psi / ft  ')
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 6,),
      Container(
          //  height: 50,
          color: Colors.grey.withOpacity(0.4),
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
            child: Row(
              children: [
                Text('LOT and FIT test at Casing Shoe'),
              ],
            ),
          ),
        ),
        SizedBox(height: 6,),

         Row(
          children: [
            Expanded(child: Text('Leack off test(LOT)')),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.black),
                          isDense: true,
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: lot.toString(),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5.7),
                          ),
                        )),
                  ),
                  Text('    ppg    ')
                ],
              ),
            ),
          ],
        ),
SizedBox(height: 6,),
         Row(
          children: [
            Expanded(child: Text('FIT Lower Range')),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.black),
                          isDense: true,
                          contentPadding: EdgeInsets.all(8.0),
                          hintText: fitLowerRange.toString(),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5.7),
                          ),
                        )),
                  ),
                  Text('    ppg    ')
                ],
              ),
            ),
          ],
        ),


        SizedBox(
          height: 150,
        ),
        Container(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: 250,
              height: 50,
              child: RaisedButton(
                color: Color(0xFF166ABE),
                child: Center(
                  child: Text(
                    'Continue With this configuration',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/activityselection', arguments: sc);
                },
              ),
            ),
          ),
        ),

        SizedBox(
          height: 30,
        ),
        // RaisedButton(onPressed: (){})
        // ignore: deprecated_member_use
        //       Container(
        //         width: 50,
        //         child: RaisedButton(

        //          shape: RoundedRectangleBorder(

        // borderRadius: BorderRadius.circular(4.0),),
        //            color:Color(0xFF166ABE),
        //            child: Text('Continue With this Configuration',style: TextStyle(color: Colors.white),),
        //           onPressed: (){

        //         }),
        //       )
      ],
    );
  }


}
