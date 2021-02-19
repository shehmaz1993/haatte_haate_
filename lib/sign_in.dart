import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:haate_haate/sign_up.dart';

import 'Size.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays([]);
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: ListView(
          children:<Widget>[
           Stack(
                children: [
                  Image.asset('assets/images/sign_in_bg.png',width: 500,),
                  Padding(
                     padding: EdgeInsets.only(left:SizeConfig.blockSizeHorizontal*5.00,top: SizeConfig.blockSizeVertical*38.00,right:SizeConfig.blockSizeHorizontal*5.00,),//left: 20.00,top: 270.00,right:10.0

                      child:Container(

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
                              ]
                          ),
                        child:Padding(
                          padding:  EdgeInsets.all(6.0),
                          child: Form(

                            child: Column(

                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(left:SizeConfig.blockSizeHorizontal*4.0,top:SizeConfig.blockSizeVertical*0.8),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text('Sign In',style: TextStyle(color: Colors.black,fontSize: 20.0, ),textAlign: TextAlign.center,),
                                          SizedBox(height:SizeConfig.blockSizeVertical*0.90,),//6
                                          Container(
                                            height:SizeConfig.blockSizeVertical*0.84,
                                            width:SizeConfig.blockSizeHorizontal*30,
                                            color: Colors.red,
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(left:SizeConfig.blockSizeHorizontal*18.8,bottom:SizeConfig.blockSizeVertical*1.2),//left:80.0,bottom: 9.0
                                        child: InkWell(
                                          onTap: (){
                                            Route route=MaterialPageRoute(builder: (context)=> SignUp());

                                            Navigator.push((context), route);
                                          },
                                            child: Text('Sign up',textAlign:TextAlign.right,style: TextStyle(color: Colors.grey[300],fontSize: 20.0, ))

                                        ),
                                      ),
                                    ],

                                  ),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                  )
                                ),
                                SizedBox(
                                  height:SizeConfig.blockSizeVertical* 1.0,
                                  width:SizeConfig.blockSizeHorizontal* 2.0,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'Password'
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left:SizeConfig.blockSizeHorizontal* 34.00,top:SizeConfig.blockSizeVertical*10.0),//left: 110.00,top:60.00,
                                  child: Text('Forgot your password?',style: TextStyle(color: Colors.black,fontSize: 15.0,fontStyle:FontStyle.italic ),textAlign: TextAlign.right,),
                                ),
                                SizedBox(height:SizeConfig.blockSizeVertical* 2,),//height: 7,
                                SizedBox(
                                  height:SizeConfig.blockSizeVertical* 9.0,//60.0
                                  width:SizeConfig.blockSizeHorizontal* 89.0,//290.0
                                  child: MaterialButton(
                                      color:Colors.red ,
                                      child:Text('SIGN IN',style: TextStyle(color: Colors.white70,fontSize:20.0,fontWeight: FontWeight.bold ),),
                                      onPressed:(){}
                                  ),
                                ),
                                SizedBox(height:SizeConfig.blockSizeVertical* 0.5,),
                              ],
                            ),
                          ),
                        )

                      )
                 ),


                ],

                ),
            Padding(
              padding: EdgeInsets.only(left:SizeConfig.blockSizeHorizontal*8.0,top:SizeConfig.blockSizeVertical* 8.0,right:SizeConfig.blockSizeHorizontal* 4.0),//left:25.0,top: 50.0,right: 4.0
              child: Row(
                  children: [
                    Text('*I agree with  terms and condition',textAlign:TextAlign.center,style: TextStyle(color:Colors.grey ),),
                    SizedBox(width: 5,),
                    Text('Read more',style:TextStyle(color: Colors.black)),
                  ],
                ),
            ),
            Container(
              height:SizeConfig.blockSizeVertical*20.0,//150
              width:SizeConfig.blockSizeHorizontal*45.0,//350
              child: Image.asset('assets/images/splash_screen.png'),
            )

            ]
    ),
        );

  }
}
