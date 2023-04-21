import 'package:foodapp/models/review_cart_model.dart'; 
import 'package:foodapp/config/colors.dart';
import 'package:foodapp/providers/user_provider.dart';
import 'package:foodapp/screens/home/home_screen.dart';
import 'package:foodapp/screens/my_profile/my_profile.dart';
import 'package:foodapp/screens/review_cart/review_cart.dart';
// import 'package:app/screens/wishList/wish_list.dart';
import 'package:flutter/material.dart'; 

class DrawerSide extends StatefulWidget{
  UserProvider userProvider;
  DrawerSide({required this.userProvider});

  @override 
  _DrawerSideState createState() => _DrawerSideState();
}
 
class _DrawerSideState extends State<DrawerSide>{
  Widget listTile({String? title, IconData? iconData, Function()? onTap}){
    return Container(
      height: 50,
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          iconData,
          size: 28,
        ),
        title: Text(
          title!,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }

  @override 
  Widget build(BuildContext context){
    var userData = widget.userProvider.currentUserData;
    return Drawer(
      child: Container(
        color: primaryColor,
        child: ListView(
          children: [

            DrawerHeader(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 43,
                      backgroundColor: Colors.white54,
                      child: CircleAvatar(
                        backgroundColor: Colors.yellow,
                        backgroundImage: NetworkImage(
                          userData.userImage ?? 
                          "https://s3.envato.com/files/328957910/vegi_thumb.png",
                        ),
                        radius: 40,
                      ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(userData.userName),
                        Text(
                          userData.userEmail,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )
                  ]
                ),
              ), 
            ),
            listTile(
              iconData: Icons.home_outlined,
              title: "Home",
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
            ),
            listTile(
              iconData: Icons.share_outlined,
              title: "Review Cart",
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReviewCart(),
                  ),
                );
              },
            ),
            listTile(
              iconData: Icons.person_outline,
              title: "My Profile",
              onTap: (){
                Navigator.of(context).push( 
                  MaterialPageRoute(
                    builder: (context) => MyProfile(userProvider:widget.userProvider),
                  ),
                );
              }
            ),
            listTile(iconData: Icons.notifications_outlined, title: "Notification"),
            listTile(iconData: Icons.star_outline, title: "Rating & Review"),
            listTile(
              iconData: Icons.favorite_outline,
              title: "Wishlist",
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              } 
            ),
            listTile(iconData: Icons.copy_outlined, title: "Raise a Complaint"),
            listTile(iconData: Icons.format_quote_outlined, title: "FAQs"),
            Container(
              height: 350,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact Support"),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text("Call us:"),
                      SizedBox(width: 10),
                      Text("+923352580282"),
                    ],
                  ),
                  SizedBox(height: 5),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text("Mail us:"),
                        SizedBox(width: 10),
                        Text(
                          "assarbaloch5@gmail.com",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}





