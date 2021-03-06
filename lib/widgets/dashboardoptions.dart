import 'package:bigmidasvendor/provider/providerlogn.dart';
import 'package:bigmidasvendor/screens/listing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget getDashboardOption(String textString,String imageLocation,BuildContext context,double imageSize)
{
Size size=MediaQuery.of(context).size;
 return GestureDetector(
     onTap: (){
       if(textString=="Store Listing")
       {
         Provider.of<ProviderLogin>(context,listen: false).userType="store";
         Navigator.pushNamed(context, Listing.routeName,arguments: 1);
       }
       else if(textString=="Vehicle Listing")
         {
           Provider.of<ProviderLogin>(context,listen: false).userType="vehicle";
           Navigator.pushNamed(context, Listing.routeName,arguments: 2);
         }
       else
         {
           Provider.of<ProviderLogin>(context,listen: false).userType="service";
           Navigator.pushNamed(context, Listing.routeName,arguments: 3);
         }
     },
     child: Container(


   height: 130,
   width: size.width/2,
   decoration: BoxDecoration(

       border: Border.all(color: Colors.black,width: 1),
       borderRadius: BorderRadius.all(Radius.circular(10))
   ),
   child:Column(children: [
     Container(
       margin: EdgeInsets.only(top: 10),
       child: Image.asset(imageLocation,height: imageSize,width: imageSize,),),
      Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(textString),)

   ],
   ) ,
     )
 );
}