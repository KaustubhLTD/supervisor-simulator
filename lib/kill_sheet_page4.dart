import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/multilingual_service.dart';

class Killsheetfour extends StatefulWidget {
  @override
  _KillsheetfourState createState() => _KillsheetfourState();
}

class _KillsheetfourState extends State<Killsheetfour> {
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
                                titleContainer(getText('complete_circulation', context)),
                                completeCirculationWidget(),
                  
                              ],
                            )
                                //  height: 40,
                  
                                ),
          )),
                      Expanded(
                        flex: 1,
                        child: Container(
                        
                        child: Center(
                         child: Text('STROKE PRESSURE')
                        ),
                        ),
                      ),
                    ])));
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
                                        getText('scr_psi', context),
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
                                          hintStyle: TextStyle(
                                              color: Colors.black,
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
                                          hintText: '416',
                                          hintStyle: TextStyle(
                                              color: Colors.black,
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
                                  children: [
                                    Text(
                                      'drill String volume (bbls)',
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
                                          suffixStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 6),
                                          hintStyle: TextStyle(
                                              color: Colors.black,
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
                                        getText('scr_psi', context),
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
                                          hintStyle: TextStyle(
                                              color: Colors.black,
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
                                child: Text("\u00D7"),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      getText('kill_mud_ppg', context),
                                      style:
                                          TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
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
                                          hintText: '10.8',
                                          hintStyle: TextStyle(
                                              color: Colors.black,
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
                                          hintText: '9.8',
                                          hintStyle: TextStyle(
                                              color: Colors.black,
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
                                          suffixStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 6),
                                          hintStyle: TextStyle(
                                              color: Colors.black,
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
                                          hintStyle: TextStyle(
                                              color: Colors.black,
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
                                child: Text("+"),
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
                                          hintText: '416',
                                          hintStyle: TextStyle(
                                              color: Colors.black,
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
                                  children: [
                                    Text(
                                     getText('pressure_stepdown',context),
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
                                          hintText: '0.36',
                                          suffixIcon: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10.0, right: 2.0),
                                            child: Text("psi/stk"),
                                          ),
                                          suffixIconConstraints:
                                              BoxConstraints(minWidth: 0, minHeight: 0),
                                          suffixStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 6),
                                          hintStyle: TextStyle(
                                              color: Colors.black,
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
                                              hintText: '1089',
                                              hintStyle: TextStyle(
                                                  color: Colors.black,
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
                                    child: Text("+"),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          getText('bit_to_surface_strokes', context),
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
                                              hintText: '3763',
                                              hintStyle: TextStyle(
                                                  color: Colors.black,
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
                                      children: [
                                        Text(
                                         getText('total_strokes_to_kill_well',context),
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
                                              hintText: '4852',
                                            
                                              hintStyle: TextStyle(
                                                  color: Colors.black,
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
                
                              SizedBox(height:38),
                
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
                                              hintText: '36.3',
                                              hintStyle: TextStyle(
                                                  color: Colors.black,
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
                                    child: Text("+"),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          getText('bit_to_surface_time', context),
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
                                              hintText: '125.4',
                                              hintStyle: TextStyle(
                                                  color: Colors.black,
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
                                      children: [
                                        Text(
                                         getText('total_time_to_kill_well',context),
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
                                              hintText: '161.7',
                                              suffixIcon: Padding(
                                                padding:
                                                    const EdgeInsets.only(top: 10.0, right: 2.0),
                                                child: Text("mni"),
                                              ),
                                              suffixIconConstraints:
                                                  BoxConstraints(minWidth: 0, minHeight: 0),
                                              suffixStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 6),
                                              hintStyle: TextStyle(
                                                  color: Colors.black,
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
    Text('1',style: TextStyle(fontWeight: FontWeight.bold),),
     SizedBox(width:8),
        Text(getText('calculate_i_c_p', context)),
  ],
),
Divider(),
Row(

  children: [
    Text('2',style: TextStyle(fontWeight: FontWeight.bold),),
     SizedBox(width:8),
        Text(getText('calculate_f_c_p', context)),
  ],
),
Divider(),
Row(
  children: [
    Text('3',style: TextStyle(fontWeight: FontWeight.bold),),
     SizedBox(width:8),
        Text(getText('calculate_stepdown', context)),
  ],
),
Divider(),
Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('4',style: TextStyle(fontWeight: FontWeight.bold),),
    SizedBox(width:8),
        Expanded(child: Text(getText('in_the_left_hand_column_record_strokes_in_100_stroke_intervals_until_final_circulating_pressure_is_reached', context))),
  ],
),
Divider(),
Row(
  children: [
    Text('5',style: TextStyle(fontWeight: FontWeight.bold),),
     SizedBox(width:8),
        Expanded(child: Text(getText('record_i_c_p_in_top_right_column_and_deduct_pressure_changeinP_until_fcp_is_reached', context))),
  ],
),
Divider(),
Row(
  children: [
    Text('6',style: TextStyle(fontWeight: FontWeight.bold),),
     SizedBox(width:8),
        Text(getText('calculate_complete_circulation_in_strokes_and_time', context)),
  ],
),
Divider(),
                        ],),
                      );
}

                }
                
              