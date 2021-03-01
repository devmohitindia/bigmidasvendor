
import 'package:bigmidasvendor/widgets/drawer.dart';
import 'package:bigmidasvendor/widgets/myappbar.dart';
import 'package:flutter/material.dart';

import 'StoreHistory.dart';
import 'StoreProductsPage.dart';

class EditProduct extends StatefulWidget {
  static String routeName="/editproduct";
  @override
  EditProductState createState() => EditProductState();
}

class EditProductState extends State<EditProduct> {
  int showDetails = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  static List<Widget> _widgetOptions1 = <Widget>[
    StoreHistory(),
    StoreHistory(),
    StoreHistory(),
  ];

  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context).settings.arguments;
    Size size = MediaQuery
        .of(context)
        .size;
    return
      Scaffold(
          key: _scaffoldKey,
          appBar: getAppBar(_scaffoldKey,context),
          drawer: drawer(context, "username", "balance"),
          body: Container(
            height: size.height,
            width: size.width,
            child: ListView(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  // controller: controller,
                  // focusNode: focusNode,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x4437474F),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    hintText: "Search Product",
                    contentPadding: const EdgeInsets.only(
                      left: 16,
                      right: 20,
                      top: 14,
                      bottom: 14,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              StoreProductsPage(
                title: "Sony Heaphone",
                subTitle: "\u20A8 6000 \nWireless'",
              ),
              StoreProductsPage(
                title: "Sony Heaphone",
                subTitle: "\u20A8 6000 \nWireless'",
              ),
              StoreProductsPage(
                title: "Sony Heaphone",
                subTitle: "\u20A8 6000 \nWireless'",
              ),
            ]
            ),
          )
      );
  }
//      Container(
//      child: Column(
//        children: [
//          VichileHistory(),
//          VichileHistory(),
//          VichileHistory(),
//        ],
//      ),
//    );
}
