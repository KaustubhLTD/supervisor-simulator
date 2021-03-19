import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/multilingual_service.dart';
import 'package:intl/intl.dart';

class KillSheetThree extends StatefulWidget {
  @override
  _KillSheetThreeState createState() => _KillSheetThreeState();
}

class _KillSheetThreeState extends State<KillSheetThree> {
//  DateTime date = DateTime.now();
String day = DateFormat('EEEE').format(DateTime.now());
String date =  DateFormat('dd-MMM-yyyy').format(DateTime.now());
String time =  DateFormat('HH:mm').format(DateTime.now());

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
                            fontSize: 10, fontWeight: FontWeight.w500),
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
                            
                            fontWeight: FontWeight.w500,
                            fontSize: 6),
                        hintText: '2122',
                        hintStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
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
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getText('casing_shoe_tvd', context),
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
                        contentPadding: EdgeInsets.all(8),
                        isDense: true,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 2.0),
                          child: Text("ft"),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                        suffixStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
                            fontSize: 6),
                        hintText: '8000',
                        hintStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
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
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '',
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
                        contentPadding: EdgeInsets.all(8),
                        isDense: true,
                        hintText: '0.052',
                        hintStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
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
                            fontSize: 10, fontWeight: FontWeight.w500),
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
                            
                            fontWeight: FontWeight.w500,
                            fontSize: 6),
                        hintText: '134',
                        hintStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
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
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getText('maximum_mud_weight', context),
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
                        contentPadding: EdgeInsets.all(8),
                        isDense: true,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 2.0),
                          child: Text("ppg"),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                        suffixStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
                            fontSize: 6),
                        hintText: '134',
                        hintStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
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
                        contentPadding: EdgeInsets.all(8),
                        isDense: true,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 4.0),
                          child: Text("ppg"),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                        suffixStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
                            fontSize: 6),
                        hintText: '14.4',
                        hintStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
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
                        contentPadding: EdgeInsets.all(8),
                        isDense: true,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 2.0),
                          child: Text("ppg"),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                        suffixStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
                            fontSize: 6),
                        hintText: '9.8',
                        hintStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
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
                        contentPadding: EdgeInsets.all(8),
                        isDense: true,
                        hintText: '0.052',
                        hintStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
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
                        contentPadding: EdgeInsets.all(8),
                        isDense: true,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 2.0),
                          child: Text("ft"),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                        suffixStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
                            fontSize: 6),
                        hintText: '4000',
                        hintStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
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
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getText(
                        'maximum_allowable_annulus_surface_pressure', context),
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
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
                            
                            fontWeight: FontWeight.w500,
                            fontSize: 6),
                        hintText: '956',
                        hintStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
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
                        contentPadding: EdgeInsets.all(8),
                        isDense: true,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 4.0),
                          child: Text("psi"),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                        suffixStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
                            fontSize: 6),
                        hintText: '416',
                        hintStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
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
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Text(
                      getText('t_v_d_from_rkb', context),
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
                        contentPadding: EdgeInsets.all(8),
                        isDense: true,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 2.0),
                          child: Text("ft"),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                        suffixStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
                            fontSize: 6),
                        hintText: '8000',
                        hintStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
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
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '',
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
                        contentPadding: EdgeInsets.all(8),
                        isDense: true,
                        hintText: '0.052',
                        hintStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
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
              child: Text("+"),
            ),
            Expanded(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getText('current_mud_weight', context),
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
                        contentPadding: EdgeInsets.all(8),
                        isDense: true,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 2.0),
                          child: Text("ppg"),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                        suffixStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
                            fontSize: 6),
                        hintText: '9.8',
                        hintStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
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
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getText('kill_mud', context),
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
                        contentPadding: EdgeInsets.all(8),
                        isDense: true,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 2.0),
                          child: Text("ppg"),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                        suffixStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
                            fontSize: 6),
                        hintText: '10.8',
                        hintStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
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
                        contentPadding: EdgeInsets.all(8),
                        isDense: true,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 4.0),
                          child: Text("ppg"),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                        suffixStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
                            fontSize: 6),
                        hintText: '14.4',
                        hintStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
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
                        contentPadding: EdgeInsets.all(8),
                        isDense: true,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 2.0),
                          child: Text("ppg"),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                        suffixStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
                            fontSize: 6),
                        hintText: '10.8',
                        hintStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
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
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Text("\u00D7"),
            ),
            Expanded(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '',
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
                        contentPadding: EdgeInsets.all(8),
                        isDense: true,
                        hintText: '0.052',
                        hintStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
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
              child: Text("\u00D7"),
            ),
            Expanded(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getText('casing_tvd', context),
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
                        contentPadding: EdgeInsets.all(8),
                        isDense: true,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10.0, right: 2.0),
                          child: Text("ft"),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                        suffixStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
                            fontSize: 6),
                        hintText: '4000',
                        hintStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
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
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getText('new_maximum_allowable_annulus_surface_pressure',
                        context),
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
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
                            
                            fontWeight: FontWeight.w500,
                            fontSize: 6),
                        hintText: '748',
                        hintStyle: TextStyle(
                            
                            fontWeight: FontWeight.w500,
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
                      hintText: '7040',
                      hintStyle: TextStyle(
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
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0),
              child: Text("\u00D7"),
            ),
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getText('safety_factor', context),
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
                      hintText: '5632',
                      hintStyle: TextStyle(
                         
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
              padding: const EdgeInsets.only(left: 18.0, right: 12.0),
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
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
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
                      hintText: '748',
                      hintStyle: TextStyle(
                         
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getText('sidpp', context),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),

                SizedBox(
                  height: 18,
                ),

                new Container(
                  height: 90.0,
                  width: 90.0,
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                      colors: [
                        Colors.blueGrey[50],
                        Colors.blueGrey[200],
                      ],
                    ),
                    shape: BoxShape.circle,
                     border: new Border.all( color: Colors.black, width: 4.0),
                    // border: new Border.all( width: 4.0),
                  ),
                  child: Stack(
                    children: [
                      Center(
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
                                  
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        right: 18,
                        child: Text(
                          'psi',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
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
                              
                              fontWeight: FontWeight.w500,
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
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getText('pit_gain', context),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),

                SizedBox(
                  height: 18,
                ),

                new Container(
                  height: 90.0,
                  width: 90.0,
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                      colors: [
                        Colors.blueGrey[50],
                        Colors.blueGrey[200],
                      ],
                    ),
                    shape: BoxShape.circle,
                     border: new Border.all( color: Colors.black, width: 4.0),
                    // border: new Border.all( width: 4.0),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: SizedBox(
                          width: 50,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            readOnly: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(4),
                              isDense: true,
                              hintText: '8.0',
                              hintStyle: TextStyle(
                                  
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        right: 18,
                        child: Text(
                          'lbs',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
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
                              
                              fontWeight: FontWeight.w500,
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
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getText('sicp', context),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),

                SizedBox(
                  height: 18,
                ),

                new Container(
                  height: 90.0,
                  width: 90.0,
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                      colors: [
                        Colors.blueGrey[50],
                        Colors.blueGrey[200],
                      ],
                    ),
                    shape: BoxShape.circle,
                   border: new Border.all( color: Colors.black, width: 4.0),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: SizedBox(
                          width: 50,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            readOnly: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(4),
                              isDense: true,
                              hintText: '724',
                              hintStyle: TextStyle(
                                  
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        right: 18,
                        child: Text(
                          'psi',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
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
                              
                              fontWeight: FontWeight.w500,
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
