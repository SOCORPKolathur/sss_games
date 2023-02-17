

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Otp_Page.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({Key? key}) : super(key: key);

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {

  TextEditingController PhoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 200,
            child: TextField(
              controller: PhoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "enter the phon number",
                border: InputBorder.none
              ),
            ),
          ),
        //Button
          ElevatedButton(onPressed:(){
            Get.to(OTP(PhoneController.text));
          } , child:Text("submit")),

        ],
      ),
    );
  }
}
