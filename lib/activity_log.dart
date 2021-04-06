import 'package:flutter/material.dart';

class ActivityLog extends StatefulWidget {
  @override
  _ActivityLogState createState() => _ActivityLogState();
}

class _ActivityLogState extends State<ActivityLog> {
  List lr = ['hey', 'hello', 'how are u'];

  Map<String, List<String> > dynamicMap = {
    '1) Pumps to Kill Speed - Startup to Kill Procedure': 
    [
    'You have effortlessly bought the pumps to Kill Speed',
    'You were able to keep the Kill Line Pressure Close to SICP', 
    'You were able to switch to Kill Procedure on time'
    ],
   
   '2) Pumps to Kill Speed - Startup to Kill Procedure': 
    [
    'You have effortlessly bought the pumps to Kill Speed',
    'You were able to keep the Kill Line Pressure Close to SICP', 
    'You were able to switch to Kill Procedure on time'
    ],
   
     '3) Pumps to Kill Speed - Startup to Kill Procedure': 
    [
    'You have effortlessly bought the pumps to Kill Speed',
    'You were able to keep the Kill Line Pressure Close to SICP', 
    'You were able to switch to Kill Procedure on time'
    ],
  };
  @override
  void initState() {
    Map<String, dynamic> dynamicMap = {
      'a': ['heyyy there i want this', 'hello', 'ssup'],
      'b': ['1', '2', '3'],
      'c': ['1', '2', '3'],
    };
    dynamicMap.forEach((key, value) {
      print("Title :" + key);
      for (int i = 0; i < 3; i++) print("values :" + value[i]);
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
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
                child: Center(child: Text('Activity Log',style: TextStyle(color:Color(0xff012160),fontSize:20,fontWeight: FontWeight.bold),))),
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
        new Expanded(
            child: new ListView.builder(
          itemCount: dynamicMap.length,
          itemBuilder: (BuildContext context, int index) {
            String key = dynamicMap.keys.elementAt(index);
            

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text('${key}',style: TextStyle(fontWeight: FontWeight.bold,),),
                  SizedBox(height:2),
                  for (int i = 0; i < dynamicMap.values.length; i++)
                    FittedBox(child: new Text('        - ' + dynamicMap[key][i].toString(),style: TextStyle(color:Colors.green,letterSpacing: 0.5),))
                ],
              ),
            );
          },
        ))
      ]),
    ));
  }
}
