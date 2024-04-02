import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nammamadurai/electriccharge.dart';
import 'package:nammamadurai/electricitypage.dart';
import 'package:nammamadurai/identify.dart';
import 'package:nammamadurai/police.dart';

import 'package:nammamadurai/profile.dart';
import 'package:nammamadurai/publicnotification.dart';
import 'package:nammamadurai/redirect.dart';
import 'package:nammamadurai/reusable/reusable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nammamadurai/service.dart';
import 'package:nammamadurai/stream.dart';
import 'package:nammamadurai/tourism.dart';
import 'package:nammamadurai/wardreport.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';




class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {


  geticonwithname(bgcolor,icon,iconname){
    return
      Column(


        children: [

          Container(

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: HexColor(bgcolor,),
            ),
            padding: EdgeInsets.all(10),

            height: 55,
            width: 55,
            child:
            icon,


          ),
          SizedBox(height: 5,)

          ,Text(iconname,style:GoogleFonts.poppins(
              fontSize: 12.0
              ,fontWeight: FontWeight.w500
          ) ,),








    ],);
  }

  @override
  Widget build(BuildContext context) {





var scaffoldkey=GlobalKey<ScaffoldState>();
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        

        key: scaffoldkey,
        drawer:reusablewidgets.getdrawer() ,
        backgroundColor: Colors.white,

        bottomNavigationBar: BottomNavigationBar(
selectedItemColor:theme.themebackground ,

          type: BottomNavigationBarType.fixed,
          items: [


          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: 'Home'),
          BottomNavigationBarItem(icon: IconButton(

            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>stream()));

            }, icon: Icon(Icons.play_arrow_outlined),),label: "Stream"),
          BottomNavigationBarItem(icon: IconButton(

            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>publicnotification()));

            }, icon: Icon(Icons.notifications_none),),label: "Notification"),
          BottomNavigationBarItem(icon: IconButton(

            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>profilepage()));

          }, icon: Icon(Icons.person_2_outlined),),label: "Profile"),
        ],

        ),
        body:SafeArea(


              child:  Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Container(
                          height: 50,
                          width: w,
                          color: theme.themebackground,
                          child: Row(children: [

                            IconButton(onPressed: (){

                              scaffoldkey.currentState?.openDrawer();

                            }, icon: Icon(Icons.menu,color: Colors.white,)),


                          ],),
                        ),
                
                        Container(
                          color: Colors.white,
                          height: 288.2,
                          width: w,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: ListView(
                              children: [
                                CarouselSlider(
                                  items: [

                                    //1st Image of Slider
                                    Container(

                                      width: w,
                                    //  margin: EdgeInsets.all(6.0),
                                      decoration: BoxDecoration(
                                        color: theme.themebackground,
                                      //  borderRadius: BorderRadius.circular(8.0),
                                        image: DecorationImage(
                                          image: AssetImage('assets/madurai.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    //2nd Image of Slider
                                    Container(width: w,
                                   //   margin: EdgeInsets.all(6.0),
                                      decoration: BoxDecoration(
                                      //  borderRadius: BorderRadius.circular(8.0),
                                        image: DecorationImage(
                                          image: AssetImage('assets/madurai1.png'),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),

                                    //3rd Image of Slider
                                    Container(width: w,
                                    //  margin: EdgeInsets.all(6.0),
                                      decoration: BoxDecoration(
                                      //  borderRadius: BorderRadius.circular(8.0),
                                        image: DecorationImage(
                                          image: AssetImage('assets/madurai2.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    //4th Image of Slider
                                    Container(width: w,
                                //      margin: EdgeInsets.all(6.0),
                                      decoration: BoxDecoration(
                                      //  borderRadius: BorderRadius.circular(8.0),
                                        image: DecorationImage(
                                          image: AssetImage('assets/madurai4.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    //5th Image of Slider
                                    Container(width: w,
                                     // margin: EdgeInsets.all(6.0),
                                      decoration: BoxDecoration(
                                      //  borderRadius: BorderRadius.circular(8.0),
                                        image: DecorationImage(
                                          image: AssetImage('assets/madurai5.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                  ],

                                  //Slider Container properties
                                  options: CarouselOptions(
                                    height: 288.0,
                                   aspectRatio: 16/2,
                                    autoPlay: true,
                                    enlargeCenterPage: false,

                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    viewportFraction: 1,
                                    enableInfiniteScroll: true,
                                    autoPlayAnimationDuration: Duration(milliseconds: 800),

                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: w,

                          height:430,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(0),topRight: Radius.circular(0))
                          ),


                          child: Padding(
                            padding: const EdgeInsets.only(left: 25,top: 25,right: 25,bottom: 20),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Category",style:GoogleFonts.poppins(
                                      fontSize: 20.0
                                      ,fontWeight: FontWeight.w500
                                  ) ,),
                                ),
                                SizedBox(
                                  height: 35,
                                ),
                                Row(



                                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                                  children: [






                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            final Uri _url = Uri.parse('https://www.google.com/maps/d/u/0/edit?mid=1lFTh8IHHEe1gwH65Ry3b4xuBMVhP-3g&usp=sharing');
                                            if (!await launchUrl(_url, mode: LaunchMode.externalApplication, webViewConfiguration: const WebViewConfiguration(enableJavaScript: true))) {
                                            throw Exception('Could not launch $_url');
                                            }


                                          },
                                          child: geticonwithname("#baffa6",Image.asset('assets/locationmarker.png'),"Map"),
                                        ),SizedBox(
                                          height: 22,
                                        ),           GestureDetector(
                                          onTap: () async {

                                            final Uri _url = Uri.parse('http://mducorpicts.com/Public/Newgrievance.aspx');
                                            if (!await launchUrl(_url, mode: LaunchMode.externalApplication, webViewConfiguration: const WebViewConfiguration(enableJavaScript: true))) {
                                              throw Exception('Could not launch $_url');
                                            }



                                          },
                                          child: geticonwithname('#ffd2a9',Icon(Icons.local_post_office,color: theme.themebackground),"Compliants"),
                                        ),SizedBox(
                                          height: 22,
                                        ),
                                        GestureDetector(
                                          onTap: (){

                                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>service()));
                                          },
                                          child: geticonwithname('#bbddfb',Icon(Icons.emergency,color: HexColor('#2986cc')),"Services"),
                                        ),

                                      ],)
                                    ,
                                    SizedBox(
                                      width: 12,
                                    ),


                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        GestureDetector(
                                          onTap: (){

                                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>wardreport()));
                                          },
                                          child: geticonwithname('#fbc0c0',Icon(Icons.note_alt,color: Colors.red,),"Grievance"),
                                        ),SizedBox(
                                          height: 22,
                                        ),
                                        GestureDetector(
                                          onTap: (){

                                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>tourismpage()));

                                          },
                                          child: geticonwithname('#e7ddff',Icon(Icons.tour,color: HexColor('#674ea7')),"Tourism"),
                                        ),SizedBox(
                                          height: 22,
                                        ),
                                        GestureDetector(
                                          onTap: (){

                                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>electricitypage()));

                                          },
                                          child: geticonwithname('#fff3b4',Icon(Icons.electric_bolt,color: Colors.amber),"Electricity"),
                                        ),


                                      ],),
                                    SizedBox(
                                      width: 12,
                                    ),


                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        GestureDetector(
                                          onTap: (){

                                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>echarge()));

                                          },
                                          child: geticonwithname('#b8ddff',Icon(Icons.battery_charging_full_outlined,color: HexColor('#3d85c6'),),"E-Charging"),
                                        ),SizedBox(
                                          height: 22,
                                        ),GestureDetector(
                                          onTap: (){


                                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>police()));
                                          },
                                          child: geticonwithname('#f8cade',Icon(Icons.local_police,color: HexColor('#c90076'),),"Police"),
                                        ),SizedBox(
                                          height: 22,
                                        ),
                                        GestureDetector(
                                          onTap: (){

Navigator.of(context).push(MaterialPageRoute(builder: (context)=>identifypage()));

                                          },
                                          child: geticonwithname("#baffa6",Icon(Icons.remove_red_eye,color: Colors.green,),"Identity"),
                                        ),






                                      ],),




                                  ],),
                              ],
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),

              ),

          ),









      
      ),
    );




  }
}
