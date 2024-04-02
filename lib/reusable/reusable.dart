
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_icons/line_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
class theme{
  static Color themebackground=HexColor('#FE6300');
  static Color themeiconbackground=HexColor('#ffd2a9');
  static Color themeicon=HexColor('#fea166');


}
class userinfo{

  static var auth =FirebaseAuth.instance;
  static getuser(){
    return auth.currentUser?.displayName;
  }
  static getemail(){
    return auth.currentUser?.email;
  }

  static getprofileurl(){
    return auth.currentUser?.photoURL;
  }
  static logout(){
    return auth.signOut();
  }

  static getphonenumber(){
    print(auth.currentUser?.phoneNumber.toString());
    return auth.currentUser?.phoneNumber.toString();
  }


static getuid(){
    return auth.currentUser?.uid;
}

}

class reusablewidgets{
  static getdrawer(){
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader( child: Center(child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(

backgroundColor: Colors.white,
                radius: 40,
                child: Icon(Icons.person,color: theme.themebackground,size: 40,),),

              
              Text(userinfo.getuser(),style: TextStyle(color: Colors.white),)
            ],
          )),decoration:BoxDecoration(color:theme.themebackground,)),



          GestureDetector(
            onTap: (){},
            child: ListTile(
              leading: Icon(Icons.leaderboard_outlined,color: theme.themebackground),title: Text("Elected Representative",style: TextStyle(color: theme.themebackground),),),
          ),

Divider(color: theme.themebackground,),
          GestureDetector(
            onTap: (){},
            child: ListTile(
              leading: Icon(LineIcons.question,color: theme.themebackground),title: Text("Who's Who",style: TextStyle(color: theme.themebackground),),),
          ),
          Divider(color: theme.themebackground,),
          GestureDetector(
            onTap: (){},
            child: ListTile(
              leading: Icon(LineIcons.phone,color: theme.themebackground),title: Text("Helpline",style: TextStyle(color: theme.themebackground),),),
          ),
          Divider(color: theme.themebackground,),
        ],
      ),
    );
  }
}

