import 'package:flutter/material.dart';
import 'package:flutter_application_1/mode_selection.dart';
import 'package:flutter_application_1/utilities/constants.dart';
import 'package:flutter_application_1/utilities/multilingual_service.dart';
import 'package:validators/validators.dart';

class SignInLoginForm {
  String email = '';
  String password = '';
}


class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
   final emailCntrlr = TextEditingController();

   final GlobalKey<FormState> _loginUserFormKey = new GlobalKey<FormState>();
   SignInLoginForm userData = new SignInLoginForm();
   bool showPasswordField = false;
    bool _obscureText = true;


   String _validateEmail(String value) {
    value = value.trim();
    if (value.isEmpty || !value.contains('@') || !isEmail(value)) {
      return 'Please enter a valid email!';
    } else
      return null;
  }
  String _validatePassword(String value) {
    if (value.length == 0) {
      return "Please enter a password";
    } else {
      return null;
    }
  }


   signIn() {

     if(emailCntrlr.text.isEmpty){
       emptyEmailDialog(
       );
      }
      // else if(emailCntrlr.text.)
      // {

      // }
      else{
            final isValid = _loginUserFormKey.currentState.validate();
             if (isValid) {
               
               _loginUserFormKey.currentState.save();
              
              setState(() {
                 showPasswordField = true;
              });
             
             //service call to check whether user id exists
             // if exist show password field
             // else do not exist
             } else {
              //please enter correct email
             }
      }
           
           
         
         }
       
       
         
         
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
                                   // height: 200,
                                   width: 400,
             //          width: MediaQuery.of(context).orientation == Orientation.landscape ?
             // 400 : 400 ,
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
                             getText("please_enter_your_correct_email_address", context),
                             style: TextStyle(fontSize: 15),
                             textAlign: TextAlign.center,
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left:12.0,right: 12.0,top: 10),
                           child: Text(
                             // welcomeScreenTitle,
                             getText("enter_same_email_and_password_as_your_online_account", context),
                             
                             style: TextStyle( fontSize: 12 ),
                             textAlign: TextAlign.center,
                           ),
                         ),
                         Form(
       
                            key: _loginUserFormKey,
                                             child: Padding(
                             padding: const EdgeInsets.only(left:12.0,right: 12.0,top:12,bottom: 12),
                             child:
                              TextFormField(
                                controller: emailCntrlr,
                                 validator: this._validateEmail,
                                 onSaved: (value) => this.userData.email = value,
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
                             
                             ),
                           ),
                         ),
       
                         showPasswordField ?  
                    
                       Padding(
                                     padding: const EdgeInsets.all(6.0),
                                     child: new TextFormField(
                                       obscureText: _obscureText,
                                       onFieldSubmitted: (_) {
                                         //_saveForm();
                                       },
                                      
                                       keyboardType: TextInputType.text,
                                       textInputAction: TextInputAction.done,
                                       onSaved: (value) =>
                                           this.userData.password = value,
                                       validator: this._validatePassword,
                                     
                                       decoration: new
                                        InputDecoration(
                                         hintText: "Password",
                                         isDense: true,
                                contentPadding: EdgeInsets.all(8.0),
                                       
                                       
                                          border: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.white),
                       borderRadius: BorderRadius.circular(5.7),
                     ),
                                         suffixIcon: new GestureDetector(
                                           onTap: () {
                                             setState(() {
                                               _obscureText = !_obscureText;
                                             });
                                           },
                                           child: new Icon(
                                             _obscureText
                                                 ? Icons.visibility_off
                                                 : Icons.visibility,
                                             color: Colors.grey,
                                           ),
                                         ),
                                         //  GestureDetector(
                                         //       onTap: () {
                                         //         Navigator.popAndPushNamed(
                                         //             context, '/resetpassword');
                                         //       },
                                         //       child: Padding(
                                         //           padding: EdgeInsets.all(15),
                                         //           child: Text(
                                         //             'Forgot?',
                                         //             style: TextStyle(
                                         //                 fontFamily: 'Comfortaa',
                                         //                 fontWeight: FontWeight.w700),
                                         //           )),
                                         //     ),
                                       ),
                                     ),
                                   )
                         
                         : SizedBox(),
       
       
       
                         Padding(
                           padding: const EdgeInsets.only(bottom:12.0),
                           child: SizedBox(
                             width: 200,
                             // height: 35,
                                           child: RaisedButton(
                               color: Constants.themeBlue,
                               textColor: Colors.white,
                               child: Text(getText("login_sign_up", context)),
                               onPressed: (){
                       //           Navigator.push(
                       // context, MaterialPageRoute(builder: (context) => ModeSelection()));
                       // Navigator.pushNamed(context, '/modeselection');
       signIn();
       
       
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
       
          emptyEmailDialog() {
  showDialog(context: context, 
      builder:(_) => new AlertDialog(
              title: new Text("Material Dialog"),
              content: new Text("Hey! I'm Coflutter!"),
              actions: <Widget>[
                FlatButton(
                  child: Text('Close me!'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            )); 
      

         }
}
