import 'package:bigmidasvendor/provider/providerlogn.dart';
import 'package:bigmidasvendor/widgets/drawer.dart';
import 'package:bigmidasvendor/widgets/myappbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget
{
  static String routeName="/profile";
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfileState();
  }
}
class ProfileState extends State<Profile>
{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      appBar: getAppBar(_scaffoldKey,context),
      drawer: drawer(context, "username", "balance"),
    body: SingleChildScrollView(

      child:Column(children: [
        Container(
          height: size.height/3+100,
          width: size.width-20,
          child: Card(
            elevation: 20,

            //height: 320,
            // width: double.infinity,
            // padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(20),
            //decoration: BoxDecoration(
            //   borderRadius:BorderRadius.all(Radius.circular(10),),border: Border.all(color: Colors.black) ),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Container(

                height: 120,
                child: Image.asset("assets/images/circular_image2.png"),

                width: 120,

                margin: EdgeInsets.only(left: 5,top: 20),
              ),
             Container(
               margin: EdgeInsets.only(top: 30),
               child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("Name - Mohit Wadhwani",style: TextStyle(color: Colors.red,fontSize: 16),),
                 SizedBox(height: 5,),
                 Text("Email - mohit@gmail.com",style: TextStyle(color: Colors.red,fontSize: 16),),
                 SizedBox(height: 5,),
                 Text("Phone Number - 7587654390",style: TextStyle(color: Colors.red,fontSize: 16),),
                 SizedBox(height: 5,),
                 Text("State/Country - Alabama/U.S.A",style: TextStyle(color: Colors.red,fontSize: 16),),
               ],
             ) ,)

            ],
            ),
          ),),
        if(Provider.of<ProviderLogin>(context).userType=="store")
         Container(
           margin: EdgeInsets.only(left: 20),
           alignment: Alignment.centerLeft,child:  Text("Delivery or Pickup:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),),
        //if(Provider.of<ProviderLogin>(context).userType=="vehicle"||Provider.of<ProviderLogin>(context).userType=="store")
        if(Provider.of<ProviderLogin>(context,listen: false).userType=="service")
          Container(
            margin: EdgeInsets.only(left: 20,top: 30),
            alignment: Alignment.centerLeft,
            child:  TextFormField(
              initialValue: "I am service provider of Mobile and Phone Repairement With over 10 + Years of experience we have understood \ every ins and out of the domain",
              decoration: InputDecoration(hintText: "About Us"),
              maxLines: 5,
              minLines: 3,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        if(Provider.of<ProviderLogin>(context).userType=="service")
          Container(
            margin: EdgeInsets.only(left: 20,top: 30),
            alignment: Alignment.centerLeft,child:  Text("How many km serving:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),),
        if(Provider.of<ProviderLogin>(context).userType!="service")
        Container(
          margin: EdgeInsets.only(left: 20,top: 30),
          alignment: Alignment.centerLeft,child:  Text("How many km serving:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),),

        if(Provider.of<ProviderLogin>(context).userType=="vehicle")
          Container(
            margin: EdgeInsets.only(left: 20,top: 20),
            alignment: Alignment.centerLeft,child:  Text("Per KM Charges:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),),
        if(Provider.of<ProviderLogin>(context).userType=="store")
          Container(
            margin: EdgeInsets.only(left: 20,top: 20),
            alignment: Alignment.centerLeft,child:  Text("Delivery Charges:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),),
        if(Provider.of<ProviderLogin>(context).userType=="store")
          Container(
            margin: EdgeInsets.only(left: 20,top: 20),
            alignment: Alignment.centerLeft,child:  Text("Free Delivery Above:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),),

        Container(
          margin: EdgeInsets.only(left: 30,top: 30),
          alignment: Alignment.center,child:  Text("Add/Edit Photos:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue),),),
      ],

      )  ,

    ),
    );
  }
}