import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:haate_haate/sign_up.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';
import 'dart:async';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:http/http.dart' as http;
import 'loadingpage.dart';
import 'usermodel.dart';



class SmsVerification extends StatefulWidget {
  final String username1;
  final String otp1;
  final String password1;



   SmsVerification({Key key,@required this.username1,@required this.password1,@required this.otp1}) : super(key: key);
 // SmsVerification({ this.username1,this.otp1,this.password1,this.confirmpassword});

  @override
  _SmsVerificationState createState() => _SmsVerificationState();
}

class _SmsVerificationState extends State<SmsVerification> {
 /* String username1;
  String otp1;
   String password1;
  String confirmpassword;
  _SmsVerificationState(username1,otp1,password1,confirmpassword);*/


 @override
   void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Text("We have sent SMS to: ", style:TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold)),
                    SizedBox(height: 15,),
                   // Text(value),
                  ],
                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:50.0,horizontal:40 ),
                child: Container(
                  child:OTPTextField(
                    length: 5,
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 50,
                    fieldStyle: FieldStyle.box,
                    style: TextStyle(
                        fontSize: 17
                    ),
                    onChanged: (pin) {
                      print("Changed: " + pin);
                    },
                    onCompleted: (pin) {
                      print("Completed: " + pin);
                    },
                  ),
                  ),
                ),
               Padding(
                 padding: const EdgeInsets.symmetric(vertical:10.0,horizontal:40 ),
                 child: SizedBox(
                   width:double.infinity,
                   child: RaisedButton(
                       child: Text('Verify',style:TextStyle(color: Colors.grey,fontWeight: FontWeight.bold)),

                       onPressed: ()async{
                         Map data = {
                           'username':widget.username1,
                           'otp': widget.otp1,
                           'is_phone_verified':'false',
                         };
                         String body = json.encode(data);
                         Map<String, String> headers = {"Content-type": "application/json"};
                         final response = await http.post('https://haatehaate.herokuapp.com/api/v1/user/registration/phase-2/',headers: headers, body: body);
                         print('result is.....'+response.body);
                         final Map user_info= json.decode(response.body);
                         username=user_info["pending_response"]["sms"]["username"];
                         print(username);


                   }),
                 ),
               ),
              Container(
                child: Text('user name is :${widget.username1} , otp is ${widget.otp1}'),
              ),

            ],
          ),

    );
  }
}
