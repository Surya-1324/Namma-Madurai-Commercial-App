import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nammamadurai/main.dart';

import 'package:nammamadurai/reusable/reusable.dart';

class profilepage extends StatefulWidget {
  const profilepage({super.key});

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    return  SafeArea(
        child: Scaffold(

          body: SingleChildScrollView(
            child: Column(
              children: [Stack(
                children: <Widget>[ Container(
                  width: w,
                  height: 280,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0),bottomRight: Radius.circular(300)), color: theme.themebackground,
                  ),
                ),

                  Positioned(
                      bottom: 10, // Adjust the positioning as needed
                      right: 15, // Adjust the positioning as needed
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child: Image(image: NetworkImage(userinfo.getprofileurl(),),fit: BoxFit.cover,height: 150,width: 150,)
                        ),
                      )
                  ),
                ],
              ),
                SizedBox(height: 90,),
                Row(

                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    CircleAvatar(

                      backgroundColor: theme.themeicon,
                      radius: 20,
                      child: Icon(FontAwesomeIcons.user,color: Colors.white,size: 20,),
                    ),SizedBox(
                      width: 20,
                    ),Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 7,
                        ),
                        Text('Name',style: TextStyle(fontSize: 12,fontStyle: FontStyle.italic,fontWeight: FontWeight.w300),),
                        Text(userinfo.getuser(),style: TextStyle(fontSize: 14,fontFamily: "Poppins"),)
                      ],
                    )
                  ],
                ),SizedBox(
                  height: 25,
                ),Row(

                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    CircleAvatar(

                      backgroundColor: theme.themeicon,
                      radius: 20,
                      child: Icon(Icons.email_outlined,color: Colors.white,size: 20,),
                    ),SizedBox(
                      width: 20,
                    ),Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 7,
                        ),
                        Text('Gmail',style: TextStyle(fontSize: 12,fontStyle: FontStyle.italic,fontWeight: FontWeight.w300,),),
                        Text(userinfo.getemail(),style: TextStyle(fontSize: 14,fontFamily: "Poppins"),)
                      ],
                    )
                  ],
                ),SizedBox(
                  height: 25,
                ),
               SizedBox(
                  height: 75,
                ),

                OutlinedButton(onPressed: (){

                  userinfo.logout();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>mainpage()));

                },style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  side: BorderSide(width: 2.0, color: theme.themebackground),
                ), child: Padding(padding: EdgeInsets.all(10),
                  child: Text('Logout',style: TextStyle(
                      color: theme.themebackground,fontSize: 19
                  ),),
                )),
              ],
            ),
          ),
        ));
  }
}


