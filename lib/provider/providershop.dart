import 'dart:convert';
import 'dart:io';


import 'package:async/async.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bigmidasvendor/provider/providerlogn.dart';
import 'package:bigmidasvendor/screens/dashboard.dart';
import 'package:bigmidasvendor/widgets/showdialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../common.dart';

class ProviderShop with ChangeNotifier
{
  Future<void>addShop(
      context,
      String shopName,
      String latlong,
      String area,
      String city,
      String pan_adhaar,
      String tradelicence,
      String fassai,
      String address,
      String cat,
      String vendorid)async
  {
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var request = http.Request('POST', Uri.parse(SHOP_CREATE));
    request.bodyFields = {
      'shop_name': '$shopName',
      'location_map': '$latlong',
      'area': '$area',
      'city': '$city',
      'pan_adhaar': '$pan_adhaar',
      'trade_licence': '$tradelicence',
      'fssai_licence': '$fassai',
      'address': '$address',
      'category': '$cat',
      'vendorid': '$vendorid'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      String strres=await response.stream.bytesToString();
      print(strres);
      var json=jsonDecode(strres);
      var success=json['_id'];
      if(success!=null)
      {
        getCustomDialog(
            context,
            "Action Completed",
            "Shop Listed Successfully",
            DialogType.SUCCES,
          oktext: "Explore Orders Page",
            okFunc: (){
          Navigator.pushReplacementNamed(context, DashBoard.routeName);
        }
        );
      }
      else
      {
        String msg=json['message'];
        getCustomDialog(context,"Error","$msg",DialogType.ERROR,oktext: "Okay");
      }
  }
  else {
  print(response.reasonPhrase);
  }

  }

  Future<void>addProduct(
      context,
      String pName,
      String cat,
      String subcat,
      String prodcost,
      String discost,
      String unit,
      String stock,
      String desc,
      List<File> files
      )async
  {
    var headers = {
      'Content-Type': 'application/form-data'
    };

    var request = http.MultipartRequest('POST', Uri.parse('http://162.241.201.237:7420/store/products'));
    request.fields.addAll({
      'productname': '$pName',
      'category': '$cat',
      'subcategory': '$subcat',
      'prodctcost': '$prodcost',
      'discountedprodprice': '$discost',
      'vendorid': Provider.of<ProviderLogin>(context,listen: false).modelUser.id,
      'unit': '$unit',
      'stock': '$stock',
      'description': '$desc'
    });
    print(files[0].absolute.path);
    request.headers.addAll(headers);
   // request.files.add(await http.MultipartFile.fromPath('prodphoto', files[0].absolute.path));

    String fileName = files[0].path.split("/").last;
    var stream = new http.ByteStream(DelegatingStream.typed(files[0].openRead()));

    // get file length

    var length = await files[0].length(); //imageFile is your image file

    // multipart that takes file
    var multipartFileSign = new http.MultipartFile('prodphoto', stream, length, filename: 'prodphoto');

    request.files.add(multipartFileSign);
   http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }
  }

}