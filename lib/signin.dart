import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nammamadurai/admin/admin.dart';
import 'package:nammamadurai/home.dart';
import 'package:nammamadurai/reusable/reusable.dart';


class signin extends StatelessWidget {

  const signin({super.key});

  @override
  Widget build(BuildContext context) {

    var h=MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(

        backgroundColor: theme.themebackground,
        body: SingleChildScrollView(
          child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [


            SizedBox(height:h/5 ,),
          SizedBox(width:200,child: ElevatedButton(onPressed: () async {
            var auth=FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {


            final GoogleSignInAuthentication googleSignInAuthentication =
                await googleSignInAccount.authentication;
            final AuthCredential authCredential = GoogleAuthProvider.credential(
                idToken: googleSignInAuthentication.idToken,
                accessToken: googleSignInAuthentication.accessToken);

    UserCredential result = await auth.signInWithCredential(authCredential);
    User? user = result.user;

    if (result != null) {
    Navigator.pushReplacement(
    context, MaterialPageRoute(builder: (context) => home()));
    }}


    },


            child:Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(FontAwesomeIcons.google,color: theme.themebackground,),SizedBox(width: 10,),Text("Sign In",style: TextStyle(color: Colors.black),)],),style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),

            backgroundColor: Colors.white,

          ), )),



          SizedBox(width: 200 ,child: ElevatedButton(onPressed: () {

            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>adminpage()));

          },style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),

            backgroundColor: Colors.white,

          ),

          child: Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(FontAwesomeIcons.user,color: theme.themebackground,),SizedBox(width: 10,),Text("Admin",style: TextStyle(color: Colors.black),)],),)),
        Image.asset('assets/login.png')
      ],),
        ),
    ));
  }
}
