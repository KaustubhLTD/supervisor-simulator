import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/constants.dart';

class Configuration extends StatefulWidget {
  @override
  _ConfigurationState createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {
  double drillpipeOD = 5.0;
  double drillpipeID = 4.276;
  double drillCollarOD = 6.25;
  double drillCollarID = 2.78;
  double casingOD = 10.75;
  double casingID = 9.95;
  double drillbitSize = 8.5;
  double formationPressure = 5616.0;
  bool isSelected =false;

  int selectedIndex= 0;

List<String> configList = ["Well Config 1","Well Config 2","IADC Config 1","IADC Config 2","IADC Config 3","New Well Config 1","New IADC Config 2","New IADC Config 3"];
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
    return Scaffold(
  //     appBar: AppBar(
  //       leading: SizedBox(),
  //   title: Stack(
  //     children: <Widget>[
  //       Container(
  //         width: double.infinity,
  //         color: Colors.blue,
  //       ),
  //       Row(
  //         children: [
  //           Expanded(
  //             flex: 2,
  //                         child: Container(
  //                                                     child: Text(
  //               'Choose Configuration',
  //               style: TextStyle(fontSize: 14.0, color: Colors.white),
  //             ),
  //                         ),
  //           ),
            
  //           // SizedBox(width:50),
  //            Expanded(
  //              flex: 2,
  //                           child: Text(
  //               'Configuration Details',
  //               style: TextStyle(fontSize: 18.0, color: Colors.white),
  //           ),
  //            ),

  //         ],
  //       ),
  //     ],
  //   ),
  // ),
      
      body: SafeArea(
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
                            child: Center(child: Text('Choose Configuration',style: TextStyle(color: Colors.white),)),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                              height: 40,
                             color: Constants.configDetailsBack,
                            child: Center(child: Text('Configuration Details',style: TextStyle(color: Colors.white),)),
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
                            // color: Colors.yellow,
                            child: configurationDetails(),
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
     itemCount: configList.length,
    itemBuilder: (BuildContext ctxt, int index) {
     return  Column(
       mainAxisSize: MainAxisSize.min,
       children: [
         ListTile(
           trailing:  selectedIndex == index ? Icon(Icons.arrow_forward_ios,size: 16,): SizedBox(),
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  dense: true,
                  contentPadding: EdgeInsets.all(0.0),
                  title: Text(
                   configList[index],
                    style: TextStyle(fontSize: 16),
                  ),
                  onTap: (){
                    setState(() {
                      print(index);
                      selectedIndex = index;
                    
                    //  setColor = true;
                    });

                  },
                  ),
                  Divider()
       ],
     );
     
   
     
     }
      
      );
    // return SingleChildScrollView(
    //   child: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Column(
    //       //  mainAxisAlignment: MainAxisAlignment.start,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         ListTile(
    //           visualDensity: VisualDensity(horizontal: 0, vertical: -4),
    //           dense: true,
    //           contentPadding: EdgeInsets.all(0.0),
    //           title: Text(
    //             'Well Config 1',
    //             style: TextStyle(fontSize: 16),
    //           ),
    //           trailing: Icon(
    //             Icons.arrow_forward_ios,
    //             size: 10,
    //           ),
    //           onTap: () {
    //             setState(() {
    //               drillpipeOD = 5.0;
    //               drillpipeID = 4.276;
    //               drillCollarOD = 6.25;
    //               drillCollarID = 2.78;
    //               casingOD = 10.75;
    //               casingID = 9.95;
    //               drillbitSize = 8.5;
    //               formationPressure = 5616.0;
    //               isSelected=true;
    //             });
    //           },
    //         ),
    //         Divider(),
    //         ListTile(
    //           visualDensity: VisualDensity(horizontal: 0, vertical: -4),
    //           dense: true,
    //           contentPadding: EdgeInsets.all(0.0),
    //           title: Text(
    //             'Well Config 2',
    //             style: TextStyle(fontSize: 16),
    //           ),
    //           // trailing: Icon(
    //           //   Icons.arrow_forward_ios,
    //           //   size: 10,
    //           // ),
    //           onTap: () {
    //             setState(() {
    //               drillpipeOD = 15.0;
    //               drillpipeID = 14.276;
    //               drillCollarOD = 116.25;
    //               drillCollarID = 2.78;
    //               casingOD = 110.75;
    //               casingID = 9.95;
    //               drillbitSize = 8.5;
    //               formationPressure = 5616.0;
    //                isSelected=true;
    //             });
    //           },
    //         ),
    //         Divider(),
    //         ListTile(
    //           visualDensity: VisualDensity(horizontal: 0, vertical: -4),
    //           dense: true,
    //           contentPadding: EdgeInsets.all(0.0),
    //           title: Text(
    //             'IADC Config 1',
    //             style: TextStyle(fontSize: 16),
    //           ),
    //           // trailing: Icon(
    //           //   Icons.arrow_forward_ios,
    //           //   size: 10,
    //           // ),
    //             onTap: () {
    //             setState(() {
    //               drillpipeOD = 5.0;
    //               drillpipeID = 4.276;
    //               drillCollarOD = 6.25;
    //               drillCollarID = 2.78;
    //               casingOD = 10.75;
    //               casingID = 9.95;
    //               drillbitSize = 8.5;
    //               formationPressure = 5616.0;
    //                isSelected=true;
    //             });
    //           },
    //         ),
    //         Divider(),
    //         ListTile(
    //           visualDensity: VisualDensity(horizontal: 0, vertical: -4),
    //           dense: true,
    //           contentPadding: EdgeInsets.all(0.0),
    //           title: Text(
    //             'IADC Config 2',
    //             style: TextStyle(fontSize: 16),
    //           ),
    //           // trailing: Icon(
    //           //   Icons.arrow_forward_ios,
    //           //   size: 10,
    //           // ),
    //             onTap: () {
    //             setState(() {
    //               drillpipeOD = 5.0;
    //               drillpipeID = 4.276;
    //               drillCollarOD = 6.25;
    //               drillCollarID = 2.78;
    //               casingOD = 10.75;
    //               casingID = 9.95;
    //               drillbitSize = 8.5;
    //               formationPressure = 5616.0;
    //                isSelected=true;
    //             });
    //           },
    //         ),
    //         Divider(),
    //         ListTile(
    //           visualDensity: VisualDensity(horizontal: 0, vertical: -4),
    //           dense: true,
    //           contentPadding: EdgeInsets.all(0.0),
    //           title: Text(
    //             'IADC Config 3',                        
    //             style: TextStyle(fontSize: 16),
    //           ),
    //           // trailing: Icon(
    //           //   Icons.arrow_forward_ios,
    //           //   size: 10,
    //           // ),

    //             onTap: () {
    //             setState(() {
    //               drillpipeOD = 5.0;
    //               drillpipeID = 4.276;
    //               drillCollarOD = 6.25;
    //               drillCollarID = 2.78;
    //               casingOD = 10.75;
    //               casingID = 9.95;
    //               drillbitSize = 8.5;
    //               formationPressure = 5616.0;
    //                isSelected=true;
    //             });
    //           },
    //         ),
    //         Divider(),
    //         ListTile(
    //           visualDensity: VisualDensity(horizontal: 0, vertical: -4),
    //           dense: true,
    //           contentPadding: EdgeInsets.all(0.0),
    //           title: Text(
    //             'New Well Config 1',
    //             style: TextStyle(fontSize: 16),
    //           ),
    //           // trailing: Icon(
    //           //   Icons.arrow_forward_ios,
    //           //   size: 10,
    //           // ),

    //             onTap: () {
    //             setState(() {
    //               drillpipeOD = 5.0;
    //               drillpipeID = 4.276;
    //               drillCollarOD = 6.25;
    //               drillCollarID = 2.78;
    //               casingOD = 10.75;
    //               casingID = 9.95;
    //               drillbitSize = 8.5;
    //               formationPressure = 5616.0;
    //                isSelected=true;
    //             });
    //           },
    //         ),
    //         Divider(),
    //         ListTile(
    //           visualDensity: VisualDensity(horizontal: 0, vertical: -4),
    //           dense: true,
    //           contentPadding: EdgeInsets.all(0.0),
    //           title: Text(
    //             'New IADC Config 1',
    //             style: TextStyle(fontSize: 16),
    //           ),
    //           // trailing: Icon(
    //           //   Icons.arrow_forward_ios,
    //           //   size: 10,
    //           // ),

    //             onTap: () {
    //             setState(() {
    //               drillpipeOD = 5.0;
    //               drillpipeID = 4.276;
    //               drillCollarOD = 6.25;
    //               drillCollarID = 2.78;
    //               casingOD = 10.75;
    //               casingID = 9.95;
    //               drillbitSize = 8.5;
    //               formationPressure = 5616.0;
    //                isSelected=true;
    //             });
    //           },
    //         ),
    //         Divider(),
    //         ListTile(
    //           visualDensity: VisualDensity(horizontal: 0, vertical: -4),
    //           dense: true,
    //           contentPadding: EdgeInsets.all(0.0),
    //           title: Text(
    //             'New IADC Config 2',
    //             style: TextStyle(fontSize: 16),
    //           ),
    //           // trailing: Icon(
    //           //   Icons.arrow_forward_ios,
    //           //   size: 10,
    //           // ),

    //             onTap: () {
    //             setState(() {
    //               drillpipeOD = 5.0;
    //               drillpipeID = 4.276;
    //               drillCollarOD = 6.25;
    //               drillCollarID = 2.78;
    //               casingOD = 10.75;
    //               casingID = 9.95;
    //               drillbitSize = 8.5;
    //               formationPressure = 5616.0;
    //                isSelected=true;
    //             });
    //           },
    //         ),
    //         Divider(),
    //         ListTile(
    //           visualDensity: VisualDensity(horizontal: 0, vertical: -4),
    //           dense: true,
    //           contentPadding: EdgeInsets.all(0.0),
    //           title: Text(
    //             'New IADC Config 3',
    //             style: TextStyle(fontSize: 16),
    //           ),
    //           // trailing: Icon(
    //           //   Icons.arrow_forward_ios,
    //           //   size: 10,
    //           // ),

    //             onTap: () {
    //             setState(() {
    //               drillpipeOD = 5.0;
    //               drillpipeID = 4.276;
    //               drillCollarOD = 6.25;
    //               drillCollarID = 2.78;
    //               casingOD = 10.75;
    //               casingID = 9.95;
    //               drillbitSize = 8.5;
    //               formationPressure = 5616.0;
    //                isSelected=true;
    //             });
    //           },
    //         ),
    //         Divider(),
    //       ],
    //     ),
    //   ),
    // );
  }

  Widget configurationDetails() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            // height: 50,
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
                            decoration: InputDecoration(
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
                          decoration: InputDecoration(
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
                          decoration: InputDecoration(
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
                          decoration: InputDecoration(
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
                          decoration: InputDecoration(
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
                          decoration: InputDecoration(
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
                          decoration: InputDecoration(
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
                          decoration: InputDecoration(
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
          SizedBox(height: 20,),
          RaisedButton(
           shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(4.0),),
             color:Color(0xFF166ABE),
             child: Text('Continue With this Configuration',style: TextStyle(color: Colors.white),),
            onPressed: (){
           
          })
        ],
      ),
    );
  }
}
