
import 'package:flutter/material.dart';
import 'package:flutter_application_1/kill_sheet.dart';
import 'package:flutter_application_1/mode_selection.dart';
import 'package:flutter_application_1/sign_in.dart';
import 'package:flutter_application_1/utilities/multilingual_service.dart';
import 'package:flutter_application_1/widgets/multilingual.dart';


//import 'choke_panel/choke_panel_main.dart';


class ActivitySelectionScreen extends StatefulWidget {
   SelectedConfigurations sc;
 ActivitySelectionScreen(this.sc);
  @override
  _ActivitySelectionScreenState createState() =>
      _ActivitySelectionScreenState(sc);
}

class _ActivitySelectionScreenState extends State<ActivitySelectionScreen> {
  SelectedConfigurations sc;
 _ActivitySelectionScreenState(this.sc);



  bool isAssetsLoaded = false;
  double loadingPercentage = 50;
  Future<void> laodImages(BuildContext context) async {
    await precacheImage(
        AssetImage(
            "assets/images/bgSimulationSelectionDown.png"),
        context);
    setState(() {
      loadingPercentage = 70;
    });
    await precacheImage(
        AssetImage(
            "assets/images/bgSubseaActivityScreen.png"),
        context);
    setState(() {
      loadingPercentage = 80;
    });

    final List<ActivityModel> _activityList =
        ActivityModel.getActivityList(context);
    for (ActivityModel model in _activityList) {
      await precacheImage(AssetImage(model.activityImagePath), context);
    }

    setState(() {
      loadingPercentage = 90;
    });
    // await precacheImage(
    //     AssetImage("assets/images/control/up_down_lever_off.png"), context);
    setState(() {
      loadingPercentage = 100;

      isAssetsLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    laodImages(context);
    return Scaffold(
      body: !isAssetsLoaded
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
                      child: Container(
                child: //ActivitySlection(),
                    Column(
                  children: <Widget>[
                    SimulatorHeader(sc),
                  
                    Expanded(child: ActivitySlection(sc)),
                  ],
                ),
              ),
          ),
    );
  }
}

class ActivitySlection extends StatefulWidget {
  SelectedConfigurations sc;
  ActivitySlection(this.sc);

  @override 
  _ActivitySlectionState createState() => _ActivitySlectionState(sc);
}

class _ActivitySlectionState extends State<ActivitySlection>  with SingleTickerProviderStateMixin{
   SelectedConfigurations sc;
  _ActivitySlectionState(this.sc);

     final module1Key = new GlobalKey();
         final module2Key = new GlobalKey();
          final module3Key = new GlobalKey();
           final module4Key = new GlobalKey();

