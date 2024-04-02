import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nammamadurai/signin.dart';

import 'home.dart';


class router extends StatefulWidget {
  const router({super.key});

  @override
  State<router> createState() => _routerState();
}

class _routerState extends State<router> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: StreamBuilder(

        stream: FirebaseAuth.instance.authStateChanges(),
    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

    if(snapshot.hasData)
    return home();
    else if(snapshot.hasError)
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Login Error") ));
    else
    return signin();
    return SizedBox();}));
  }
}
