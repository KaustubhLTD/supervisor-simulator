import 'package:flutter/material.dart';
import 'package:flutter_application_1/configuration_details.dart';
import 'package:flutter_application_1/utilities/multilingual_service.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:intl/intl.dart';

class KillSheetThree extends StatefulWidget {
   SelectedMethodRig methodRig;
    var current;
  KillSheetThree(this.current,this.methodRig);
  @override
  _KillSheetThreeState createState() => _KillSheetThreeState(current,methodRig);
}

class _KillSheetThreeState extends State<KillSheetThree> {
   SelectedMethodRig methodRig;
//  DateTime date = DateTime.now();
String day = DateFormat('EEEE').format(DateTime.now());
String date =  DateFormat('dd-MMM-yyyy').format(DateTime.now());
String time =  DateFormat('HH:mm').format(DateTime.now());
var current;
_KillSheetThreeState(this.current,this.methodRig);
double surfaceLeackOffTest;
double casingShoeTVD;
double leakOffTestMudWeight;
double maximumMudWeight;
double drillingMudWeight;
double casingTVD;


double maximumAllowableAnnulusSurfacePressure;

double sicp;
double sidpp;
double tvdFromRKBH;
double tvdFromRKB;
double killMud;
double casingYeild;
double safetyFactor;

// double 

