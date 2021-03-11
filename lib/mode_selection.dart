import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/constants.dart';
import 'package:flutter_application_1/utilities/multilingual_service.dart';
import 'package:url_launcher/url_launcher.dart';

class ModeSelection extends StatefulWidget {
  @override
  _ModeSelectionState createState() => _ModeSelectionState();
}

class KillMethodModel {
  String image;
  String title;
  KillMethodModel(this.image, this.title);
}

class _ModeSelectionState extends State<ModeSelection> {
  List<KillMethodModel> killMethodData = [
    KillMethodModel('assets/images/drillerMethod.png', 'drillers_method'),
    KillMethodModel('assets/images/waitAndWeight.png', 'wait_and_weight'),
    KillMethodModel('assets/images/bullheading.png', 'bullheading'),
    KillMethodModel('assets/images/volumetric.png', 'volumetric'),
    KillMethodModel('assets/images/lubeAndBleed.png', 'lube_and_bleed'),
  ];

  String selectedField = '';
  String selectedMode = '';

  bool visiblebutton = false;

  void _changed(bool visibility, String field, String mode) {
    setState(() {
      selectedField = field;
      selectedMode = mode;
      visiblebutton = visibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        //  centerTitle: true,

        title: Row(
          children: [
            Expanded(
              child: visiblebutton == true

                  // ignore: deprecated_member_use
                  ? Container(
                      height: 30,
                      // width: 80,
                      child: Row(children: [
                        // contentPadding: EdgeInsets.all(0),
                        //             leading:
                        RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            color: Constants.themeBlue,
                            onPressed: () {
                              (selectedField == "Driller's Method" ||
                                          selectedField == "Wait and Weight" ||
                                          selectedField == "Bullheading" ||
                                          selectedField == "Volumetric" ||
                                          selectedField == "Lube and Bleed") &&
                                      selectedMode == "Practice"
                                  ? setState(() {
                                      _changed(true, "Practice", 'Practice');
                                    })
                                  : (selectedField == "Driller's Method" ||
                                              selectedField ==
                                                  "Wait and Weight" ||
                                              selectedField == "Bullheading" ||
                                              selectedField == "Volumetric" ||
                                              selectedField ==
                                                  "Lube and Bleed") &&
                                          selectedMode == "Test"
                                      ? setState(() {
                                          _changed(true, "Take a Test", "Test");
                                        })
                                      : selectedField == 'Select rig'
                                          ? setState(() {
                                              _changed(
                                                  true, "Driller's Method", "");
                                            })
                                          : selectedField == "Practice" ||
                                                  selectedField == "Take a Test"
                                              ? setState(() {
                                                  Navigator.pushNamed(context,
                                                      '/modeselection');
                                                })
                                              : null;
                            },
                            child: Text(
                              getText('back', context),
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            )),
                      ]),
                    )
                  : Container(),
            ),
            Center(
              child: Image.asset(
                'assets/images/iconCompanyLogo.png',
                fit: BoxFit.contain,
                height: 50,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'kaustubhyadgire@gmail.com',
                  style: TextStyle(color: Constants.textColor, fontSize: 10),
                ),
              ),
            ),
          ],
        ),

        //       Row(
        //        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [

        //     Image.asset(
        //       'assets/images/iconCompanyLogo.png',
        //       fit: BoxFit.contain,
        //       height: 50,
        //     ),
        //     Text(
        //         'kaustubhyadgire@gmail.com',
        //         style: TextStyle(color: Constants.textColor, fontSize: 10),
        //       ),
        //   ],
        // ),
        // leading: visiblebutton == true

        //     // ignore: deprecated_member_use
        //     ? RaisedButton(
        //         onPressed: () {
        //           selectedField == "Drillers Method" || selectedField == "Wait and Weight"||selectedField == "Bullheading"||selectedField == "Volumetric"||selectedField == "Lube and Bleed"
        //               ? setState(() {
        //                   _changed(true, "Practice");
        //                 })
        //               : selectedField == 'Select rig'
        //                   ? setState(() {
        //                       _changed(true, "Drillers Method");
        //                     })
        //                   : selectedField == "Practice" || selectedField == "Take a Test"
        //                       ? setState(() {
        //                           Navigator.pushNamed(
        //                               context, '/modeselection');
        //                         })
        //                       : null;
        //         },
        //         child: Text(
        //           'Back',
        //           style: TextStyle(fontSize: 10),
        //         ))
        //     : Text(''),
        // title: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Image.asset(
        //     'assets/images/iconCompanyLogo.png',
        //     fit: BoxFit.contain,
        //     height: 50,
        //   ),
        // ),
        // centerTitle: true,
        // actions: [
        //   Container(
        //     width: MediaQuery.of(context).size.width * 0.3,
        //     child: Padding(
        //       padding: const EdgeInsets.only(right: 8.0),
        //       child: Text(
        //         'kaustubhyadgire@gmail.com',
        //         style: TextStyle(color: Constants.textColor, fontSize: 10),
        //       ),
        //     ),
        //     alignment: Alignment.topRight,
        //   )
        // ],
        bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                getText("simulator_for_drilling_operations_supervisor_course",
                    context),
                // "Simulator for Drilling Operation Supervisor Course",
                style: TextStyle(color: Constants.textColor),
              ),
            ),
            preferredSize: Size.fromHeight(30)),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/images/bgSimulationSelectionDown.png'),
                    fit: BoxFit.cover)),
          ),
          Column(
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Column(
                // mainAxisSize: MainA,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Text(
                      selectedField == "Practice" ||
                              selectedField == "Take a Test"
                          ? getText('select_method', context)
                          : selectedField == "Driller's Method" ||
                                  selectedField == "Wait and Weight"
                              ? getText('select_rig', context)
                              : getText('select_mode', context),
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  selectedField == "Practice"
                       ?
                        RichText(
  text: TextSpan(
    children: [
      TextSpan(
        text: getText('practice', context),
        style: TextStyle(color: Colors.white),
      
      ), 
      TextSpan(
        text: ' -> ',
        style: TextStyle(color: Colors.white),
      
      ),
      TextSpan(
        text: getText('select_method', context),
        style: TextStyle(color: Colors.white,
         shadows: [
        Shadow(
            blurRadius: 2.0,
            color: Colors.white,
            offset: Offset(1.0, 1.0),
            ),
        ],
        ),
      ),
     
    ],
  ),
)
                     
                      : selectedField == "Take a Test"
                          ? 
                            RichText(
  text: TextSpan(
    children: [
      TextSpan(
        text: getText('take_a_test', context),
        style: TextStyle(color: Colors.white),
      
      ), 
      TextSpan(
        text: ' -> ',
        style: TextStyle(color: Colors.white),
      
      ),
      TextSpan(
        text: getText('select_method', context),
        style: TextStyle(color: Colors.white,
         shadows: [
        Shadow(
            blurRadius: 2.0,
            color: Colors.white,
            offset: Offset(1.0, 1.0),
            ),
        ],
        ),
      ),
     
    ],
  ),
)
                          
                          
                        
                          : selectedField == "Driller's Method" &&
                                  selectedMode == "Practice"
                              // ? 
                              ?
                               RichText(
  text: TextSpan(
    children: [
      TextSpan(
        text: getText('practice', context),
        style: TextStyle(color: Colors.white),
      
      ), 
      TextSpan(
        text: ' -> ',
        style: TextStyle(color: Colors.white),
      
      ),
      TextSpan(
        text: getText('drillers_method', context),
        style: TextStyle(color: Colors.white,
        
        ),
      ),
       TextSpan(
        text: ' -> ',
        style: TextStyle(color: Colors.white),
      
      ),
      TextSpan(
        text: getText('select_rig', context),
        style: TextStyle(color: Colors.white,
         shadows: [
        Shadow(
            blurRadius: 2.0,
            color: Colors.white,
            offset: Offset(1.0, 1.0),
            ),
        ],
        ),
      ),
     
    ],
  ),
)
                              : selectedField == "Driller's Method" &&
                                      selectedMode == "Test"
                                  ?
  RichText(
  text: TextSpan(
    children: [
      TextSpan(
        text: getText('take_a_test', context),
        style: TextStyle(color: Colors.white),
      
      ), 
      TextSpan(
        text: ' -> ',
        style: TextStyle(color: Colors.white),
      
      ),
      TextSpan(
        text: getText('drillers_method', context),
        style: TextStyle(color: Colors.white,
       
        ),
      ),
       TextSpan(
        text: ' -> ',
        style: TextStyle(color: Colors.white),
      
      ),
      TextSpan(
        text: getText('select_rig', context),
        style: TextStyle(color: Colors.white,
         shadows: [
        Shadow(
            blurRadius: 2.0,
            color: Colors.white,
            offset: Offset(1.0, 1.0),
            ),
        ],
        ),
      ),
     
    ],
  ),
)
                                  : selectedField == "Wait and Weight" &&
                                          selectedMode == "Practice"
                                      ?  RichText(
  text: TextSpan(
    children: [
      TextSpan(
        text: getText('practice', context),
        style: TextStyle(color: Colors.white),
      
      ), 
      TextSpan(
        text: ' -> ',
        style: TextStyle(color: Colors.white),
      
      ),
      TextSpan(
        text: getText('wait_and_weight', context),
        style: TextStyle(color: Colors.white,
        
        ),
      ),
       TextSpan(
        text: ' -> ',
        style: TextStyle(color: Colors.white),
      
      ),
      TextSpan(
        text: getText('select_rig', context),
        style: TextStyle(color: Colors.white,
         shadows: [
        Shadow(
            blurRadius: 2.0,
            color: Colors.white,
            offset: Offset(1.0, 1.0),
            ),
        ],
        ),
      ),
     
    ],
  ),
)
                                      : selectedField == "Wait and Weight" &&
                                              selectedMode == "Test"
                                          ?
                                          
                                         RichText(
  text: TextSpan(
    children: [
      TextSpan(
        text: getText('test', context),
        style: TextStyle(color: Colors.white),
      
      ), 
      TextSpan(
        text: ' -> ',
        style: TextStyle(color: Colors.white),
      
      ),
      TextSpan(
        text: getText('wait_and_weight', context),
        style: TextStyle(color: Colors.white,
        
        ),
      ),
       TextSpan(
        text: ' -> ',
        style: TextStyle(color: Colors.white),
      
      ),
      TextSpan(
        text: getText('select_rig', context),
        style: TextStyle(color: Colors.white,
         shadows: [
        Shadow(
            blurRadius: 2.0,
            color: Colors.white,
            offset: Offset(1.0, 1.0),
            ),
        ],
        ),
      ),
     
    ],
  ),
)

                                          //  : selectedField == "Driller's Method" && selectedMode == "Practice"
                                          //  ? Text(getText('practice_drillers_method_select_rig',context))
                                          // : selectedField == "Driller's Method" && selectedMode == "Test" ?
                                          // Text(getText('test_drillers_method_select_rig',context))
                                          //     ?  RichText(
                                          //       text:   TextSpan(
                                          //   children: <TextSpan>[
                                          //      TextSpan(
                                          //         text: 'Practice ->',
                                          //         style: TextStyle(fontSize: 14, color: Colors.white)),
                                          //     TextSpan(
                                          //         text: '$selectedField ->',
                                          //         style: TextStyle(fontSize: 14, color: Colors.white)),
                                          //     TextSpan(

                                          //         text: ' Select rig',
                                          //         style: TextStyle(
                                          //             fontSize: 14, color: Colors.white.withOpacity(0.8))),
                                          //   ],
                                          // )
                                          //     )

                                          // Text(
                                          //     'Practices -> $selectedField -> Select rig',
                                          //     style:
                                          //         TextStyle(fontSize: 14, color: Colors.white),
                                          //   )
                                          : SizedBox(),
                ],
              ),

              // MediaQuery.of(context).orientation == Orientation.landscape
              //     ? SizedBox()
              //     : SizedBox(
              //         // height: 20,
              //       ),
              selectedField == "Practice" || selectedField == "Take a Test"
                  ? methodSelectionView()
                  : (selectedField == "Driller's Method" ||
                          selectedField == "Wait and Weight" ||
                          selectedField == "Bullheading" ||
                          selectedField == "Volumetric" ||
                          selectedField == "Lube and Bleed")
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/guidelines');
                                },
                                child: rigSelectionCards(
                                    'assets/images/surface.png', 'Surface')),
                            MediaQuery.of(context).orientation ==
                                    Orientation.landscape
                                ? SizedBox(width: 2)
                                : SizedBox(),
                            InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/guidelines');
                                },
                                child: rigSelectionCards(
                                    'assets/images/subsea.png', 'Subsea'))
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {
                                  _changed(true, "Practice", "Practice");
                                },
                                child: modeCards('assets/images/practice.png',
                                    getText('practice', context))),
                            InkWell(
                                onTap: () {
                                  _changed(true, "Take a Test", "Test");
                                },
                                child: modeCards('assets/images/takeTest.png',
                                    getText('take_a_test', context)))
                          ],
                        ),
              Row(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('v5.3',
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                  ),
                  Flexible(
                    child: Card(
                      color: Colors.grey[50].withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: <TextSpan>[
                                TextSpan(
                                  text: getText(
                                      'for_using_iadc_assessment_mode_contact_us',
                                      context),
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black
                                      )),
                          
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      launch("mailto:info@learntodrill.com");
                                      // mailto:smith@example.org?subject=News&body=New%20plugin;
                                    },
                                  text: getText(
                                      'contact_us_email',
                                      context),
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Constants.textColor)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  visiblebutton
                      ? SizedBox(
                          height: 10,
                          width: 30,
                        )
                      : Card(
                          color: Constants.themeBlue,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                              size: MediaQuery.of(context).size.height * 0.05,
                              // size: 18
                            ),
                          ))
                ],
              ),
              // SizedBox(
              //   height: 20,
              // ),
            ],
          ),
        ],
      ),
    );
  }

  Widget modeCards(String image, String title) {
    return Card(
      color: Constants.themeTang,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Constants.themeBlue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Image(
              image: AssetImage(image),
              fit: BoxFit.contain,
              height:
                  MediaQuery.of(context).orientation == Orientation.landscape
                      ? MediaQuery.of(context).size.height * 0.42
                      : null,
              width: MediaQuery.of(context).orientation == Orientation.landscape
                  ? MediaQuery.of(context).size.height * 0.42
                  : null,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Text(title,
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.white)),
          Text(getText('credits', context) + ':5',
              // 'Credits:5',
              style: TextStyle(fontSize: 12.0, color: Colors.white)),
          SizedBox(
            height: 2,
          )
        ],
      ),
    );
  }

  Widget rigSelectionCards(String image, String title) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Constants.themeTang,
      child: Column(children: <Widget>[
        Container(
            decoration: BoxDecoration(
                color: Constants.themeBlue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            height: MediaQuery.of(context).orientation == Orientation.landscape
                ? MediaQuery.of(context).size.width * 0.21
                : null,
            child: Image(
                image: AssetImage(image),
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height * 0.42,
                width: MediaQuery.of(context).size.height * 0.42)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title,
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.white)),
        ),
      ]),
    );
  }

  Widget methodSelectionView() {
    return Container(
      height: MediaQuery.of(context).orientation == Orientation.landscape
          ? MediaQuery.of(context).size.height * 0.48
          : MediaQuery.of(context).size.height * 0.48,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: killMethodData.length,
          itemBuilder: (context, index) {
            return getMethodCard(killMethodData[index], context);
          }),
    );
  }

  Widget getMethodCard(KillMethodModel killmethod, BuildContext context) {
    return

        //  Card(
        //   shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(10)),
        //   color: Constants.themeTang,
        //   child: Column(children: <Widget>[
        //     Container(
        //        decoration: BoxDecoration(
        //                 color: Constants.themeBlue,
        //                 borderRadius: BorderRadius.only(
        //                     topLeft: Radius.circular(10),
        //                     topRight: Radius.circular(10))),
        //         height: MediaQuery.of(context).orientation == Orientation.landscape
        //             ? MediaQuery.of(context).size.width * 0.21
        //             : null,

        //         child: Image(
        //             image: AssetImage(killmethod.image),
        //             fit: BoxFit.contain,
        //             height:  MediaQuery.of(context).size.height*0.42,
        //             width:  MediaQuery.of(context).size.height*0.42
        //             )
        //             ),
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text(killmethod.title,
        //           style: TextStyle(
        //               fontSize: 18.0,
        //               fontWeight: FontWeight.normal,
        //               color: Colors.white)),
        //     ),
        //   ]),
        // );

        MediaQuery.of(context).orientation == Orientation.landscape
            ? Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                child: InkWell(
                  onTap: () {
                    _changed(
                        true, getText(killmethod.title, context), selectedMode);
                  },
//  _changed(true, killmethod.title),
                  child: Card(
                    color: Constants.themeTang,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Constants.themeBlue,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                          child: Image(
                            image: AssetImage(killmethod.image),
                            fit: BoxFit.contain,
                            height: MediaQuery.of(context).orientation ==
                                    Orientation.landscape
                                ? MediaQuery.of(context).size.height * 0.38
                                : 100,
                            width: MediaQuery.of(context).orientation ==
                                    Orientation.landscape
                                ? MediaQuery.of(context).size.height * 0.42
                                : 100,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(getText(killmethod.title, context),
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : InkWell(
                onTap: () {
                  _changed(true, killmethod.title, selectedMode);
                },
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 1000),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(child: child, scale: animation);
                  },
                  child: Card(
                    key: UniqueKey(),
                    color: Constants.themeTang,
                    child: Column(children: <Widget>[
                      Container(
                          // height: MediaQuery.of(context).orientation == Orientation.landscape ?125 : 160,
                          width: MediaQuery.of(context).orientation ==
                                  Orientation.landscape
                              ? 125
                              : 150,
                          color: Constants.themeBlue,
                          child: Image(
                              image: AssetImage(killmethod.image),
                              fit: BoxFit.contain,
                              // height:  MediaQuery.of(context).orientation == Orientation.landscape ?170 : 161,
                              width: MediaQuery.of(context).orientation ==
                                      Orientation.landscape
                                  ? 160
                                  : 172)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(killmethod.title,
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).orientation ==
                                        Orientation.landscape
                                    ? 15.0
                                    : 18.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.white)),
                      ),
                    ]),
                  ),
                ),
              );
  }
}
