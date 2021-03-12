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
  final String confirmpassword;


// SmsVerification({Key key, this.value}) : super(key: key);
  SmsVerification({ this.username1,this.otp1,this.password1,this.confirmpassword});

  @override
  _SmsVerificationState createState() => _SmsVerificationState(username1,otp1,password1,confirmpassword);
}

class _SmsVerificationState extends State<SmsVerification> {
  String username1;
  String otp1;
   String password1;
  String confirmpassword;
  _SmsVerificationState(username1,otp1,password1,confirmpassword);
   Future<User> phase2(String username,String otp,String isPhoneVerified )async
  {
    final String url1="https://haatehaate.herokuapp.com/api/v1/user/registration/send-otp-for-registration/";
    final response=await  http.post(url1,body: {
      'username':username,
      'otp':otp,
      'is_phone_verified': isPhoneVerified
    });

    if(response.statusCode==201 ){
      print('user succesfully registered');
      final String  responsestring  = response.body;
      return userFromJson(responsestring);
      print(userFromJson(responsestring));
    }
    else{
      //return null;
      throw ('Failed to connect');
    }


  }

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

                       onPressed: (){
                         String _isphoneverified= 'false';
                        phase2(username1, otp1, _isphoneverified);

                   }),
                 ),
               )

            ],
          ),

    );
  }
}
