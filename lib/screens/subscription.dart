import 'package:bigmidasvendor/provider/providerlogn.dart';
import 'package:bigmidasvendor/widgets/drawer.dart';
import 'package:bigmidasvendor/widgets/myappbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Subscription extends StatefulWidget
{
  static String routeName="/subscription";
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SubscriptionState();
  }
}
class SubscriptionState extends State<Subscription>
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

        
        margin: EdgeInsets.only(top: 40),
        child:Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Text("Your Current Subscription",style: TextStyle(color: Colors.black,fontSize: 18),),
            Text("10 Days",style: TextStyle(color: Colors.red,fontSize: 18),),
          ],
          ),
          SizedBox(height: 10,),
          Container(
              alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 30,right: 30,top: 50),
              child: Text("Reactivate Your Account:",style: TextStyle(color: Colors.blue,fontSize: 20),),),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left:40 ,top: 10),
            child: Text("To Get Orders:",style: TextStyle(color: Colors.blue,fontSize: 20),),),

          Container(
              margin: EdgeInsets.all(10),
              child: Container(
                height: 50,
                child: Card(child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("30 Days:",style: TextStyle(color: Colors.black,fontSize: 18),),
                  Text("100 Rs.",style: TextStyle(color: Colors.red,fontSize: 18),),
                  Text("Pay Now",style: TextStyle(color: Colors.blue,fontSize: 18),),
                ],
              ),),)
          ),

          Container(

            margin: EdgeInsets.all(10),
            child:Card(
              child:  Container(
                height: 50,
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("90 Days:",style: TextStyle(color: Colors.black,fontSize: 18),),
                  Text("250 Rs.",style: TextStyle(color: Colors.red,fontSize: 18),),
                  Text("Pay Now",style: TextStyle(color: Colors.blue,fontSize: 18),),
                ],
              ),
              )
            )
          ),

          Container(
            margin: EdgeInsets.all(10),
            child: Container(
              height: 50,
              child: Card(child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("180 Days:",style: TextStyle(color: Colors.black,fontSize: 18),),
                Text("450 Rs.",style: TextStyle(color: Colors.red,fontSize: 18),),
                Text("Pay Now",style: TextStyle(color: Colors.blue,fontSize: 18),),
              ],
            ),),)
          ),

          Container(
              margin: EdgeInsets.all(10),
              child: Container(
                height: 50,
                child: Card(child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("365 Days:",style: TextStyle(color: Colors.black,fontSize: 18),),
                  Text("800 Rs.",style: TextStyle(color: Colors.red,fontSize: 18),),
                  Text("Pay Now",style: TextStyle(color: Colors.blue,fontSize: 18),),
                ],
              ),),)
          ),

          

            ],
            ),
          ),


    );
  }
}