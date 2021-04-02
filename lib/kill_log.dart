import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/constants.dart';
import 'package:flutter_application_1/utilities/multilingual_service.dart';

class KillLog extends StatelessWidget {
  final List<Map<String, String>> listOfColumns = [
    {
      "time": "00:09:54",
      "strokes_pump": "0",
      "strokes_counter": "0",
      "dpp": "646",
      "cp": "748",
      "bhp": "6732",
      "casing_shoe": "4805",
      "pit_volume": "8.1",
      "formation_pressure": "6739",
      "co": "0.0000",
      "spm": "0"
    },
   {
      "time": "00:09:54",
      "strokes_pump": "0",
      "strokes_counter": "0",
      "dpp": "646",
      "cp": "748",
      "bhp": "6732",
      "casing_shoe": "4805",
      "pit_volume": "8.1",
      "formation_pressure": "6739",
      "co": "0.0000",
      "spm": "0"
    },
     {
      "time": "00:09:54",
      "strokes_pump": "0",
      "strokes_counter": "0",
      "dpp": "646",
      "cp": "748",
      "bhp": "6732",
      "casing_shoe": "4805",
      "pit_volume": "8.1",
      "formation_pressure": "6739",
      "co": "0.0000",
      "spm": "0"
    },
     {
      "time": "00:09:54",
      "strokes_pump": "0",
      "strokes_counter": "0",
      "dpp": "646",
      "cp": "748",
      "bhp": "6732",
      "casing_shoe": "4805",
      "pit_volume": "8.1",
      "formation_pressure": "6739",
      "co": "0.0000",
      "spm": "0"
    },
     {
      "time": "00:09:54",
      "strokes_pump": "0",
      "strokes_counter": "0",
      "dpp": "646",
      "cp": "748",
      "bhp": "6732",
      "casing_shoe": "4805",
      "pit_volume": "8.1",
      "formation_pressure": "6739",
      "co": "0.0000",
      "spm": "0"
    },
     {
      "time": "00:09:54",
      "strokes_pump": "0",
      "strokes_counter": "0",
      "dpp": "646",
      "cp": "748",
      "bhp": "6732",
      "casing_shoe": "4805",
      "pit_volume": "8.1",
      "formation_pressure": "6739",
      "co": "0.0000",
      "spm": "0"
    },
  ];
//  DataTableWidget(this.listOfColumns);     // Getting the data from outside, on initialization
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      // ConstrainedBox(
      //   constraints: BoxConstraints.expand( 
      //             width: MediaQuery.of(context).size.width
      //   ),
      
      SafeArea(
              child: ConstrainedBox(
           constraints: BoxConstraints.expand( 
                    width: MediaQuery.of(context).size.width
          ),
                child: 
                Column(
                 
                  children: [
                   Container(
          
           margin: const EdgeInsets.all(2.0),
          padding: const EdgeInsets.only(top: 12.0, bottom: 12,left: 10.0,right:10.0),
          decoration:
            BoxDecoration(border: Border.all(color:Color(0xff012160))),
          child: 
          Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Expanded(
               
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                  Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:10),
                      Text('Name: Wait and Weight',style: TextStyle(color:Color(0xff012160),fontSize: 12,fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height:30),
                   Text('Session:31/03/2021,2:33 PM',style: TextStyle(color:Color(0xff012160),fontSize: 12,fontWeight: FontWeight.bold)),
                 
                ],),
              ),
              Expanded(
                // flex: 1,
                child: Center(child: Text('Kill Log',style: TextStyle(color:Color(0xff012160),fontSize:20,fontWeight: FontWeight.bold),))),
               Expanded(
                
                                child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                 
                   Text('Wait and Weight',style: TextStyle(color:Color(0xff012160),fontSize: 12,fontWeight: FontWeight.bold)),
                    SizedBox(height:30),
                  Text('Choke Plugging',style: TextStyle(color:Color(0xff012160),fontSize: 12,fontWeight: FontWeight.bold)),
              ],),
               ),
            ],
          ),
          ),
     
          
          
                    Expanded(
                                        child: Column(
                                          
                                          //  shrinkWrap: true,
                                          children: [
            // ignore: missing_required_param
            Expanded(
                        child: SingleChildScrollView(

                          child: DataTable(

                    headingRowColor:
                                MaterialStateColor.resolveWith((states) => Colors.grey[200]),
                  columnSpacing: 13.0,
                  columns: [
                    DataColumn(
                                  label: Expanded(
                                      child: Text(
                                getText('time', context),
                                textAlign: TextAlign.center,
                    ))),
                   DataColumn(
                                  label: Expanded(
                                      child: Text(
                                'Strokes\nPump',
                                textAlign: TextAlign.center,
                    ))),
                   DataColumn(
                                  label: Expanded(
                                      child: Text(
                                  'Strokes\nCounter',
                                textAlign: TextAlign.center,
                    ))),
                    DataColumn(
                                  label: Expanded(
                                      child: Text(
                                getText('dpp', context),
                                textAlign: TextAlign.center,
                    ))),
                    DataColumn(
                                  label: Expanded(
                                      child: Text(
                                getText('cp', context),
                                textAlign: TextAlign.center,
                    ))),
                    DataColumn(
                                  label: Expanded(
                                      child: Text(
                                getText('bhp', context),
                                textAlign: TextAlign.center,
                    ))),
                    DataColumn(
                                  label: Expanded(
                                      child: Text(
                                'Casing\nShoe',
                                textAlign: TextAlign.center,
                    ))),
                    DataColumn(
                                  label: Expanded(
                                      child: Text(
                                getText('pit_volume', context),
                                textAlign: TextAlign.center,
                    ))),
                    DataColumn(
                                  label: Text(
                                'Formation\nPressure',
                                textAlign: TextAlign.center,
                    )),
                    DataColumn(
                                  label: Expanded(
                                      child: Text(
                                getText('co', context),
                                textAlign: TextAlign.center,
                    ))),
                    DataColumn(
                                  label: Expanded(
                                      child: Text(
                                getText('spm', context),
                                textAlign: TextAlign.center,
                    ))),
                  ],
                 
                  rows:
                                listOfColumns // Loops through dataColumnText, each iteration assigning the value to element
                                    .map(
                                      ((element) => 
                                      DataRow(
                                            cells: <DataCell>[
                              DataCell(Center(
                                  child: Text(element[
                                      "time"]))), //Extracting from Map element the value
                              DataCell(
                                  Center(child: Text(element["strokes_pump"]))),
                              DataCell(
                                  Center(child: Text(element["strokes_counter"]))),
                              DataCell(Center(
                                  child: Text(element[
                                      "dpp"]))), //Extracting from Map element the value
                              DataCell(Center(child: Text(element["cp"]))),
                              DataCell(Center(child: Text(element["bhp"]))),
                              DataCell(Center(
                                  child: Text(element[
                                      "casing_shoe"]))), //Extracting from Map element the value
                              DataCell(Center(child: Text(element["pit_volume"]))),
                              DataCell(Center(
                                  child: Text(element["formation_pressure"]))),
                              DataCell(Center(
                                  child: Text(element[
                                      "co"]))), //Extracting from Map element the value
                              DataCell(Center(child: Text(element["spm"]))),
                                            ],
                                          )),
                                    )
                                    .toList(),
                ),
              ),
            ),
          ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
