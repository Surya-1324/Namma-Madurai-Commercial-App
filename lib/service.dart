import 'package:flutter/material.dart';
import 'package:nammamadurai/redirect.dart';
import 'main.dart';
import 'reusable/reusable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:hexcolor/hexcolor.dart';
class service extends StatefulWidget {
  const service({Key? key}) : super(key: key);


  @override
  State<service> createState() => _serviceState();
}

class _serviceState extends State<service> {
  getservice(icon,colors,iconcolor,name){

  return Column(
    children: [
      Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),color: colors,
        ),
        child: Icon(icon,color: iconcolor,),

      ),SizedBox(
        height: 3,
      ),Text(name,style: TextStyle(
        fontSize: 13,fontFamily: "Poppins",
      ),)
    ],
  );
}
  @override
  Widget build(BuildContext context) {var w=MediaQuery.of(context).size.width;

    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: theme.themebackground,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(



            width:w,child: Image(image: AssetImage('assets/esevai.jpg'),fit: BoxFit.cover,)),
          SizedBox(height: 20,),
          Container(
            height: 500,
            width: 390,
            decoration: BoxDecoration(

              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Services',style: TextStyle(
                      fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "Poppins"
                  ),),
                ),SizedBox(height: 25,),
                  Align(
                    alignment: Alignment.center,
                    child: Text('"A good government is one that serves its  ',style: TextStyle(
                      fontStyle: FontStyle.italic
                    ),),
                  ),Align(
                    alignment: Alignment.center,
                    child: Text('people with integrity and transparency." ',style: TextStyle(
                        fontStyle: FontStyle.italic
                    ),),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      SizedBox(
                        height: 50,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          GestureDetector(
                            onTap: (){

                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>redirectpage(s:"https://gdp.tn.gov.in/")));

                            },
                            child: getservice(Icons.note,HexColor('#b8ddff'),HexColor('#3d85c6'),'Petitions'),
                          ), SizedBox(
                            height: 40,
                          ),GestureDetector(
                            onTap: (){

                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>redirectpage(s:"https://tnpds.gov.in/")));

                            },
                            child: getservice(Icons.add_card_outlined,HexColor('#fff3b4'),Colors.amber,'Smart Card'),
                          ),



                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          GestureDetector(
                            onTap: (){

                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>redirectpage(s:"https://tnvelaivaaippu.gov.in/Empower/")));

                            },
                            child: getservice(Icons.person_search_outlined,HexColor('#e7ddff'),HexColor('#674ea7'),'Employment'),
                          ),SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                            onTap: (){

                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>redirectpage(s:"https://uidai.gov.in/en/")));

                            },
                            child: getservice(Icons.checklist_rtl,HexColor('#fbc0c0'),Colors.red,'Aadhar'),
                          ),


                        ],
                      ),Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [



                          GestureDetector(
                            onTap: (){

                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>redirectpage(s:"http://eservices.tn.gov.in/eservicesnew/home.html")));

                            },
                            child: getservice(Icons.landscape_outlined,HexColor('#f8cade'),HexColor('#c90076'),'Land services'),
                          ),SizedBox(
                            height: 40,
                          ),GestureDetector(
                            onTap: (){

                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>redirectpage(s:"http://elections.tn.gov.in/")));

                            },
                            child: getservice(Icons.how_to_vote,HexColor('#bbddfb'),HexColor('#2986cc'),'Electoral'),
                          ),


                        ],
                      ),

                    ],
                  ),
                ],
              ),
            ),

          )
        ],
    ),
      ),
    ));
  }
}
