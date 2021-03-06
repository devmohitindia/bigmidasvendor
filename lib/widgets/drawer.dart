import 'package:bigmidasvendor/provider/providerlogn.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:provider/provider.dart';

import 'listtiledrawer.dart';

List<Icon>icons=[
  Icon(Icons.account_circle),
  Icon(Icons.book),
  Icon(Icons.rate_review),
  Icon(Icons.subscriptions),
  Icon(Icons.share),
  Icon(Icons.label_outline),
  Icon(Icons.branding_watermark),
  Icon(Icons.bookmark_border),
  Icon(Icons.call_missed_outgoing),
  Icon(Icons.account_circle),
  Icon(Icons.account_circle),
  Icon(Icons.account_circle),
];
Widget drawer(BuildContext context, String username, String balance) {

  return Container(

      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
          child: Container(
          color: Colors.white,
          margin: EdgeInsets.only(top: 40,left: 20),
          // color: Colors.white10,
          //  color: Colors.black,
          child: ListView(
            children: <Widget>[
//              Row(
//                children: [
//                  Container(
//                    child: Image.asset("assets/images/user.png",
//                      height: 60,
//                      width: 60,),
//                    margin: EdgeInsets.only(left: 20),),
//                  Container(child: Column(children: [
//                    Text("Hi,${username.substring(0,username.length>10?10:username.length)}",
//                        style: TextStyle(
//                          fontSize: 16,
//                          color: Colors.black,fontWeight: FontWeight.bold,),textAlign: TextAlign.left
//                    ),
//
//                    Container(child: Text("Balance :$balance",style: TextStyle(fontSize: 14),textAlign: TextAlign.left,),margin: EdgeInsets.only(top: 5),)
//                  ],),margin: EdgeInsets.only(left: 10)),
//
//                  GestureDetector(onTap:(){
//                    Navigator.pop(context);
//                  },child:  Align(
//                    child: Container(
//                      child:  Image.asset("assets/images/close.png",),
//                      margin: EdgeInsets.only(left:50),
//                      height: 30,
//                      width: 30
//                      ,),alignment: Alignment.centerRight,),)
//
//                ],
//              ),
//              DrawerTile(context,"Dashboard"),
//              DrawerTile(context,"Create Campaign"),
//              DrawerTile(context,"User Management"),
//              DrawerTile(context,"Payments"),
//              DrawerTile(context,"Buy SMS Credits"),
//              DrawerTile(context,"Settings"),
//              DrawerTile(context,"Log Out"),
              Container(
                margin: EdgeInsets.only(left:0,right: MediaQuery.of(context).size.width/3+55),

                height: 30,
                child: LiteRollingSwitch(


                //initial value
                value: true,
                textOn: 'Active',
                textOff: 'In-Active',
                colorOn: Colors.greenAccent[700],
                colorOff: Colors.redAccent[700],
                iconOn: Icons.done,
                iconOff: Icons.remove_circle_outline,
                textSize: 12.0,
                onChanged: (bool state) {
                  //Use it to manage the different states
                  print('Current State of SWITCH IS: $state');
                },
              ),),

            Image.asset("assets/images/logo_Big_Midas.jpeg",height: 120,width: 120,),
            //for(var item in Provider.of<ProviderLogin>(context).getDrawerOptions() )
              for(int i=0;i< Provider.of<ProviderLogin>(context).getDrawerOptions().length;i++ )
              DrawerTile(context,Provider.of<ProviderLogin>(context).getDrawerOptions()[i],icons[i])



//              GestureDetector(child: Center(
//                child:Container(
//
//                  child: Text("Terms and Conditions",style: TextStyle(color: Colors.green,decoration: TextDecoration.underline),),
//                  margin: EdgeInsets.only(top: 20),
//                ),
//              ),onTap: (){
//
//              },
//              )


            ],
          ),
        ),
      ));
}