   TabController _tabController;
 @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final List<ActivityModel> activityList =
        ActivityModel.getActivityList(context);
        final List<ActivityModel> activityListModuleTwo =
        ActivityModel.getActivityListTwo(context);
        final List<ActivityModel> activityListModuleThree =
        ActivityModel.getActivityListThree(context);
          final List<ActivityModel> activityListEvaluation =
        ActivityModel.getActivityListEvaluation(context);
       
     
    return Container(
      height: MediaQuery.of(context).size.height -
          (MediaQuery.of(context).size.height * 0.20),
      //height: double.infinity,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            // SimulationGlobal.isSurface
              // ? 
              "assets/images/bgSimulationSelectionDown.png"
              // : "assets/images/activity_selection_screen/bgSubseaActivityScreen.png"
              ),
        ),
      ),
      child: 
      
      
          Container(
             
              // padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
         Text(getText('choose_your_activity',context),style: TextStyle(color:Colors.white,fontSize: 22,fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),

                   Container(
                     width: MediaQuery.of(context).size.width*0.65,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                  indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  color: Colors.white,
                ),

             onTap: (index){
               print(index);
               index == 0 ?
                    Scrollable.ensureVisible(module1Key.currentContext,duration: Duration(seconds: 1))
                    : 
                     index == 1
                    ?
                     Scrollable.ensureVisible(module2Key.currentContext,duration: Duration(seconds: 1))
                      : 
                     index == 2
                    ?
                     Scrollable.ensureVisible(module3Key.currentContext,duration: Duration(seconds: 1))
                      : 
                     index == 3
                    ?
                     Scrollable.ensureVisible(module4Key.currentContext,duration: Duration(seconds: 1))
                     :
                     null;

                  },
        tabs: [

 
 Tab(
  
   child: Text(getText('module_1', context),style: TextStyle(color:Colors.black),textAlign: TextAlign.center),),
          
 Tab(child: Text(getText('module_2', context),style: TextStyle(color:Colors.black),textAlign: TextAlign.center),),

 Tab(child: Text(getText('module_3', context),style: TextStyle(color:Colors.black),textAlign: TextAlign.center),),

 Tab(child: 
 Text(
  getText('your_evaluation', context),
  style: TextStyle(color:Colors.black,fontSize: 13),textAlign: TextAlign.center,),),


        
        ],
      ),
              ),
                  Expanded(
                                      child: SingleChildScrollView(

                      child: Container(
                        width: double.infinity,
                        child: Column(
                           
                         crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //  ListTile(title: Text(getText('choose_your_activity',context)),),
                            Padding(
                              key: module1Key,
                              padding: const EdgeInsets.all(10.0),
                              child: Text(getText('module_1_pre_operational_set_up', context),style: TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                            ),
                            Wrap(
                              children:  
                              activityGrid(activityList, context),
                              
                            ),
                             Padding(
                                  key: module2Key,
                              padding: const EdgeInsets.all(10.0),
                              child: Text(getText('module_2_kill_preparation', context),style: TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                            ),
                               Wrap(
                                  // key: dataKey,
                              children:  
                              activityGrid(activityListModuleTwo, context),
                              
                            ),
                             Padding(
                                  key: module3Key,
                               padding: const EdgeInsets.all(10.0),
                              child: Text(getText('module_3_carry_out_kill', context),style: TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                            ),
                             Wrap(
                              children:  
                              activityGrid(activityListModuleThree, context),
                              
                            ),
                            Padding(
                                 key: module4Key,
                               padding: const EdgeInsets.all(10.0),
                              child: Text(
                                
                                getText('your_evaluation', context),
                                
                                style: TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                            ),
                             Wrap(
                              children:  
                              activityGrid(activityListEvaluation, context),
                              
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
             
              ),
    
    );
  }

  List<Widget> activityGrid(
      List<ActivityModel> activityModelList, BuildContext context) {
    List<Widget> activitySeelctionTiles = List<Widget>();

    for (int w = 0; w < activityModelList.length; w++) {
      activitySeelctionTiles
          .add(activitySeelctionTile(activityModelList[w], context));
    }
    return activitySeelctionTiles;
  }

  Widget activitySeelctionTile(
      ActivityModel activityModel, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => activityModel.activityRoute));
          Navigator.pushNamed(context,activityModel.activityRoute,arguments: widget.sc);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        //height: 200,
        width: 150,
        child: Stack(
          // alignment: Alignment.bottomCenter,
          
          children: [
            Container(
              height: 140, //100
              width: 150,
              child: Image.asset(
                activityModel.activityImagePath,
                fit: BoxFit.fill,
              ),
            ),
            // Container(
            //   width: 150,
            //   height: 40,
            //   decoration: BoxDecoration(
            //     color: Colors.blue,
            //     borderRadius: BorderRadius.only(
            //         bottomLeft: Radius.circular(10),
            //         bottomRight: Radius.circular(10)),
            //   ),
            //   child: Center(
            //     child: Text(
            //       activityModel.activitTitle,
            //       textAlign: TextAlign.center,
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 12,
            //       ),
            //     ),
            //   ),
            // ),
           
              
            Positioned.fill(
                  // bottom: 2,
                          child: Align(
               alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FittedBox(
                                                          child: Text(
                                activityModel.activitTitle,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  // fontSize: 12,
                                ),
                              ),
                            ),
                          ),
           ),
            ),
            
          
          ],
        ),
      ),
    );
  }
}

