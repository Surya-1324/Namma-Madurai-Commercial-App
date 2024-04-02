import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nammamadurai/reusable/reusable.dart';
class identifypage extends StatefulWidget {
  const identifypage({super.key});

  @override
  State<identifypage> createState() => _identifypageState();
}

class _identifypageState extends State<identifypage> {
  String info="";
  bool disp=false;


  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
appBar: AppBar(

  title:Text('Identify'),
  backgroundColor: theme.themebackground,),


        body:
         SingleChildScrollView(
            child: Column(
mainAxisAlignment: MainAxisAlignment.start,
crossAxisAlignment: CrossAxisAlignment.center,
               children :[
                 Container(

                   width: w,

                   child: Image(image: AssetImage('assets/aivision.jpg'),),),
SizedBox(height: 30,),

Container(
  
  padding: EdgeInsets.all(20),
  child: const Text('This page helps you to verify the government officers with the help of camera.',textAlign: TextAlign.center,style: TextStyle( ),),),
            GestureDetector(
              onTap: () async {
                var picker=ImagePicker();
                XFile? img=await picker.pickImage(source: ImageSource.camera);


              },
              child: CircleAvatar(
                backgroundColor: theme.themebackground,
                  radius: 75,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80),

                      child: Image(image: AssetImage('assets/cam.jpg')),


                  )
              ),

            ),
                 SizedBox(height: 20,),
                 Text("Click Here to take Photo"),
                 SizedBox(height: 20,),
                 ElevatedButton(


                     style: ElevatedButton.styleFrom(backgroundColor: theme.themebackground),
                     onPressed: (){

                       setState(() {
                         disp=true;
                       });


                       Timer(Duration(seconds: 4), () {


                         setState(() {
                           disp=false;
                           info="Face matched 90.3";
                         });
                       });


                     }, child: Text("Verify")),

                 SizedBox(height: 10,),
                 Text(info,style: TextStyle(color: theme.themebackground),),
                 SizedBox(height: 10,),
                 Visibility(

                     visible: disp,
                     child: CircularProgressIndicator(color: theme.themebackground,))

      ],),
          ),
        ),
    );
  }
}


