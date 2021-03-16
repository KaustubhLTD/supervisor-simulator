import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/multilingual_service.dart';

class Killsheettwo extends StatefulWidget {
  @override
  _KillsheettwoState createState() => _KillsheettwoState();
}

class _KillsheettwoState extends State<Killsheettwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
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
                        child:  SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                  getText('read_and_record_slow_circulation_rate',context),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: readAndRecordSCR(),
                                              ),

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
                                  getText('read_and_record_slow_circulation_rate',context),
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
                          padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  getText('open_hole_data',context),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                       openHoleData(),
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
                                               
                                               Widget  readAndRecordSCR() {
                                                   return 
                       Table(
                                      
                                   // textDirection: TextDirection.rtl,
                                   // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                                  border:TableBorder.all(width: 1.0,color: Colors.grey),
                                   children: [
                                     TableRow(
                                       children: [
                                         Container(height: 40,child: Center(child: Text(getText('s_c_r', context),textScaleFactor: 1,))),
                                         Container(height: 40,child: Center(child: Text(getText('pump_no', context)+'1',textScaleFactor: 1,))),
                                         Container(height: 40,child: Center(child: Text(getText('pump_no', context)+'2',textScaleFactor: 1,))),
                                       ]
                                     ),
                                      TableRow(
                                       children: [
                                         Container(height: 40,child: Center(child: Text('10 spm',textScaleFactor: 1,))),
                                         Container(height: 40,child: Center(child: Text('127 psi',textScaleFactor: 1,))),
                                         Container(height: 40,child: Center(child: Text('127 psi',textScaleFactor: 1,))),
                                       ]
                                     ),
                                      TableRow(
                                       children: [
                                         Container(height: 40,child: Center(child: Text('20 spm',textScaleFactor: 1,))),
                                         Container(height: 40,child: Center(child: Text('178 psi',textScaleFactor: 1,))),
                                         Container(height: 40,child: Center(child: Text('178 psi',textScaleFactor: 1,))),
                                       ]
                                     ),
                                      TableRow(
                                       children: [
                                         Container(height: 40,child: Center(child: Text('30 spm',textScaleFactor: 1,))),
                                         Container(height: 40,child: Center(child: Text('276 psi',textScaleFactor: 1,))),
                                         Container(height: 40,child: Center(child: Text('276 psi',textScaleFactor: 1,))),
                                       ]
                                     ),
                                       
                                  
                                   
                                   ],
                               );
                                 
                             
                                                 
                                                 }
                       
                         drillStringData() {
                           return 
                            Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.black)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
             Column(
            
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
                             getText('drill_string_volume_bbls',context),
                              style: TextStyle(fontSize: 9,fontWeight: FontWeight.w500),
                            ),
                          ),
                         
                          SizedBox(
                            height: 18,
                          ),

                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.18,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              readOnly: true,
                              decoration: InputDecoration(
                             
                           isDense: true,
            
                                hintText: '134',
                                 hintStyle: TextStyle(
                                  color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14
                                ),
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
                      padding: const EdgeInsets.only(top:8.0),
                      child: Text("\u00F7"),
                    ),
                    Expanded(
                                      child: Column(
                        children: [
                          Text(
                           getText('pump_output_bbl_stk',context),
                            style: TextStyle(fontSize: 9,fontWeight: FontWeight.w500),
                          ),
                         
                          SizedBox(
                            height: 18,
                          ),

                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.18,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              readOnly: true,
                              decoration: InputDecoration(
                             
                           isDense: true,
                 
            
                                hintText: '0.123',
                                 hintStyle: TextStyle(
                                  color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14
                                ),
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
                       padding: const EdgeInsets.only(top:8.0),
                       child: Text("="),
                     ),

                      Expanded(
                                          child: Column(
                                            
                        children: [
                          Text(
                            
                             getText('surface_to_bit_strokes',context),
                              style: TextStyle(fontSize: 9,fontWeight: FontWeight.w500),
                            ),
                         
                          SizedBox(
                            height: 18,
                          ),

                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.18,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              readOnly: true,
                              decoration: InputDecoration(
                             
                           isDense: true,
                 
            
                                hintText: '1089',
                                 hintStyle: TextStyle(
                                  color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14
                                ),
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
             SizedBox(height:15),
             Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                                      child: Column(
                        children: [
                          FittedBox(
                                                child: Text(
                             getText('surface_to_bit_strokes',context),
                              style: TextStyle(fontSize: 9,fontWeight: FontWeight.w500),
                            ),
                          ),
                         
                          SizedBox(
                            height: 18,
                          ),

                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.18,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              readOnly: true,
                              decoration: InputDecoration(
                             
                           isDense: true,
            
                                hintText: '1089',
                                 hintStyle: TextStyle(
                                  color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14
                                ),
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
                      padding: const EdgeInsets.only(top:8.0),
                      child: Text("\u00F7"),
                    ),
                    Expanded(
                                      child: Column(
                        children: [
                          Text(
                           getText('slow_circulating_rate_spm',context),
                            style: TextStyle(fontSize: 9,fontWeight: FontWeight.w500),
                          ),
                         
                          SizedBox(
                            height: 18,
                          ),

                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.18,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              readOnly: true,
                              decoration: InputDecoration(
                             
                           isDense: true,
                 
            
                                hintText: '30',
                                 hintStyle: TextStyle(
                                  color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14
                                ),
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
                       padding: const EdgeInsets.only(top:8.0),
                       child: Text("="),
                     ),

                      Expanded(
                                          child: Column(
                                            
                        children: [
                          Text(
                            
                             getText('surface_to_bit_time',context),
                              style: TextStyle(fontSize: 9,fontWeight: FontWeight.w500),
                            ),
                         
                          SizedBox(
                            height: 18,
                          ),

                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.18,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              readOnly: true,
                              decoration: InputDecoration(
                             
                           isDense: true,
                 
              suffixIcon: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 28.0, right: 6.0),
                                            child: Text("min",style: TextStyle(fontSize: 10),),
                                          ),
                                          suffixIconConstraints:
                                              BoxConstraints(minWidth: 0, minHeight: 0),
                                          suffixStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 6),
                                hintText: '36.3',
                                 hintStyle: TextStyle(
                                  color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14
                                ),
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
                           return 
                            Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.black)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
             Column(
            
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
                             getText('bit_to_shoe_volume',context),
                              style: TextStyle(fontSize: 9,fontWeight: FontWeight.w500),
                            ),
                          ),
                         
                          SizedBox(
                            height: 18,
                          ),

                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.18,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              readOnly: true,
                              decoration: InputDecoration(
                             
                           isDense: true,
            
                                hintText: '175.3',
                                 hintStyle: TextStyle(
                                  color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14
                                ),
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
                      padding: const EdgeInsets.only(top:8.0),
                      child: Text("\u00F7"),
                    ),
                    Expanded(
                                      child: Column(
                        children: [
                          Text(
                           getText('pump_output_bbl_stk',context),
                            style: TextStyle(fontSize: 9,fontWeight: FontWeight.w500),
                          ),
                         
                          SizedBox(
                            height: 18,
                          ),

                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.18,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              readOnly: true,
                              decoration: InputDecoration(
                             
                           isDense: true,
                 
            
                                hintText: '0.123',
                                 hintStyle: TextStyle(
                                  color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14
                                ),
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
                       padding: const EdgeInsets.only(top:8.0),
                       child: Text("="),
                     ),

                      Expanded(
                                          child: Column(
                                            
                        children: [
                          Text(
                            
                             getText('bit_to_shoe_strokes',context),
                              style: TextStyle(fontSize: 9,fontWeight: FontWeight.w500),
                            ),
                         
                          SizedBox(
                            height: 18,
                          ),

                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.18,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              readOnly: true,
                              decoration: InputDecoration(
                             
                           isDense: true,
                 
            
                                hintText: '1425',
                                 hintStyle: TextStyle(
                                  color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14
                                ),
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
             SizedBox(height:15),
             Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                                      child: Column(
                        children: [
                          FittedBox(
                                                child: Text(
                             getText('surface_to_bit_strokes',context),
                              style: TextStyle(fontSize: 9,fontWeight: FontWeight.w500),
                            ),
                          ),
                         
                          SizedBox(
                            height: 18,
                          ),

                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.18,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              readOnly: true,
                              decoration: InputDecoration(
                             
                           isDense: true,
            
                                hintText: '1089',
                                 hintStyle: TextStyle(
                                  color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14
                                ),
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
                      padding: const EdgeInsets.only(top:8.0),
                      child: Text("\u00F7"),
                    ),
                    Expanded(
                                      child: Column(
                        children: [
                          Text(
                           getText('slow_circulating_rate_spm',context),
                            style: TextStyle(fontSize: 9,fontWeight: FontWeight.w500),
                          ),
                         
                          SizedBox(
                            height: 18,
                          ),

                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.18,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              readOnly: true,
                              decoration: InputDecoration(
                             
                           isDense: true,
                 
            
                                hintText: '30',
                                 hintStyle: TextStyle(
                                  color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14
                                ),
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
                       padding: const EdgeInsets.only(top:8.0),
                       child: Text("="),
                     ),

                      Expanded(
                                          child: Column(
                                            
                        children: [
                          Text(
                            
                             getText('surface_to_bit_time',context),
                              style: TextStyle(fontSize: 9,fontWeight: FontWeight.w500),
                            ),
                         
                          SizedBox(
                            height: 18,
                          ),

                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.18,
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              readOnly: true,
                              decoration: InputDecoration(
                             
                           isDense: true,
                 
              suffixIcon: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 28.0, right: 6.0),
                                            child: Text("min",style: TextStyle(fontSize: 10),),
                                          ),
                                          suffixIconConstraints:
                                              BoxConstraints(minWidth: 0, minHeight: 0),
                                          suffixStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 6),
                                hintText: '36.3',
                                 hintStyle: TextStyle(
                                  color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14
                                ),
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


}