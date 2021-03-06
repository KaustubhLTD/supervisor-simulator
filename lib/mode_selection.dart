import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/constants.dart';

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
    KillMethodModel('assets/images/drillerMethod.png', 'Drillers Method'),
    KillMethodModel('assets/images/waitAndWeight.png', 'Wait and Weight'),
    KillMethodModel('assets/images/bullheading.png', 'Bullheading'),
    KillMethodModel('assets/images/volumetric.png', 'Volumetric'),
    KillMethodModel('assets/images/lubeAndBleed.png', 'Lube and Bleed'),
  ];

  String selectedField = '';

  bool visiblebutton = false;

  void _changed(bool visibility, String field) {
    setState(() {
      selectedField = field;
      visiblebutton = visibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:2.0),
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
                          text: 'For using IADC assesment mode,contact us at',
                          style: TextStyle(fontSize: 10, color: Colors.black)),
                      TextSpan(
                          text: ' info@learntodrill.com',
                          style: TextStyle(
                              fontSize: 10, color: Constants.textColor)),
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
                      size: 20
                    ),
                  ))
        ],
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
         backgroundColor: Colors.white,
        //  centerTitle: true,
        
          title: Row(
      children: [
        Expanded(
          child:  visiblebutton == true

          // ignore: deprecated_member_use
          ? Container(
             height: 30,
            // width: 80,
            child: Padding(
              padding: const EdgeInsets.only(right:160.0),
              child: RaisedButton(
                 shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(8.0),),
                color: Constants.themeBlue,
                  onPressed: () {
                    selectedField == "Drillers Method" || selectedField == "Wait and Weight"||selectedField == "Bullheading"||selectedField == "Volumetric"||selectedField == "Lube and Bleed"
                        ? setState(() {
                            _changed(true, "Practice");
                          })
                        : selectedField == 'Select rig'
                            ? setState(() {
                                _changed(true, "Drillers Method");
                              })
                            : selectedField == "Practice" || selectedField == "Take a Test"
                                ? setState(() {
                                    Navigator.pushNamed(
                                        context, '/modeselection');
                                  })
                                : null;
                  },
                  child: Text(
                    'Back',
                    style: TextStyle(fontSize: 12,color: Colors.white),
                  )),
            ),
          )
          :Container(),
        ),
        Center(
          child:  Image.asset(
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
                "Simulator for Drilling Operation Supervisor Course",
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
          SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Text(
                     selectedField == "Practice" || selectedField == "Take a Test"
                          ? 'Select Method'
                          : selectedField == "Drillers Method" ||
                                  selectedField == "Wait and Weight"
                              ? 'Select Rig'
                              : 'Select Mode',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  selectedField == "Practice" || selectedField == "Take a Test"
                      ? Text(
                          '$selectedField -> Select Method',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        )
                      : selectedField == "Drillers Method"
                          ? Text(
                              'Practices -> $selectedField -> Select rig',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            )
                          : SizedBox(),
                  MediaQuery.of(context).orientation == Orientation.landscape
                      ? SizedBox()
                      : SizedBox(
                          height: 40,
                        ),
                  selectedField == "Practice" || selectedField == "Take a Test"
                      ? methodSelectionView()
                      : selectedField == "Drillers Method" || selectedField == "Wait and Weight"||selectedField == "Bullheading"||selectedField == "Volumetric"||selectedField == "Lube and Bleed"
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/guidelines');
                                    },
                                    child: rigSelectionCards(
                                        'assets/images/surface.png',
                                        'Surface')),
                                MediaQuery.of(context).orientation ==
                                        Orientation.landscape
                                    ? SizedBox(width: 2)
                                    : SizedBox(),
                                InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/guidelines');
                                    },
                                    child: rigSelectionCards(
                                        'assets/images/subsea.png',
                                        'Subsea'))
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap: () {
                                      _changed(true, "Practice");
                                    },
                                    child: modeCards(
                                        'assets/images/practice.png',
                                        'Practice')),
                              
                                InkWell(
                                    onTap: () {
                                      _changed(true, "Take a Test");
                                    },
                                    child: modeCards(
                                        'assets/images/takeTest.png',
                                        'Take a Test'))
                              ],
                            ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget modeCards(String image, String title) {
    return 
    Card(
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
               
              height:  MediaQuery.of(context).orientation == Orientation.landscape ?   MediaQuery.of(context).size.height*0.42 : null,
              width:  MediaQuery.of(context).orientation == Orientation.landscape ?    MediaQuery.of(context).size.height*0.42 : null,
            ),
          ),
         SizedBox(height: 2,),
          Text(title,
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.white)),
          Text('Credits:5',
              style: TextStyle(fontSize: 12.0, color: Colors.white)),
              SizedBox(height: 2,)
        ],
      ),
    );

    //  Card(
    //   shape: RoundedRectangleBorder(

    //                           borderRadius: BorderRadius.circular(15),
    //                         ),
    //   key: UniqueKey(),
    //   color: Constants.themeTang,
    //   child: Column(children: <Widget>[
    //     Container(
    //         height:
    //             MediaQuery.of(context).orientation == Orientation.landscape
    //                 ? MediaQuery.of(context).size.width * 0.23
    //                 : null,
    //         color: Constants.themeBlue,
    //         child: Image(
    //           image: AssetImage(image), fit: BoxFit.contain,
             
    //         )),
    //     Text(title,
    //         style: TextStyle(
    //             fontSize: 18.0,
    //             fontWeight: FontWeight.normal,
    //             color: Colors.white)),
    //     Text('Credits:5',
    //         style: TextStyle(fontSize: 12.0, color: Colors.white))
    //   ]),
    // );
  }

  Widget rigSelectionCards(String image, String title) {
    return 
   
   
   
    Card(
      shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
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
                height:  MediaQuery.of(context).size.height*0.42,
                width:  MediaQuery.of(context).size.height*0.42
                )
                ),
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
          ? 180
          : 200,
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
    MediaQuery.of(context).orientation == Orientation.landscape?
    Padding(
      padding: const EdgeInsets.only(left:4.0,right:4.0),
      child: InkWell(
        onTap: (){
           _changed(true, killmethod.title);
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
                   
                  height:  MediaQuery.of(context).orientation == Orientation.landscape ?    MediaQuery.of(context).size.height*0.38 : null,
                  width:  MediaQuery.of(context).orientation == Orientation.landscape ?    MediaQuery.of(context).size.height*0.42 : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(killmethod.title,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.white)),
              ),
             
            ],
          ),
        ),
      ),
    ):

    InkWell(
      onTap: () {
        _changed(true, killmethod.title);
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 1000),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(child: child, scale: animation);
        },
        child: Card(
          key: UniqueKey(),
          color: Constants.themeTang,
          child: Column(children: <Widget>[
            Container(
                // height: MediaQuery.of(context).orientation == Orientation.landscape ?125 : 160,
                width:
                    MediaQuery.of(context).orientation == Orientation.landscape
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
