import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nammamadurai/reusable/reusable.dart';
import 'package:nammamadurai/router.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>router()));
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: theme.themebackground,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          Image(image:AssetImage('assets/logotransparent.png')),
          SizedBox(height: 20,),
          CircularProgressIndicator(color: Colors.white,)

        ],),

      ),
    );
  }
}
