import 'package:bigmidasvendor/provider/providerlogn.dart';
import 'package:bigmidasvendor/provider/providershop.dart';
import 'package:bigmidasvendor/screens/ListOfServiceHistory.dart';
import 'package:bigmidasvendor/screens/ListOfVichleHistory.dart';
import 'package:bigmidasvendor/utils/hexcolor.dart';
import 'package:bigmidasvendor/widgets/appspecificsignaturewidgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import 'package:provider/provider.dart';

import 'dashboard.dart';


class Listing extends StatefulWidget
{
  static String routeName="/payment";
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListingState();
  }
}
class ListingState extends State<Listing>
{
  bool isLoading=false;
  var dropdownValue;

  var customLocation;
   var _keyValidationForm = GlobalKey<FormState>();
  LocationResult result;
//   TextEditingController controllerName=TextEditingController(text: "Mohit");
//  TextEditingController controllerLatLong=TextEditingController(text: "79.8 65.5");
//  TextEditingController controllercity=TextEditingController(text: "city");
//  TextEditingController controllerarea=TextEditingController(text: "area");
//  TextEditingController controlleraddress=TextEditingController(text: "addr");
//  TextEditingController controllercategory=TextEditingController(text: "cate");
//  TextEditingController controllerpanadhaar=TextEditingController(text: "ad");
//  TextEditingController controllertrade=TextEditingController(text: "tra");
//  TextEditingController controllerfassai=TextEditingController(text: "fassa");

  TextEditingController controllerName=TextEditingController(text: "");
  TextEditingController controllerLatLong=TextEditingController(text: "");
  TextEditingController controllercity=TextEditingController(text: "");
  TextEditingController controllerarea=TextEditingController(text: "");
  TextEditingController controlleraddress=TextEditingController(text: "");
  TextEditingController controllercategory=TextEditingController(text: "");
  TextEditingController controllerpanadhaar=TextEditingController(text: "");
  TextEditingController controllertrade=TextEditingController(text: "");
  TextEditingController controllerfassai=TextEditingController(text: "");

  bool isVehicle=false;

