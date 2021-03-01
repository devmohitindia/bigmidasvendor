import 'package:bigmidasvendor/screens/listing.dart';
import 'package:bigmidasvendor/utils/hexcolor.dart';
import 'package:bigmidasvendor/widgets/dashboardoptions.dart';
import 'package:flutter/material.dart';


class SelectService extends StatefulWidget
{
  static String routeName="/selectservice";
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SelectServiceState();
  }

}

class SelectServiceState extends State<SelectService>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

        bottomNavigationBar:Container(
            height: 60,
            color: Colors.red,
            child: InkWell(
                onTap: () =>Navigator.pop(context),

                child: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      Text('close',style: TextStyle(color: Colors.white),),
                    ],
                  ),)
            )
        ),

        //appBar: CustomAppBar(),
        body:Container(
          margin: EdgeInsets.only(top: 10,left: 40,right: 40),
          child: ListView(children: [


               Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getDashboardOption("Store Listing", "assets/images/store.gif",context,85),
                //getDashboardOption("LOI", "assets/images/2.png",context),
              ],
            ),

            Container(
              margin: EdgeInsets.all(20),

              child: Text("If you have your shop/store then proceed with store listing",
                style: TextStyle(
                    color: Colors.red),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getDashboardOption("Vehicle Listing", "assets/images/vehicle.gif",context,85),
                  //getDashboardOption("Alloted Mines", "assets/images/4.png",context),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),

              child: Text("If you want to list your vehicles then login/signup with vehicle listing",
                style: TextStyle(
                    color: Colors.red),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getDashboardOption("Service Listing", "assets/images/service.gif",context,85),
                  //getDashboardOption("Alloted Mines", "assets/images/4.png",context),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),

              child: Text("If you are a carpenter plumber web/app developer or providing some other service then login/signup with service listing",
                style: TextStyle(
                    color: Colors.red),
              ),
            ),
//          Container(
//            margin: EdgeInsets.only(top: 40),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: [
//                getDashboardOption("Etps Scanned", "assets/images/3.png",context),
//                getDashboardOption("Users List", "assets/images/4.png",context),
//              ],
//            ),
//          )
          ],

          ),)
    );
  }

}