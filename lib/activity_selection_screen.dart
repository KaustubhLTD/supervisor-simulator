
import 'package:flutter/material.dart';
import 'package:flutter_application_1/kill_sheet.dart';
import 'package:flutter_application_1/mode_selection.dart';
import 'package:flutter_application_1/sign_in.dart';
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
          : Container(
              child: //ActivitySlection(),
                  Column(
                children: <Widget>[
                  SimulatorHeader(sc),
                  ActivitySlection(sc),
                ],
              ),
            ),
    );
  }
}

class ActivitySlection extends StatelessWidget {
  SelectedConfigurations sc;
  ActivitySlection(this.sc);
  @override
  Widget build(BuildContext context) {
    final List<ActivityModel> activityList =
        ActivityModel.getActivityList(context);
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
      
       //activitySeelctionTile(activityList[0]),
          Container(
              //height: 250,
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(

                child: Wrap(
                  children:  
                  activityGrid(activityList, context),
                ),
              )
              // ListView.builder(
              //   scrollDirection: Axis.horizontal,
              //   itemCount: activityList.length,
              //   itemBuilder: (context, index) {
              //     return activitySeelctionTile(activityList[index], context);
              //   },
              // ),
              ),
      // Column(
      //   children: <Widget>[
      //     Text('choose_your_activity'
      //         //Multilingual.of(context).getText('choose_your_activity'),
      //         ),],
      //     //Placeholder(),
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
          Navigator.pushNamed(context,activityModel.activityRoute,arguments: sc);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        //height: 200,
        width: 150,
        child: Column(
          children: [
            Container(
              height: 90, //100
              width: 150,
              child: Image.asset(
                activityModel.activityImagePath,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: 150,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Center(
                child: Text(
                  activityModel.activitTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
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

    activityList.add(ActivityModel(
        activityModule: "Procedure",
        activitTitle: "Kill Sheet",
        activityImagePath:
            "assets/images/iconKillSheetCalculations.png",
         activityRoute: '/killsheet',
        ));

      activityList.add(ActivityModel(
        activityModule: "Procedure",
        activitTitle: "Kill Log",
        activityImagePath:
            "assets/images/iconKillLog.png",
         activityRoute: '/killlog',
        ));

         activityList.add(ActivityModel(
        activityModule: "Procedure",
        activitTitle: "Activity Log",
        activityImagePath:
            "assets/images/iconActivityLog.png",
         activityRoute: '/activitylog',
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
}