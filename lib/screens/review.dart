
import 'package:bigmidasvendor/provider/providerlogn.dart';
import 'package:bigmidasvendor/widgets/drawer.dart';
import 'package:bigmidasvendor/widgets/myappbar.dart';
import 'package:bigmidasvendor/widgets/reviewcard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewListView extends StatefulWidget {
  static String routeName="/review";
  @override
  _ReviewListStateView createState() => _ReviewListStateView();
}

class _ReviewListStateView extends State<ReviewListView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    String reviewTitle="Review on your store:";
    print(Provider.of<ProviderLogin>(context,listen: false).userType);
    if(Provider.of<ProviderLogin>(context,listen: false).userType=="vehicle")
      reviewTitle="Review on your Vehicle:";
    else if(Provider.of<ProviderLogin>(context,listen: false).userType=="service")
      reviewTitle="Review on your Service:";
    return Scaffold(
      drawer: drawer(context, "username", "balance"),
        appBar: getAppBar(_scaffoldKey,context),
        body: Container(
      margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(12),
              child: InkWell(
                onTap: () => {
                  // Navigator.pushNamed(context, '/storeProfile')
                  print("Add review")
                },
                child: Text("$reviewTitle",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
              ),
            ),
            ReviewCard(
              name: "Igor Antonovich",
              rating: 4,
              review: '"There is a huge variety of water sports"',
            ),
            ReviewCard(
              name: "carMellta Marsham",
              rating: 5,
              review: '"Recently cruised on Princess line for the first time"',
            ),
            ReviewCard(
              name: "Igor Antonovich",
              rating: 2,
              review: '"There is a huge variety of water sports',
            ),
            ReviewCard(
              name: "Igor Antonovich",
              rating: 4,
              review: '"There is a huge variety of water sports',
            ),
            ReviewCard(
              name: "Igor Antonovich",
              rating: 1,
              review: '"There is a huge variety of water sports',
            ),
            ReviewCard(
              name: "Igor Antonovich",
              rating: 4,
              review: '"There is a huge variety of water sports',
            )
          ],
        )
      // child: ListView(
      //   children: [
      //     Text("hi"),
      //     Text("hi"),

      //   ],
      // ),
    )
    );
  }
}