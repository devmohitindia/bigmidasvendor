
import 'package:bigmidasvendor/provider/providerlogn.dart';
import 'package:bigmidasvendor/widgets/drawer.dart';
import 'package:bigmidasvendor/widgets/myappbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'StoreHistory.dart';

class ListOfHistory extends StatefulWidget {
  static String routeName="storeOrders";
  @override
  _ListOfHistoryState createState() => _ListOfHistoryState();
}

class _ListOfHistoryState extends State<ListOfHistory> {
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
    String dropdownValue = 'All Orders';

    return
      Scaffold(
          key: _scaffoldKey,
          appBar: getAppBar(_scaffoldKey,context),
          drawer: drawer(context, "username", "balance"),
          body: Container(
            height: size.height,
            width: size.width,
            child: ListView(children: [
              Container(
                margin: EdgeInsets.all(12),
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black)),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                        child: Container(
                          child: FlatButton(
                              shape: RoundedRectangleBorder(
                                // borderRadius: BorderRadius.circular(9.0),
                                // side: BorderSide(
                                //     color: this.showDetails == 0
                                //         ? Colors.red
                                //         : Colors.white

                                //         )
                              ),
                              color: this.showDetails == 0
                                  ? Color.fromRGBO(118, 54, 152, 1)
                                  : Colors.white,
                              onPressed: () =>
                              {
                                this.setState(() {
                                  this.showDetails = 0;
                                })
                              },
                              child: Text(
                                "$args",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: this.showDetails == 0
                                        ? Colors.white
                                        : Colors.black),
                              )),
                        )),

//                    Expanded(
//                        child: FlatButton(
//                            color: this.showDetails == 1
//                                ? Color.fromRGBO(118, 54, 152, 1)
//                                : Colors.white,
//                            // shape: RoundedRectangleBorder(
//                            //     borderRadius: BorderRadius.circular(9.0),
//                            //     side: BorderSide(
//                            //         color: this.showDetails == 1
//                            //             ? Colors.red
//                            //             : Colors.white)),
//                            onPressed: () =>
//                            {
//                              this.setState(() {
//                                this.showDetails = 1;
//                              })
//                            },
//                            child: Text(
//                              "Confirmed",
//                              style: TextStyle(
//                                  fontSize: 16,
//                                  fontWeight: FontWeight.bold,
//                                  color: this.showDetails == 1
//                                      ? Colors.white
//                                      : Colors.black),
//                            ))),

                  ],
                ),
              ),
              SizedBox(
                child: Column(children: <Widget>[

                 Provider.of<ProviderLogin>(context,listen: false).userType!="store"?Container(): DropdownButton<String>(
                  value: dropdownValue,
                    items: <String>['All Orders', 'Pending Orders',"Confirmed Orders","Delivered Orders"].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                  ),
                  _widgetOptions1.elementAt(0),
                  _widgetOptions1.elementAt(0),
                ],
                ),
                height: 900,
                width: 500,)
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
