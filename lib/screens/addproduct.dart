import 'dart:io';

import 'package:bigmidasvendor/provider/providershop.dart';
import 'package:bigmidasvendor/utils/hexcolor.dart';
import 'package:bigmidasvendor/widgets/appspecificsignaturewidgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

import 'dashboard.dart';


class AddProduct extends StatefulWidget
{
  static String routeName="/addproduct";
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddProductState();
  }
}
class AddProductState extends State<AddProduct>
{
  var dropdownValue;
  bool isLoading=false;


  String productName,cat,subcat,disprice,unit,stock,description;
  List<File> files;
  var _keyValidationForm = GlobalKey<FormState>();
  TextEditingController controllerPname=TextEditingController(),
      controllerCat=TextEditingController(),
      controllerSubCat=TextEditingController(),
      controllerdisprice=TextEditingController(),
  controllerUnit=TextEditingController(),
  controllerStock=TextEditingController(),
  controllerDesc=TextEditingController(),
  controllerPhotos=TextEditingController();

  @override
  Widget build(BuildContext context) {
    int screen=ModalRoute.of(context).settings.arguments;
    print("screen value is $screen");
    String title="Product Name";
    String category="Enter Category";
    String subcategory="Enter Sub-Category";
    String discountedPrice="Discounted Price";
    String photo="Product Photo";
  //  String hintText="Enter Shop Name";
   // String locationMap="Select Current Store Location in Map";
   // String locationTitle="Store Location";

    if(screen==-1)
      {
        title = "Sony Heaphone";
       category="Electronics";
       subcategory="Heaphones";
       discountedPrice="600";
       photo="Sony.jpeg";
      }
    if(screen==2) {
      title = "Select Your Vehicle Category";
    //  hintText="Enter Vehicle Category";
    //  locationMap="Select Your Vehicle Type";
   //   locationTitle="Vehicle Type";
    }
    else if(screen==3) {
      title = "Select Your Service Category";
    //  hintText="Enter Service Category";
    }

    Size size=MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
        backgroundColor: HexColor("#EEEEEE"),
        //appBar: MyAppBar(),
        body: SingleChildScrollView(

          child:Form(
            key: _keyValidationForm,
            child:  Card(


            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            margin: EdgeInsets.only(left: 10,right: 10,top: 40),
            child: Column(
              children: [

                Container(

                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 1, bottom: 1),
                      child: Image.asset("assets/images/logo_Big_Midas.jpeg",height: 180,width: 180,),
                    )
                ),
                //  getTItleWidget("Product Name"),
                getTextWidget("$title","Enter Product Name",size,controllerPname),
                SizedBox(height: 20,),

                // getTItleWidget("Category"),
                getTextWidget("$category","Enter Category",size,controllerCat),
                SizedBox(height: 20,),
                // getTItleWidget("Sub Category"),
                getTextWidget("$subcategory","",size,controllerSubCat),
                SizedBox(height: 20,),
                //  getTItleWidget("Product Price"),
                getTextWidget("$discountedPrice","Enter Discounted Price",size,controllerdisprice),
                SizedBox(height: 20,),
                //  getTItleWidget("Product Price"),
                getTextWidget("Unit","Unit",size,controllerUnit),
                SizedBox(height: 20,),
                //  getTItleWidget("Product Price"),
                getTextWidget("Stock","Stock",size,controllerStock),
                SizedBox(height: 20,),
                //  getTItleWidget("Product Price"),
                getTextWidget("Description","Description",size,controllerDesc),
                SizedBox(height: 20,),
                //  getTItleWidget("Product Photo"),
                getTextWidget("$photo","",size,controllerPhotos,isFieldEnabled: false),

                Container(
                  margin: EdgeInsets.all(20),
                  child: isLoading?CircularProgressIndicator():getAwesomeButton("Add Product",()async{

                    if(!_keyValidationForm.currentState.validate())return;
//                    String pName,
//                        String cat,
//                    String subcat,
//                    String prodcost,
//                    String discost,
//                    String unit,
//                    String stock,
//                    String desc,
//                    List<File> files,
                    setState(() {
                      isLoading=true;
                    });
                 await  Provider.of<ProviderShop>(context,listen: false).addProduct(
                        context,
                        controllerPname.text,
                        controllerCat.text,
                        controllerSubCat.text,
                        controllerdisprice.text,
                        controllerdisprice.text,
                        controllerUnit.text,
                        controllerStock.text,
                        controllerDesc.text,
                        files
                        );
                    setState(() {
                      isLoading=false;
                    });
                  }
                  ),
                )

              ],
            ),
          ),)
        )

    );
  }

  Widget getTItleWidget(String title)
  {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 10,top: 15),
      child: Text("$title",style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget getTextWidget(String hint,String textIfAny,Size size,TextEditingController _controller,{bool isFieldEnabled})
  {
    return GestureDetector(
      onTap: (){
        if(hint=="Product Photo"){
          selectFiles();
        }
      },
      child:Container(
      width: size.width-80,
      height: 70,
      alignment: Alignment.bottomLeft,
      margin: EdgeInsets.only(left: 0,top: 10),
      child: TextFormField(
        controller: _controller,
        enabled: isFieldEnabled!=null?isFieldEnabled:true,

        // initialValue: textIfAny,
        decoration: InputDecoration(
          errorStyle: TextStyle(color: Colors.red),
          labelText: '$hint',
          //prefixIcon: Icon(Icons.email),
          // icon: Icon(Icons.perm_identity)
        ),
        onChanged: (value){

        },
        validator: (value){
          if(value.trim().isEmpty)return "Field can not be left empty";
          else
            return null;
        },
        style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),

      ),
    ) ,
    );
  }

  void selectFiles()async {
    FilePickerResult result = await FilePicker.platform.pickFiles(allowMultiple: true);

    if(result != null) {
       files = result.paths.map((path) => File(path)).toList();
print("length of files is ${files.length}");
 controllerPhotos.text="${files.length} files selected";
    } else {
      // User canceled the picker

    }
  }
//  Widget getTextWidget(String hint,String textIfAny,Size size,{bool isFieldDisable})
//  {
//    return  Container(
//
//      width: size.width-80,
//      height: 50,
//      decoration: BoxDecoration(
//        borderRadius: BorderRadius.all(Radius.circular(10)),
//        border: Border.all(width: 3,color: HexColor("#1A0E7009"),style: BorderStyle.solid),
//        color: isFieldDisable!=null&&isFieldDisable?HexColor("#F1F1F1"):Colors.white,
//      ),
//      alignment: Alignment.bottomLeft,
//      margin: EdgeInsets.only(left: 0,top: 10),
//
//      child:Container(
//
//        child: TextFormField(
//
//          initialValue: textIfAny,
//          decoration: InputDecoration(hintText: "$hint",border: InputBorder.none),
//          style: TextStyle(color: Colors.grey,),
//
//        ),
//        margin: EdgeInsets.only(left: 10,bottom: 10),
//
//      ),
//    );
//  }
}