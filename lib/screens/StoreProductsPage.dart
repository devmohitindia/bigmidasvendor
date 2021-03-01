import 'package:bigmidasvendor/screens/addproduct.dart';
import 'package:flutter/material.dart';

class StoreProductsPage extends StatefulWidget {
  String title;
  String subTitle;
  StoreProductsPage({this.title, this.subTitle});

  @override
  _StoreProductsPageState createState() =>
      _StoreProductsPageState(title: this.title, subTitle: this.subTitle);
}

class _StoreProductsPageState extends State<StoreProductsPage> {
  String title;
  String subTitle;
  _StoreProductsPageState({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Card(
    child:  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[

      Row(children: <Widget>[
      Image.asset(
            "assets/images/headphone.jpg",
            fit: BoxFit.fill,height: 90,width: 90,),
       Container(
         margin: EdgeInsets.only(left: 40),
         child:  Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
         Text(this.title),
         Text(this.subTitle),

       ],
       ),
       ),

      ],
      ),
       Column(children: <Widget>[
         FlatButton(
           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(18.0),
               side: BorderSide(color: Colors.green)),
           onPressed: () => {
             Navigator.pushNamed(context, AddProduct.routeName,arguments: -1)
           },
           child: Text(
             "Edit",
             style: TextStyle(fontWeight: FontWeight.w800, color: Colors.green),
           ),
         ),
         FlatButton(
           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(18.0),
               side: BorderSide(color: Colors.red)),
           onPressed: () => {
             Navigator.pushNamed(context, AddProduct.routeName,arguments: -1)
           },
           child: Text(
             "Delete",
             style: TextStyle(fontWeight: FontWeight.w800, color: Colors.red),
           ),
         ),
       ],
       )

      ],
    ),
//      margin: EdgeInsets.all(10),
//      child: ListTile(
//        leading: Container(
//          child: Image.asset(
//            "assets/images/headphone.jpg",
//            fit: BoxFit.cover,
//          ),
//        ),
//        title: Text(this.title),
//        subtitle: Text(this.subTitle),
//        trailing: Column(children: <Widget>[
//          FlatButton(
//            shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.circular(18.0),
//                side: BorderSide(color: Colors.green)),
//            onPressed: () => {
//              Navigator.pushNamed(context, AddProduct.routeName,arguments: -1)
//            },
//            child: Text(
//              "Edit",
//              style: TextStyle(fontWeight: FontWeight.w800, color: Colors.green),
//            ),
//          ),
//
//        ],
//        ),
//        isThreeLine: true,
//      ),
    );
  }
}