class SimulatorHeader extends StatelessWidget {
    SelectedConfigurations sc;
  SimulatorHeader(this.sc);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.20, // 150,
      padding: EdgeInsets.only(top: 10, bottom: 5), //10
      child: Center(
        child: Column(
          children: <Widget>[
            Image.asset(
              "assets/images/iconCompanyLogo.png",
              height: MediaQuery.of(context).size.height * 0.10, // 100,
              //fit: BoxFit.cover,
            ),
            Text(
              Multilingual.of(context)
                  .getText("drilling_supervisor_simulation"),
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14.0, //16
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget activitySelectionWidget(ActivityModel activityModel) {
    return Container();
  }
}

class ActivityModel {

  String activityModule;
  String activitTitle;
  String activityImagePath;
  String activityRoute;

  ActivityModel(
      {this.activityModule,
      this.activitTitle,
      this.activityImagePath,
       this.activityRoute
      });

  static List<ActivityModel> getActivityList(BuildContext context) {
    List<ActivityModel> activityList = new List<ActivityModel>();
     List<ActivityModel> activityListModuleTwo = new List<ActivityModel>();
      List<ActivityModel> activityListModuleThree = new List<ActivityModel>();

  

    

         activityList.add(ActivityModel(
        activityModule: "Procedure",
        activitTitle: "Module 1 Score\n",
        activityImagePath:
            "assets/images/iconYourScore.png",
         activityRoute: '/module1score',
        ));
      
      



    // activityList.add(ActivityModel(
    //     activityModule: "MM Engine",
    //     activitTitle: "Math Model Test",
    //     activityImagePath:
    //         "assets/images/activity_selection_screen/iconBopPressure.png",

   

   
// //     // activityList.add(ActivityModel(
// //     //     activityModule: "Module 1",
// //     //     activitTitle: "Pressure Gauges",
// //     //     activityImagePath:
// //     //         "assets/images/activity_selection_screen/iconBopPressure.png",
// //     //     activityRoute: BOPPressureGaugesMain()));

// // //  activityList.add(ActivityModel(
// // //         activityModule: "Module 1",
// // //         activitTitle: "Module 1 Score",
// // //         activityImagePath:
// // //             "assets/images/activity_selection_screen/iconBopPressure.png",
// // //         activityRoute: BOPPressureGaugesMain()));

// // //----------------------------------------------------------------------

// // //  activityList.add(ActivityModel(
// // //         activityModule: "Module 2",
// // //         activitTitle: "Bump The Float Panel",
// // //         activityImagePath:
// // //             "assets/images/activity_selection_screen/iconBopPressure.png",
// // //         activityRoute: BOPPressureGaugesMain()));

// // //  activityList.add(ActivityModel(
// // //         activityModule: "Module 2",
// // //         activitTitle: "Kill Sheet",
// // //         activityImagePath:
// // //             "assets/images/activity_selection_screen/iconBopPressure.png",
// // //         activityRoute: BOPPressureGaugesMain()));

// // //Done
    // activityList.add(ActivityModel(
    //     activityModule: "Module 2",
    //     activitTitle: "Pump Manifold",
    //     activityImagePath:
    //         "assets/images/activity_selection_screen/iconPits_Valves.png",
    //     activityRoute: PumpManifoldMain()));

// // //Done
    // activityList.add(ActivityModel(
    //     activityModule: "Module 2",
    //     activitTitle: "Pit Level Alarm ",
    //     activityImagePath:
    //         "assets/images/activity_selection_screen/iconAdjustPits.png",
    //     activityRoute: PitLevelAlarmMain()));

// // //  activityList.add(ActivityModel(
// // //         activityModule: "Module 2",
// // //         activitTitle: "Communicate with Crew",
// // //         activityImagePath:
// // //             "assets/images/activity_selection_screen/iconBopPressure.png",
// // //         activityRoute: BOPPressureGaugesMain()));

// // //  activityList.add(ActivityModel(
// // //         activityModule: "Module 2",
// // //         activitTitle: "Module 2 Score",
// // //         activityImagePath:
// // //             "assets/images/activity_selection_screen/iconBopPressure.png",
// // //         activityRoute: BOPPressureGaugesMain()));

// // //--------------------------------------------------------------------

// // //  activityList.add(ActivityModel(
// // //         activityModule: "Module 3",
// // //         activitTitle: "Begin kill Operation",
// // //         activityImagePath:
// // //             "assets/images/activity_selection_screen/iconBopPressure.png",
// // //

// // //  activityList.add(ActivityModel(
// // //         activityModule: "Module 3",
// // //         activitTitle: "Activity Log",
// // //         activityImagePath:
// // //             "assets/images/activity_selection_screen/iconBopPressure.png",
// // //

// // //  activityList.add(ActivityModel(
// // //         activityModule: "Module 3",
// // //         activitTitle: "Kill Log",
// // //         activityImagePath:
// // //             "assets/images/activity_selection_screen/iconBopPressure.png",
// // //

    // activityList.add(ActivityModel(
    //     activityModule: "Module 3",
    //     activitTitle: "Alert Test", //Graph
    //     activityImagePath:
    //         "assets/images/activity_selection_screen/iconBopPressure.png",
    //     activityRoute: CustomAlertHomePage() // SimulationGraph()
    //     ));

    // activityList.add(ActivityModel(
    //     activityModule: "Module 3",
    //     activitTitle: "Knob Test", //Graph
    //     activityImagePath:
    //         "assets/images/activity_selection_screen/iconBopPressure.png",
    //     activityRoute: KnobPage() // SimulationGraph()
    //     ));

// // //  activityList.add(ActivityModel(
// // //         activityModule: "Module 3",
// // //         activitTitle: "Module 3 Score",
// // //         activityImagePath:
// // //             "assets/images/activity_selection_screen/iconBopPressure.png",
// // //         activityRoute: BOPPressureGaugesMain()));

// // //---------------------------------------------------------

// // //  activityList.add(ActivityModel(
// // //         activityModule: "Your Evalution",
// // //         activitTitle: "Skill Assessment Grade",
// // //         activityImagePath:
// // //             "assets/images/activity_selection_screen/iconBopPressure.png",
// // //

    return activityList;
  }

  static List<ActivityModel> getActivityListTwo(BuildContext context) {
   
     List<ActivityModel> activityListModuleTwo = new List<ActivityModel>();
      
         activityListModuleTwo.add(ActivityModel(
        activityModule: "Procedure",
        activitTitle: "Kill Sheet\n",
        activityImagePath:
            "assets/images/iconKillSheetCalculations.png",
         activityRoute: '/killsheet',
        ));
  
         activityListModuleTwo.add(ActivityModel(
        activityModule: "Procedure",
        activitTitle: "Module 2 Score\n",
        activityImagePath:
            "assets/images/iconYourScore.png",
         activityRoute: '/module2score',
        ));
       





    return activityListModuleTwo;




  }

    static List<ActivityModel> getActivityListThree(BuildContext context) {
   
     List<ActivityModel> activityListModuleThree = new List<ActivityModel>();
       
       
          activityListModuleThree.add(ActivityModel(
        activityModule: "Procedure",
        activitTitle: "Activity Log\n",
        activityImagePath:
            "assets/images/iconActivityLog.png",
         activityRoute: '/activitylog',
        ));
       
        activityListModuleThree.add(ActivityModel(
        activityModule: "Procedure",
        activitTitle: "Kill Log\n",
        activityImagePath:
            "assets/images/iconKillLog.png",
         activityRoute: '/killlog',
        ));

      

  
        activityListModuleThree.add(ActivityModel(
        activityModule: "Procedure",
        activitTitle: "Module 3 Score\n",
        activityImagePath:
            "assets/images/iconYourScore.png",
         activityRoute: '/module3score',
        ));
       





    return activityListModuleThree;


}


 static List<ActivityModel> getActivityListEvaluation(BuildContext context) {
   
     List<ActivityModel> activityListEvaluation = new List<ActivityModel>();
       
         
         activityListEvaluation.add(ActivityModel(
        activityModule: "Procedure",
        activitTitle: "Skills Assessment \nGrade",
        activityImagePath:
            "assets/images/iconYourScore.png",
         activityRoute: '/skillassessment',
        ));




    return activityListEvaluation;


}

}

