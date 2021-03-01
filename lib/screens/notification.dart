import 'package:bigmidasvendor/widgets/drawer.dart';
import 'package:bigmidasvendor/widgets/myappbar.dart';
import 'package:flutter/material.dart';

class AppNotification extends StatefulWidget
{
  static String routeName="/notification";
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return AppNotificationState();
  }

}

class AppNotificationState extends State<AppNotification>
{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      appBar: getAppBar(_scaffoldKey,context),
      drawer: drawer(context, "username", "balance"),
      body: Container(
        width: double.infinity,
      child: Column(
        children: <Widget>[


           Container(
            margin: EdgeInsets.only(top: 20),
            width: double.infinity,
            child:Column(children: <Widget>[
            Card(child: Row(children: <Widget>[
              Image.asset("assets/images/headphone.jpg",height: 80,width: 80,),
              Column(
                mainAxisSize: MainAxisSize.max,

                children: <Widget>[
                  Text("Big Billion Day"),
                  Text("Buy Electronics with upto 30% off"),
                ],
              ),
            ],) ,),
              Card(child: Row(children: <Widget>[
                Image.asset("assets/images/headphone.jpg",height: 80,width: 80,),
                Column(
                  mainAxisSize: MainAxisSize.max,

                  children: <Widget>[
                    Text("Big Billion Day"),
                    Text("Buy Electronics with upto 30% off"),
                  ],
                ),
              ],) ,),
            ],)
          )

      ],
      ),
    ),);
  }

}