
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../Landing.dart';
import '../newpage.dart';

class OTP extends StatefulWidget {
  String ?phone;
  OTP(this.phone);

  @override
  _OTPState createState() => _OTPState();
}
class _OTPState extends State<OTP> {

  bool showverifyBtn = true;
  TextEditingController otp = new TextEditingController();
  bool enterCode = true;
  var _verificationCode;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyphone();
  }
  String phonenumber="";


  userphonegetdata() async {
    var document = await FirebaseFirestore.instance.collection('Users').doc().get();
    Map<String, dynamic>? value = document.data();
    setState(() {
      phonenumber=value!["phone"];
    });
  }


  bool visible=false;

  @override
  Widget build(BuildContext context) {

    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal:width/13.06),
          child: Center(
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(
                  left:width/ 19.6,
                  right: width/19.6,
                  top: height/37.95,
                  bottom:height/37.95
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text("Games", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: width/15.07),),
                  Divider(endIndent: MediaQuery.of(context).size.width/4,indent: MediaQuery.of(context).size.width/4,),

                  Text('+91${widget.phone}', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: width/24.5),),

                  PinCodeTextField(
                    length: 6,
                    obscureText: false,
                    controller: otp,
                    appContext: context,
                    onCompleted: (String value) {
                      try{
                        FirebaseAuth.instance.signInWithCredential(
                            PhoneAuthProvider.credential(
                                verificationId:_verificationCode ,
                                smsCode: value)).then((value){
                          if(value.user!=null){

                            FirebaseFirestore.instance.collection("Users").
                            doc(FirebaseAuth.instance.currentUser!.uid).set({
                                  "phone": widget.phone,
                                  "wallet amount":0,
                                  "name":"none",
                                  "user id":FirebaseAuth.instance.currentUser!.uid,
                                 "Timecstamp":DateTime.now().microsecondsSinceEpoch,
                                 "active":false,
                                });
                            Get.to(Stream2());
                          }
                        });
                      }
                      catch(e){
                        print(e);
                      }
                    },
                    onChanged: (String value) {  },
                  ),
                  SizedBox(height: height/37.95,),

                ],
              ),
            ),
          ),
        )
    );
  }
  Widget _submitButton(TextEditingController phone) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return InkWell(
      onTap:(){
        phonenumber==null?Text("Please login"):Get.to(MyHomePage());
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: height/50.6),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Theme.of(context).primaryColor, Color(0xfff7892b)])),
        child: Text(
          'Verify',
          style: TextStyle(fontSize: width/19.6, color: Colors.white),
        ),
      ),
    );
  }

  _verifyphone()async{
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91${widget.phone}" ,
        verificationCompleted:(PhoneAuthCredential credential)async{
          await FirebaseAuth.instance.signInWithCredential(credential).then((value)async{
            if(value.user!=null){

              FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).set({
                "phone": widget.phone,
                "wallet amount":0,
                "name":"none",
                "user id":FirebaseAuth.instance.currentUser!.uid,
                "Timecstamp":DateTime.now().microsecondsSinceEpoch,
              });
              Get.to(Stream2());


              print("Valied Otp");
            }

          });
        },
        verificationFailed:(FirebaseAuthException e){
          print(e.message);
        } ,
        codeSent:(String ?verificationid ,int ?resendtoken ){
          setState(() {
            _verificationCode=verificationid;
          });
        },
        codeAutoRetrievalTimeout:( String verificationid){
          setState(() {
            _verificationCode=verificationid;
          });
        },timeout: Duration(seconds: 60) );
  }



}
