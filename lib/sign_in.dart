import 'package:flutter/material.dart';
import 'package:flutter_application_1/mode_selection.dart';
import 'package:flutter_application_1/utilities/constants.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
          children: [
        Container(
      
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/loginBackground.png'),
                fit: BoxFit.cover)),),
        Center(
            child: SingleChildScrollView(
                          child: Container(
               width: MediaQuery.of(context).orientation == Orientation.landscape ?
      MediaQuery.of(context).size.width*0.55 : null ,
      // height: 200,
      //  height: MediaQuery.of(context).orientation == Orientation.landscape ?
      // MediaQuery.of(context).size.width*0.55 : null ,
          
      child: AlertDialog(
              
              contentPadding: EdgeInsets.all(0.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              title: Image(
                image: AssetImage('assets/images/iconCompanyLogo.png'),
                height: 60,
                width: 70,
                fit: BoxFit.contain,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:10.0,right: 10.0),
                    child: Text(
                      "Please enter your correct email address",
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:12.0,right: 12.0,top: 10),
                    child: Text(
                      // welcomeScreenTitle,
                       '''If you have bought this online, then enter the same email and password as your online account''',
                      style: TextStyle( fontSize: 12 ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:12.0,right: 12.0,top:4,bottom: 4),
                    child:
                     TextFormField(
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.all(8.0),
                         hintText: 'Enter your valid email id here',
                         hintStyle: TextStyle(fontSize: 14,color: Colors.grey[300]) ,
                          
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(5.7),
              ),
                        
                          ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Your password';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:12.0),
                    child: SizedBox(
                      width: 200,
                      // height: 35,
                                    child: RaisedButton(
                        color: Constants.themeBlue,
                        textColor: Colors.white,
                        child: Text('Login / SignUp'),
                        onPressed: (){
                //           Navigator.push(
                // context, MaterialPageRoute(builder: (context) => ModeSelection()));
                Navigator.pushNamed(context, '/modeselection');
                        }
                        ),
                    ),
                  )
                ],
              ),
          ),
              ),
            ),
          ),
          ],
      
     
          ),
      );
    
  }
}