  @override
  Widget build(BuildContext context) {
    int screen=ModalRoute.of(context).settings.arguments;

    String title="Your Shop Name";
    String hintText="Enter Shop Name";
    String locationMap="Select Current Store Location in Map";
    String locationTitle="Store Location";
    if(screen==2) {
      title = "Select Your Vehicle Category";
       hintText="Enter Vehicle Category";
      locationMap="Select Your Vehicle Type";
      locationTitle="Vehicle Type";
      isVehicle=true;
    }
      else if(screen==3) {
      title = "Select Your Service Category";
       hintText="Enter Service Category";
    }

    Size size=MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
        backgroundColor: HexColor("#EEEEEE"),
        //appBar: MyAppBar(),
        body: SingleChildScrollView(

          child: Form(
            key:_keyValidationForm ,
            child:
          Card(

            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            margin: EdgeInsets.only(left: 20,right: 20,top: 40),
            child: Column(


              children: [

                Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 1, bottom: 32),
                      child: Image.asset("assets/images/logo_Big_Midas.jpeg",height: 180,width: 180,),
                    )
                ),

                getTItleWidget("$title"),
                getTextWidget("$title","$hintText",size,controller: controllerName),

                getTItleWidget("$locationTitle"),

                GestureDetector(onTap: (){
                  showPlacePicker();print("tapped");},child:getTextWidget("$locationMap","",size,onTapped: (){
    //if(locationMap=="Select Current Store Location in Map")
                  if(!isVehicle)
    {
    print("tapped place picker");
    showPlacePicker();

    }

    },controller: controllerLatLong,isFieldEnabled: isVehicle)
    ),

                getTItleWidget("City"),
                getTextWidget("Enter City","",size,controller: controllercity),

                getTItleWidget("Area"),
                getTextWidget("Enter Area","",size,controller: controllerarea),

                getTItleWidget("Address"),
                getTextWidget("Enter Address","",size,controller: controlleraddress),


                getTItleWidget("Category"),
                getTextWidget("Select Category","",size,controller: controllercategory),

                getTItleWidget("Document"),
                getTextWidget("Select Pan/Adhaar","",size,controller: controllerpanadhaar),

                if(screen==2)
                  Column(children: <Widget>[
                    getTextWidget("Select Driving Licence","",size),
                    getTextWidget("Select Insurance","",size),
                    getTextWidget("Select RC","",size),
                    getTextWidget("Select FC Permit(optional)","",size),
                  ],
                  ),
                if(screen==1)
                  Column(children: <Widget>[
                    getTextWidget("Trade Licence","",size,controller: controllertrade),
                    getTextWidget("FSSAI Licence","",size,controller: controllerfassai),
                  ],
                  ),


                Container(
                  margin: EdgeInsets.all(10),
                  child:isLoading?Container(margin: EdgeInsets.only(top: 10),child: CircularProgressIndicator(),): getAwesomeButton("Register",(){

                    String userType = Provider
                        .of<ProviderLogin>(context,listen: false)
                        .userType;
                    if(userType=="store")
                      //Navigator.pushReplacementNamed(context, DashBoard.routeName);
                      storeRegister();
                    else if(userType=="vehicle")
                      Navigator.pushReplacementNamed(context, ListOfVichleHistory.routeName);
                    //   Navigator.pushReplacementNamed(context, DashBoard.routeName);
                    else
                      Navigator.pushReplacementNamed(context, ListOfServiceHistory.routeName);
                    //  Navigator.pushReplacementNamed(context, DashBoard.routeName);
                  }
                  ),
                ),
Container(
  child: FlatButton(
    child: Text("Already have a Listing?"),onPressed: (){
    openDashboardAccordingly();
  },
  ),
)

//             GestureDetector(
//               onTap: (){
//    Navigator.pushReplacementNamed(context, DashBoard.routeName);
//               },
//               child:  Container(
//               margin: EdgeInsets.only(top: 20),
//               child: getSignatureButtonShape("Register",size),),)


              ],
            ),
          ),)
        )

    );
  }

  void openDashboardAccordingly()
  {
    String userType = Provider
        .of<ProviderLogin>(context,listen: false)
        .userType;
    if(userType=="store")
      Navigator.pushReplacementNamed(context, DashBoard.routeName);
      //storeRegister();
    else if(userType=="vehicle")
      Navigator.pushReplacementNamed(context, ListOfVichleHistory.routeName);
    //   Navigator.pushReplacementNamed(context, DashBoard.routeName);
    else
      Navigator.pushReplacementNamed(context, ListOfServiceHistory.routeName);
    //  Navigator.pushReplacementNamed(context, DashBoard.routeName);

  }

  Widget getTItleWidget(String title)
  {
    return Container();
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 20,top: 15),
      child: Text("$title",style: TextStyle(fontWeight: FontWeight.bold),),);
  }
  Widget getTextWidget(String hint,String textIfAny,Size size,{bool isFieldEnabled,Function onTapped,TextEditingController controller,})
  {
    return  Container(


      width: size.width-80,
      height: 70,
     alignment: Alignment.bottomLeft,
      margin: EdgeInsets.only(left: 0,top: 10),
        child: TextFormField(

          enabled: isFieldEnabled!=null?isFieldEnabled:true,
          controller: controller,
          onTap: onTapped,
         validator: (value){

            if(value.trim().isEmpty)return "Field can not be left blank";
            return null;
         },

         // initialValue: textIfAny,
          decoration: InputDecoration(
              labelText: '$hint',
            errorStyle: TextStyle(
              color: Theme.of(context).errorColor, // or any other color
            ),
              //prefixIcon: Icon(Icons.email),
             // icon: Icon(Icons.perm_identity)
          ),
          style: TextStyle(color: Colors.grey,),


        ),



    );
  }

  void showPlacePicker() async {
//    LocationResult result = await Navigator.of(context).push(MaterialPageRoute(
//        builder: (context) =>
//            PlacePicker("AIzaSyCWXUFR85OjCAqEhFcwfPzlZDzseNlfinM",
//              //displayLocation: customLocation,
//
//            )));
//
//    // Handle the result in your way
//
//    print(result);
//    print("map latlong $customLocation");


   result=await  showLocationPicker(
      context, "AIzaSyCWXUFR85OjCAqEhFcwfPzlZDzseNlfinM",
      initialCenter: LatLng(31.1975844, 29.9598339),
      myLocationButtonEnabled: true,
      layersButtonEnabled: true,
      countries: ['AE', 'NG'],

    );
  print("latlong ${result.latLng.longitude}");
  controllerLatLong.text="${result.latLng.latitude} ${result.latLng.longitude}";
  }

  void storeRegister() async{
    if(!_keyValidationForm.currentState.validate()) return;
    setState(() {
      isLoading=true;
    });
   await Provider.of<ProviderShop>(context,listen: false).addShop(
       context,
       controllerName.text,
      controllerLatLong.text,
      controllerarea.text,
      controllercity.text,
      controllerpanadhaar.text,
      controllertrade.text,
      controllerfassai.text,
      controlleraddress.text,
      controllercategory.text,
      Provider.of<ProviderLogin>(context,listen: false).modelUser.id
    );
    setState(() {
      isLoading=false;
    });
  }
}