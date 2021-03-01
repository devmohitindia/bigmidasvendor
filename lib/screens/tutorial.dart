import 'package:bigmidasvendor/widgets/drawer.dart';
import 'package:bigmidasvendor/widgets/myappbar.dart';
import 'package:flutter/material.dart';

class Tutorial extends StatefulWidget
{
  static String routeName="/tutorial";
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TutorialState();
  }
}
class TutorialState extends State<Tutorial>
{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int showDetails = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: getAppBar(_scaffoldKey, context),
      drawer: drawer(context,"Mohit","100"),
      body:  Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
          margin: EdgeInsets.only(top: 20,left: 20),
          child:Text("How to use the App Tutorial",style: TextStyle(color: Colors.red,fontSize: 18),),),
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
                          "Customer",
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
                        "Vendor",
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
          Container(
          margin: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1,
                    color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child:Row(children: [
              Image.asset("assets/images/download.jpg",height: 150,width: 150,),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text("Title of the Video",style: TextStyle(fontSize: 20),),)
            ],) ,),

          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1,
                    color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child:Row(children: [
              Image.asset("assets/images/download.jpg",height: 150,width: 150,),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text("Title of the Video",style: TextStyle(fontSize: 20),),)
            ],
            ) ,
          ),
      ],
      )
    );

  }
}