 void initState() {

    setState(() {
        var _config = current.configuration;
          var _sectionInfo = current.sectionInfo;
          var ks = current.killSheet;
      
leakOffTestMudWeight=_config.leakOffTests.mudWeight.value;
surfaceLeackOffTest = _config.leakOffTests.mudWeight.value;
casingShoeTVD = _config.casing.depth.value;
maximumMudWeight = ks.maximumMudWeight.value;
drillingMudWeight = ks.originalMud.density.value;
casingTVD = _config.casing.depth.value;
maximumAllowableAnnulusSurfacePressure=  ks.maximumAllowableAnnulusSurfacePressure.value;
sidpp = ks.sidpp.value;
tvdFromRKB = ks.tvd.value;
killMud = ks.killMud.density.value;
casingTVD = _config.casing.depth.value;
safetyFactor =_config.general.macpSafetyFactor.value;
casingYeild = _config.casing.yieldStrength.value;






       
         
             });
             // TODO: implement initState
             super.initState();
           }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
         scrollDirection: Axis.vertical,
        child: Column(
          children: [
            titleContainer(
                getText('read_and_record_sidpp_sicp_and_pit_gain', context)),
            readRecordWidget(),
            titleContainer(getText('max_mud_wt', context)),
            maxMudWtWidget(),
            titleContainer(getText('m_a_a_s_p', context)),
            maaspWidget(),
            titleContainer(getText('kill_mud', context)),
            killMudWtWidget(),
            titleContainer(getText('new_m_a_a_s_p', context)),
            newMaaspWidget(),
            titleContainer(getText('m_a_c_p', context)),
            macpWidget(),
          ],
        ),
      ),
    ));
  }

  titleContainer(String title) {
    return Container(
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

  Widget maxMudWtWidget() {
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
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Text(
                        getText('surface_leak_off_test', context),
                        style: TextStyle(
                            fontSize:  kIsWeb? 0 :10,  color: Colors.black),
                      ),
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
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 4.0),
                          child: Text("psi"),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                        suffixStyle: TextStyle(
                            
                             color: Colors.black,
                            fontSize: 6),
                        hintText: surfaceLeackOffTest.toStringAsFixed(0),
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
              padding: const EdgeInsets.only(top: 12.0),
              child: Text("\u00F7"),
            ),
            Expanded(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getText('casing_shoe_tvd', context),
                    style: TextStyle(  fontSize:  kIsWeb? 0 :10,  color: Colors.black),
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
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 2.0),
                          child: Text("ft"),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                        suffixStyle: TextStyle(
                            
                             color: Colors.black,
                            fontSize: 6),
                        hintText: casingShoeTVD.toStringAsFixed(0),
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
              padding: const EdgeInsets.only(top: 12.0),
              child: Text("\u00F7"),
            ),
            Expanded(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '',
                    style: TextStyle(  fontSize:  kIsWeb? 0 :10,  color: Colors.black),
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
                        hintText: '0.052',
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
              padding: const EdgeInsets.only(top: 12.0),
              child: Text("+"),
            ),
            Expanded(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Text(
                        getText('leak_off_test_mud_weight', context),
                        style: TextStyle(
                             fontSize:  kIsWeb? 0 :10,  color: Colors.black),
                      ),
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
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 2.0),
                          child: Text("ppg"),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                        suffixStyle: TextStyle(
                            
                             color: Colors.black,
                            fontSize: 6),
                        hintText: leakOffTestMudWeight.toStringAsFixed(1),
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
              padding: const EdgeInsets.only(top: 12.0),
              child: Text("="),
            ),
            Expanded(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getText('maximum_mud_weight', context),
                    style: TextStyle(  fontSize:  kIsWeb? 0 :10,  color: Colors.black),
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
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 2.0),
                          child: Text("ppg"),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                        suffixStyle: TextStyle(
                            
                             color: Colors.black,
                            fontSize: 6),
                        hintText: maximumMudWeight.toStringAsFixed(1),
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
      ),
    );
  }

  maaspWidget() {
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
            Text(
              '[',
              style: TextStyle(fontSize: 50),
            ),
            Expanded(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Text(
                      getText('maximum_mud_weight', context),
                      style:
                          TextStyle(  fontSize:  kIsWeb? 0 :10,  color: Colors.black),
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
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 4.0),
                          child: Text("ppg"),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                        suffixStyle: TextStyle(
                            
                             color: Colors.black,
                            fontSize: 6),
                        hintText: maximumMudWeight.toStringAsFixed(1),
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
              padding: const EdgeInsets.only(top: 12.0),
              child: Text("-"),
            ),
            Expanded(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Text(
                      getText('drilling_mud_weight', context),
                      style:
                          TextStyle(  fontSize:  kIsWeb? 0 :10,  color: Colors.black),
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
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 2.0),
                          child: Text("ppg"),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                        suffixStyle: TextStyle(
                            
                             color: Colors.black,
                            fontSize: 6),
                        hintText: drillingMudWeight.toStringAsFixed(1),
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
            Text(
              ']',
              style: TextStyle(fontSize: 50),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10.0),
              child: Text("\u00D7"),
            ),
            Expanded(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '',
                    style: TextStyle(  fontSize:  kIsWeb? 0 :10,  color: Colors.black),
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
                        hintText: '0.052',
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
              padding: const EdgeInsets.only(top: 12.0),
              child: Text("\u00D7"),
            ),
            Expanded(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Text(
                      getText('casing_tvd', context),
                      style:
                          TextStyle(  fontSize:  kIsWeb? 0 :10,  color: Colors.black),
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
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 2.0),
                          child: Text("ft"),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                        suffixStyle: TextStyle(
                            
                             color: Colors.black,
                            fontSize: 6),
                        hintText: casingTVD.toStringAsFixed(0),
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
              padding: const EdgeInsets.only(top: 12.0),
              child: Text("="),
            ),
            Expanded(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getText(
                        'maximum_allowable_annulus_surface_pressure', context),
                    style: TextStyle(
                        fontSize:  kIsWeb? 0 :9,
                       color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.width > 1047 ? 16 : 8,
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.12,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      readOnly: true,
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
                        hintText: maximumAllowableAnnulusSurfacePressure.toStringAsFixed(0),
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
      ),
    );
  }

  Widget killMudWtWidget() {
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
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Text(
                      getText('s_i_d_p_p', context),
                      style:
                          TextStyle(  fontSize:  kIsWeb? 0 :10,  color: Colors.black),
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
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 4.0),
                          child: Text("psi"),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                        suffixStyle: TextStyle(
                            
                             color: Colors.black,
                            fontSize: 6),
                        hintText: sidpp.toStringAsFixed(0),
                        hintStyle: TextStyle(
                            color: Colors.black,
                            //  color: Colors.black,
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
              padding: const EdgeInsets.only(top: 12.0),
              child: Text("\u00F7"),
            ),
            Expanded(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Text(
                      getText('t_v_d_from_rkb', context),
                      style:
                          TextStyle(  fontSize:  kIsWeb? 0 :10,  color: Colors.black),
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
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 2.0),
                          child: Text("ft"),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                        suffixStyle: TextStyle(
                            
                             color: Colors.black,
                            fontSize: 6),
                        hintText: tvdFromRKB.toStringAsFixed(0),
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
              padding: const EdgeInsets.only(top: 12.0),
              child: Text("\u00F7"),
            ),
            Expanded(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '',
                    style: TextStyle(  fontSize:  kIsWeb? 0 :10,  color: Colors.black),
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
                        hintText: '0.052',
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
              padding: const EdgeInsets.only(top: 12.0),
              child: Text("+"),
            ),
            Expanded(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getText('current_mud_weight', context),
                    style: TextStyle(  fontSize:  kIsWeb? 0 :10,  color: Colors.black),
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
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 2.0),
                          child: Text("ppg"),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                        suffixStyle: TextStyle(
                            
                             color: Colors.black,
                            fontSize: 6),
                        hintText: drillingMudWeight.toStringAsFixed(1),
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
              padding: const EdgeInsets.only(top: 12.0),
              child: Text("="),
            ),
            Expanded(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getText('kill_mud', context),
                    style: TextStyle(  fontSize:  kIsWeb? 0 :10,  color: Colors.black),
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
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 2.0),
                          child: Text("ppg"),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                        suffixStyle: TextStyle(
                            
                             color: Colors.black,
                            fontSize: 6),
                        hintText: killMud.toStringAsFixed(0),
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
      ),
    );
  }

  newMaaspWidget() {
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
            Text(
              '[',
              style: TextStyle(fontSize: 50),
            ),
            Expanded(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getText('maximum_mud_weight', context),
                    style: TextStyle(  fontSize:  kIsWeb? 0 :10,  color: Colors.black),
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
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 4.0),
                          child: Text("ppg"),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                        suffixStyle: TextStyle(
                            
                             color: Colors.black,
                            fontSize: 6),
                        hintText: maximumMudWeight.toStringAsFixed(1),
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
              padding: const EdgeInsets.only(top: 12.0),
              child: Text("-"),
            ),
            Expanded(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Text(
                      getText('kill_mud_weight', context),
                      style:
                          TextStyle(  fontSize:  kIsWeb? 0 :10,  color: Colors.black),
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
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 2.0),
                          child: Text("ppg"),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                        suffixStyle: TextStyle(
                            
                             color: Colors.black,
                            fontSize: 6),
                        hintText:  killMud.toStringAsFixed(1),
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
            Text(
              ']',
              style: TextStyle(fontSize: 50),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10.0),
              child: Text("\u00D7"),
            ),
            Expanded(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '',
                    style: TextStyle(  fontSize:  kIsWeb? 0 :10,  color: Colors.black),
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
                        hintText: '0.052',
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
              padding: const EdgeInsets.only(top: 12.0),
              child: Text("\u00D7"),
            ),
            Expanded(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getText('casing_tvd', context),
                    style: TextStyle(  fontSize:  kIsWeb? 0 :10,  color: Colors.black),
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
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 2.0),
                          child: Text("ft"),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                        suffixStyle: TextStyle(
                            
                             color: Colors.black,
                            fontSize: 6),
                        hintText:  casingTVD.toStringAsFixed(0),
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
              padding: const EdgeInsets.only(top: 12.0),
              child: Text("="),
            ),
            Expanded(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getText('new_maximum_allowable_annulus_surface_pressure',
                        context),
                      
                    style: TextStyle(
                      
                        fontSize:  kIsWeb? 11 :9,
                       color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.width > 1047 ? 18 : 8,
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.12,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      readOnly: true,
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
                        hintText: '748',
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
      ),
    );
  }

  macpWidget() {
    return Container(
      margin: const EdgeInsets.all(6.0),
      padding: const EdgeInsets.only(top: 18.0, bottom: 18),
      // decoration:
      //     BoxDecoration(border: Border.all(color: Colors.black)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          //  crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getText('casing_yield', context),
                  style: TextStyle(  fontSize:  kIsWeb? 0 :10,  color: Colors.black),
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
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(top: 10.0, right: 2.0),
                        child: Text("psi"),
                      ),
                      suffixIconConstraints:
                          BoxConstraints(minWidth: 0, minHeight: 0),
                      suffixStyle: TextStyle(
                         
                          fontSize: 6),
                      hintText:  casingYeild.toStringAsFixed(0),
                      hintStyle: TextStyle(
                        //  
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
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0),
              child: Text("\u00D7"),
            ),
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getText('safety_factor', context),
                  style: TextStyle(  fontSize:  kIsWeb? 0 :10,  color: Colors.black),
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
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(top: 10.0, right: 2.0),
                        child: Text(""),
                      ),
                      suffixIconConstraints:
                          BoxConstraints(minWidth: 0, minHeight: 0),
                      suffixStyle: TextStyle(
                         
                          fontSize: 6),
                      hintText:  safetyFactor.toStringAsFixed(2),
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
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 12.0,),
              child: Text("="),
            ),
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                  child: Container(
                    width: 100,
                    child: Text(
                      getText('maximum_allowable_surface_pressure', context),
                      style: TextStyle(
                          fontSize:  kIsWeb? 0 :9,
                         color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.12,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    readOnly: true,
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
                         
                          fontSize: 6),
                      hintText: '1201',
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
          ],
        ),
      ),
    );
  }

  readRecordWidget() {
    return Container(
      margin: const EdgeInsets.all(6.0),
      padding: const EdgeInsets.only(top: 18.0, bottom: 18),
      // decoration:
      //     BoxDecoration(border: Border.all(color: Colors.black)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           
  Column(
               crossAxisAlignment: CrossAxisAlignment.center,
              children: [

Text(
                  getText('sidpp', context),
                  style: TextStyle(fontSize: 14,  color: Colors.black),
                ),

                SizedBox(
                  height: 18,
                ),
                 Container(
                    height: 100.0,
                    //  width: 180.0,
                   child: Stack(
                     children: [
                       Image(image: AssetImage('assets/images/iconShadedCircle.png')),
                        Positioned(
                          right: 25,
                          top: 35,
                                                  child: Center(
                          child: SizedBox(
                            width: 50,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              readOnly: true,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(4),
                                isDense: true,
                                hintText: '623',
                                hintStyle: TextStyle(
                                    
                                     color: Colors.black,
                                    fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                            ),
                          ),
                      ),
                        ),
                          Positioned(
                          right: 24,
                          bottom:26,
                                                  child: Center(
                          child:Text('psi', style: TextStyle(  fontSize:  kIsWeb? 0 :10),),
                      ),
                        ),
                       ]),
                   //  child: Center(child: Text('Choose Configuration',style: TextStyle(color: Colors.white),)),
                 ),
           
                SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    Text('Day: ',style: TextStyle(fontSize: 16),),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.18,
                      child: TextFormField(
                        // textAlign: TextAlign.center,
                        readOnly: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(4),
                          isDense: true,
                      //  hintText: date,
                         hintText: day.toString(),
                          hintStyle: TextStyle(
                              
                               color: Colors.black,
                              fontSize: 14),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
                // Text("My Awesome Border"),
              ],
            ),

             Column(
               crossAxisAlignment: CrossAxisAlignment.center,
              children: [

Text(
                  getText('pit_gain', context),
                  style: TextStyle(fontSize: 14,  color: Colors.black),
                ),

                SizedBox(
                  height: 18,
                ),
                 Container(
                    height: 100.0,
                    //  width: 180.0,
                   child: Stack(
                     children: [
                       Image(image: AssetImage('assets/images/iconPitGainContainer.png')),
                        Positioned(
                          right: 10,
                          top: 40,
                                                  child: Center(
                          child: SizedBox(
                            width: 50,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              readOnly: true,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(4),
                                isDense: true,
                                hintText: '623',
                                hintStyle: TextStyle(
                                    
                                     color: Colors.black,
                                    fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                            ),
                          ),
                      ),
                        ),
                          Positioned(
                          right: 14,
                          bottom:20,
                                                  child: Center(
                          child:Text('bbls', style: TextStyle(  fontSize:  kIsWeb? 0 :10),),
                      ),
                        ),
                       ]),
                   //  child: Center(child: Text('Choose Configuration',style: TextStyle(color: Colors.white),)),
                 ),
           
                SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    Text('Date: ',style: TextStyle(fontSize: 16),),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.18,
                      child: TextFormField(
                        // textAlign: TextAlign.center,
                        readOnly: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(4),
                          isDense: true,
                        hintText: date,
                        
                          hintStyle: TextStyle(
                              
                               color: Colors.black,
                              fontSize: 14),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
                // Text("My Awesome Border"),
              ],
            ),



            Column(
               crossAxisAlignment: CrossAxisAlignment.center,
              children: [

Text(
                  getText('sicp', context),
                  style: TextStyle(fontSize: 14,  color: Colors.black),
                ),

                SizedBox(
                  height: 18,
                ),
                 Container(
                    height: 100.0,
                    //  width: 180.0,
                   child: Stack(
                     children: [
                       Image(image: AssetImage('assets/images/iconShadedCircle.png')),
                        Positioned(
                          right: 25,
                          top: 35,
                                                  child: Center(
                          child: SizedBox(
                            width: 50,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              readOnly: true,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(4),
                                isDense: true,
                                hintText: '623',
                                hintStyle: TextStyle(
                                    
                                     color: Colors.black,
                                    fontSize: 14),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                            ),
                          ),
                      ),
                        ),
                          Positioned(
                          right: 24,
                          bottom:26,
                                                  child: Center(
                          child:Text('psi', style: TextStyle(  fontSize:  kIsWeb? 0 :10),),
                      ),
                        ),
                       ]),
                   //  child: Center(child: Text('Choose Configuration',style: TextStyle(color: Colors.white),)),
                 ),
           
                SizedBox(
                  height: 18,
                ),
                 Row(
                  children: [
                    Text('Time: ',style: TextStyle(fontSize: 16),),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.18,
                      child: TextFormField(
                        // textAlign: TextAlign.center,
                        readOnly: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(4),
                          isDense: true,
                        hintText: time,
                        
                          hintStyle: TextStyle(
                              
                               color: Colors.black,
                              fontSize: 14),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
                // Text("My Awesome Border"),
              ],
            ),

            
            
           
          ],
        ),
      ),
    );
  }
}
