
import 'package:bigmidasvendor/screens/serviceHistory.dart';
import 'package:bigmidasvendor/widgets/drawer.dart';
import 'package:bigmidasvendor/widgets/myappbar.dart';
import 'package:flutter/material.dart';

class ListOfServiceHistory extends StatefulWidget {
  static String routeName="/servicehistory";
  @override
  _ListOfServiceHistoryState createState() => _ListOfServiceHistoryState();
}

class _ListOfServiceHistoryState extends State<ListOfServiceHistory> {
  int showDetails = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  static List<Widget> _widgetOptions1 = <Widget>[
    ServiceHistory(),
    ServiceHistory(),
    ServiceHistory(),
  ];
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return
      Scaffold(
          key: _scaffoldKey,
          appBar: getAppBar(_scaffoldKey,context),
          drawer: drawer(context, "username", "balance"),
          body:Container(
            height: size.height,
            width: size.width,
            child: ListView(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(child: Image.asset("assets/images/share1.jpeg",height: 80,width: 80,),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Membership"),
                      SizedBox(width: 20,),
                      Container(

                        margin: EdgeInsets.only(right: 10),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40)

                          ),
                          border: Border.all(
                            width: 3,
                            color: Colors.red,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "25",
                          ),
                        ),
                      )

                    ],

                  ),
                ],),
              Container(
                margin: EdgeInsets.all(12),
                height: 40,
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
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
                              onPressed: () => {
                                this.setState(() {
                                  this.showDetails = 0;
                                })
                              },
                              child: Text(
                                "Pending",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: this.showDetails == 0
                                        ? Colors.white
                                        : Colors.black),
                              )),
                        )),
                    Expanded(
                        child: FlatButton(
                            color: this.showDetails == 1
                                ? Color.fromRGBO(118, 54, 152, 1)
                                : Colors.white,
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(9.0),
                            //     side: BorderSide(
                            //         color: this.showDetails == 1
                            //             ? Colors.red
                            //             : Colors.white)),
                            onPressed: () => {
                              this.setState(() {
                                this.showDetails = 1;
                              })
                            },
                            child: Text(
                              "Confirmed",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: this.showDetails == 1
                                      ? Colors.white
                                      : Colors.black),
                            ))),

                  ],
                ),
              ),
              SizedBox(
                child: Column(children: <Widget>[
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
