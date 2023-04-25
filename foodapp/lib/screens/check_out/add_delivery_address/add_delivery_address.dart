import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/providers/check_out_provider.dart';
import 'package:foodapp/screens/check_out/google_map/google_map.dart'; 
import 'package:foodapp/widgets/costom_text_field.dart';
import 'package:provider/provider.dart';

class AddDeliverAddress extends StatefulWidget{
  @override 
  _AddDeliverAddressState createState() => _AddDeliverAddressState();
}

enum AddressTypes{
  Home,
  Work,
  Other
}

class _AddDeliverAddressState extends State<AddDeliverAddress> {
  var myType = AddressTypes.Home;
  @override 
  Widget build(BuildContext context){
    CheckoutProvider checkoutProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Delivery Address",
          style: TextStyle(fontSize: 18),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical:10, horizontal:20),
        height: 48,
        child: checkoutProvider.isloadding == false
            ? MaterialButton(
                onPressed: () {
                  checkoutProvider.validator(context, myType);
                },
                child: Text(
                  "Add Address",
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
                color: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ): Center(
                child: CircularProgressIndicator(),
              ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          children: [
            CostomTextField(
              labText: "First name",
              controller: checkoutProvider.firstName,
              keyboardType: null,
            ),
            CostomTextField(
              labText: "Last name",
              controller: checkoutProvider.lastName,
              keyboardType: null,
            ),
            CostomTextField(
              labText: "Mobile No",
              controller: checkoutProvider.mobileNo,
              keyboardType: null,
            ),
            CostomTextField(
              labText: "Alternate Mobile No",
              controller: checkoutProvider.alternateMobileNo,
              keyboardType: null,
            ),
            CostomTextField(
              labText: "Scoiety",
              controller: checkoutProvider.scoiety,
              keyboardType: null,
            ),
            CostomTextField(
              labText: "Street",
              controller: checkoutProvider.street,
              keyboardType: null,
            ),
            CostomTextField(
              labText: "Landmark",
              controller: checkoutProvider.landmark,
              keyboardType: null,
            ),
            CostomTextField(
              labText: "City",
              controller: checkoutProvider.city,
              keyboardType: null,
            ),
            CostomTextField(
              labText: "Aera",
              controller: checkoutProvider.aera,
              keyboardType: null,
            ),
            CostomTextField(
              labText: "Pincode",
              controller: checkoutProvider.pincode, 
              keyboardType: null,
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CostomGoogleMap(),
                  ),
                );
              },
              child: Container(
                height: 47,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    checkoutProvider.setLoaction == null ? Text("Set Loaction"):
                    Text("Done!"),
                  ],
                ),
              ), 
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text("Address Type*"),
            ),
            RadioListTile(
              value: AddressTypes.Home, 
              groupValue: myType,
              title: Text("Home"),
              onChanged: (AddressTypes? value){
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.home,
                color: primaryColor,
              ),
            ),
            RadioListTile(
              value: AddressTypes.Work, 
              groupValue: myType, 
              title: Text("Work"),
              onChanged: (AddressTypes? value){
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.work,
                color: primaryColor,
              ),
            ),
            RadioListTile(
              value: AddressTypes.Other, 
              groupValue: myType, 
              title: Text("Other"),
              onChanged: (AddressTypes? value){
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.devices_other,
                color: primaryColor,
              ),
            )
          ],
        ), 
      ), 
    );
  }
}







