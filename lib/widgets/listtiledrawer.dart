import 'package:bigmidasvendor/screens/ListOfHistory.dart';
import 'package:bigmidasvendor/screens/ListOfVichleHistory.dart';
import 'package:bigmidasvendor/screens/Privacy.dart';
import 'package:bigmidasvendor/screens/TC.dart';
import 'package:bigmidasvendor/screens/aboutus.dart';
import 'package:bigmidasvendor/screens/addproduct.dart';
import 'package:bigmidasvendor/screens/editproduct.dart';
import 'package:bigmidasvendor/screens/listing.dart';
import 'package:bigmidasvendor/screens/profile.dart';
import 'package:bigmidasvendor/screens/register.dart';
import 'package:bigmidasvendor/screens/review.dart';
import 'package:bigmidasvendor/screens/subscription.dart';
import 'package:bigmidasvendor/utils/hexcolor.dart';
import 'package:flutter/material.dart';

 Widget DrawerTile(BuildContext context,String itemName,Icon icon) {
   return  ListTile(
     //leading: Icon(Icons.account_circle),
     leading: icon,

    contentPadding: EdgeInsets.only(left: 5, top: 15, right: 20),
    dense: true,
title: Text("$itemName",
    style: TextStyle(
        color: itemName=="Dashboard"?
        Colors.red:Colors.red,
        fontWeight: FontWeight.bold,
      fontSize: 18

    )
),
//    title: Container(
//        height: 50,
//        padding: EdgeInsets.only(left: 10,),
//        alignment: Alignment.centerLeft,
//        //decoration: BoxDecoration(color:itemName=="Dashboard"?HexColor("0E7009"):HexColor("0E70090D"),
//        //decoration: BoxDecoration(color:itemName=="Dashboard"?HexColor("0E7009"):HexColor("DCDCDC"),
//        decoration: BoxDecoration(color:HexColor("#ffcccb"),
//            border: Border.all(color: Colors.transparent, width: 1),
//            borderRadius: BorderRadius.all(Radius.circular(10))),
//        child: Text("$itemName",style: TextStyle(color: itemName=="Dashboard"?Colors.black:Colors.black,fontWeight: FontWeight.bold))
//    ),
    onTap: () async {
      print("Enterd===================");

      if(itemName=="Log Out")
        {
          //Provider.of<ProviderLogin>(context,listen: false).logOut();
          Navigator.pushReplacementNamed(context,"/");
        }
      else if(itemName=="Add Product")

      {
      //  Provider.of<ProviderLogin>(context,listen: false).logOut();
        Navigator.pushNamed(context,AddProduct.routeName);
      }
      else if(itemName=="Rating/Reviews"){

Navigator.pushNamed(context, ReviewListView.routeName);
      }
      else if(itemName=="Profile Setting")
        {

          Navigator.pushNamed(context, Profile.routeName);
        }
      else if(itemName=="Subscription")
      {

        Navigator.pushNamed(context, Subscription.routeName);
      }
      else if(itemName=="Edit Products"){
         Navigator.pushNamed(context, EditProduct.routeName);
      }
      else if(itemName=="Vehicle Details"){
        Navigator.pushNamed(context, Listing.routeName,arguments: 2);
      }
      else if(itemName=="Orders"||itemName=="Completed Jobs"||itemName=="Completed Booking"){
        Navigator.pushNamed(context, ListOfHistory.routeName,arguments: "$itemName");
      }
      else if(itemName=="T/C"){
        Navigator.pushNamed(context, TC.routeName,arguments: 2);
      }
      else if(itemName=="Privacy Policy"){
        Navigator.pushNamed(context, Privacy.routeName,arguments: 2);
      }
      else if(itemName=="About Us"){
        Navigator.pushNamed(context, AboutUs.routeName,arguments: 2);
      }
    },
  );

}