
import 'package:flutter/material.dart';
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/models/product_model.dart';
import 'package:foodapp/models/review_cart_model.dart';
import 'package:foodapp/providers/review_cart_provider.dart';
import 'package:foodapp/providers/wishlist_provider.dart';
import 'package:foodapp/widgets/single_item.dart';
import 'package:provider/provider.dart';

class WishLsit extends StatefulWidget {
  @override 
  _WishLsitState createState() => _WishLsitState();
}

class _WishLsitState extends State<WishLsit>{
  late WishListProvider wishListProvider;
  
  showAlertDialog(BuildContext context, ProductModel delete){
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: (){
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: (){  
        wishListProvider.deleteWishtList(delete.productId);
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("WishList Product"),
      content: Text("Are you sure to delete the wishList Product?"),
      actions: [
        cancelButton,
        continueButton
      ],
    );

    showDialog(
      context: context, 
      builder: (BuildContext context){
        return alert;
      }
    );
  }

  @override 
  Widget build(BuildContext context){
    wishListProvider = Provider.of(context);
    wishListProvider.getWishListData();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WishList",
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ),
      body: ListView.builder(
        itemCount: wishListProvider.getWishList.length,
        itemBuilder: (context, index) {
          ProductModel data = wishListProvider.getWishList[index];
          return Column(
            children: [
              const SizedBox(height: 10),
              SingleItem( 
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
                productId: data.productId,
                productQuantity: data.productQuantity,
                wishList: true,
                productUnit: "50 Gram",
                onDelete: (){
                  showAlertDialog(context, data);
                }, 
                isBool: true,
              ),
            ],
          );
        },
      ),
    );
  }
}




