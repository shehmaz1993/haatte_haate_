import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:haate_haate/autofill.dart';
import 'package:haate_haate/sign_in.dart';
import 'loadingpage.dart';
import 'usermodel.dart';

import 'Size.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String privateusername;
  String privatepassword;
  String privatepassword2;
  String privatesendingotp;
  String privatesendingotp1;
  String privateisphoneverified;

  String username1;
  String password1;
  String otp1=' ';


  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();
  TextEditingController _phonenumber = TextEditingController();
  var formkey = GlobalKey<FormState>();

  User user,_user;

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays([]);
  }


  Future<User> createUser(String username, String password, String password2) async {
    String privateusername;
    String privatesendingotp1;
    String privatepassword;
    final  String url =
        "https://haatehaate.herokuapp.com/api/v1/user/registration/phase-1/";
    // final String url1="https://haatehaate.herokuapp.com/api/v1/user/registration/send-otp-for-registration/";
    Map data = {
      'username': username,
      'password': password,
      'password2': password2,
      'send_otp': 'true',
    };

    String body = json.encode(data);
    Map<String, String> headers = {"Content-type": "application/json"};
    final response = await http.post('https://haatehaate.herokuapp.com/api/v1/user/registration/phase-1/',headers: headers, body: body);
    print('result is.....'+response.body);
    final Map user_info= json.decode(response.body);
    print(user_info);
    print(user_info["pending_response"]);
    privateusername=user_info["pending_response"]["sms"]["username"];
    print(privateusername);
    privatesendingotp1=user_info["pending_response"]["sms"]["otp"];
    print(privatesendingotp1);

    if (response.statusCode == 200) {
      print('api calling is successsful......');
       final String responsestring = response.body;
       print(responsestring);

      return userFromJson(responsestring);



    } else {
      print('api calling error .........');
    }
  }


  _showdialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Confirm Phone Number",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text("Please varify that your phone number:"),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    _phonenumber.text,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("is correct, before proceeding to OTP varification"),
                ],
              ),
            ),
            actions: [
              RaisedButton(
                  child: Text("Proceed",
                      style: TextStyle(color: Colors.red, fontSize: 11.0)),
                  onPressed: () {
                    print('user name is.... '+_user.username);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return SmsVerification(
                            username1: username1,
                            password1: password1,

                            otp1: otp1);
                      }),
                    );
                  }),
              RaisedButton(
                  child: Text("Edit",
                      style: TextStyle(color: Colors.red, fontSize: 11.0)),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var countryDropDown = Container(
      decoration: new BoxDecoration(
        color: Colors.white70,
        border: Border(
          right: BorderSide(width: 0.5, color: Colors.grey),
        ),
      ),
      height: 45.0,
      margin: EdgeInsets.only(
          top: SizeConfig.blockSizeVertical * 0.8,
          left: SizeConfig.blockSizeHorizontal * 2.5),
      child: Padding(
        padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical * 1.2,
            left: SizeConfig.blockSizeHorizontal * 0.5),
        child: Text('+88', style: TextStyle(color: Colors.black, fontSize: 15)),
      ),
    );
    return Scaffold(
      body: ListView(children: <Widget>[
        Stack(
          children: [
            Image.asset(
              'assets/images/sign_in_bg.png',
              width: 500,
            ),
            Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.blockSizeHorizontal * 5.00,
                  top: SizeConfig.blockSizeVertical * 38.00,
                  right: SizeConfig.blockSizeHorizontal * 5.00,
                ), //left: 20.00,top: 270.00,right:10.0

                child: Container(
                    // color:Colors.white,
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: Colors.white,
                        boxShadow: [
                          new BoxShadow(
                            blurRadius: 2.0,
                            offset: const Offset(3.0, 2.0),
                            color: Colors.grey,
                          ),
                          new BoxShadow(
                            blurRadius: 2.0,
                            offset: const Offset(-3.0, 0.0),
                            color: Colors.grey,
                          )
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Form(
                        key: formkey,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: SizeConfig.blockSizeHorizontal * 4.0,
                                  top: SizeConfig.blockSizeVertical * 0.8),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: SizeConfig.blockSizeHorizontal *
                                            10.8,
                                        bottom: SizeConfig.blockSizeVertical *
                                            1.2), //left:80.0,bottom: 9.0
                                    child: InkWell(
                                        onTap: () {
                                          Route route = MaterialPageRoute(
                                              builder: (context) => SignIn());
                                          Navigator.push((context), route);
                                        },
                                        child: Text('Sign in',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 20.0,
                                            ))),
                                  ),
                                  SizedBox(
                                    width:
                                        SizeConfig.blockSizeHorizontal * 17.80,
                                  ),
                                  Column(
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Sign up',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.0,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height:
                                            SizeConfig.blockSizeVertical * 0.90,
                                      ), //6
                                      Container(
                                        height:
                                            SizeConfig.blockSizeVertical * 0.84,
                                        width:
                                            SizeConfig.blockSizeHorizontal * 30,
                                        color: Colors.red,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 3.0,
                            ),

                            Container(
                              width: double.infinity,
                              margin: new EdgeInsets.only(
                                  top: 10.0,
                                  bottom: 10.0,
                                  right: 3.0,
                                  left: 10.0),
                              color: Colors.white,
                              child: TextFormField(
                                controller: _phonenumber,
                                maxLength: 11,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Phone number',
                                  fillColor: Colors.white,
                                  prefixIcon: countryDropDown,
                                  hintText: 'Phone Number',
                                ),
                                validator: (value) {
                                  if (value.length == 0) {
                                    return ("Phone number must required");
                                  }
                                  if (value.length != 11) {
                                    return ("Enter valid Phone number");
                                  }
                                  return null;
                                },
                                onSaved: (value) {},
                              ),
                            ),

                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 1.0,
                              width: SizeConfig.blockSizeHorizontal * 2.0,
                            ),
                            TextFormField(
                              // maxLength: 6,
                              controller: _password,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Password'),
                              validator: (value) {
                                if (value.length == 0) {
                                  return ("Password must be required");
                                }
                                if (value.length < 4) {
                                  return ("Password must be minimum 4 digit");
                                }
                                return null;
                              },
                              onSaved: (value) {},
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 1.0,
                              width: SizeConfig.blockSizeHorizontal * 2.0,
                            ),
                            TextFormField(
                              controller: _confirmpassword,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Confirm Password'),
                              validator: (value) {
                                if (_password.text != _confirmpassword.text) {
                                  return ("Password does not match");
                                }
                                return null;
                              },
                              onSaved: (value) {},
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: SizeConfig.blockSizeHorizontal * 45.00,
                                  top: SizeConfig.blockSizeVertical *
                                      7.0), //left: 110.00,top:60.00,
                              child: Text(
                                'Forgot your password?',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontStyle: FontStyle.italic),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 2,
                            ), //height: 7,
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 9.0, //60.0
                              width:
                                  SizeConfig.blockSizeHorizontal * 89.0, //290.0
                              child: MaterialButton(
                                  color: Colors.red,
                                  child: Text(
                                    'SIGN UP',
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () async {
                                setState(() {
                                    privateusername = _phonenumber.text;
                                    privatepassword = _password.text;
                                    privatepassword2 = _confirmpassword.text;
                                   });

                                       if (formkey.currentState.validate()) {
                                                 print('from validate done.....');
                                                 _user = await createUser(
                                                     privateusername,
                                                     privatepassword,
                                                     privatepassword2,
                                                 );

                                  print('username is ${_user.username} and ${_user.otp}');

                                       _showdialog(context);
                                       }

                                    }
                                  ),
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 0.5,
                            ),
                          ],
                        ),
                      ),
                    ))),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              left: SizeConfig.blockSizeHorizontal * 8.0,
              top: SizeConfig.blockSizeVertical * 8.0,
              right: SizeConfig.blockSizeHorizontal *
                  4.0), //left:25.0,top: 50.0,right: 4.0
          child: Row(
            children: [
              Text(
                '*I agree with  terms and condition',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 5,
              ),
              Text('Read more', style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
        Container(
          height: SizeConfig.blockSizeVertical * 20.0, //150
          width: SizeConfig.blockSizeHorizontal * 45.0, //350
          child: Image.asset('assets/images/splash_screen.png'),
        )
      ]),
    );
  }
  _navigatetoloading(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Load();
    }));
  }
}
