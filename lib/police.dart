import 'package:flutter/material.dart';
import 'package:nammamadurai/redirect.dart';
import 'main.dart';
import 'reusable/reusable.dart';


class police extends StatefulWidget {
  const police({Key? key}) : super(key: key);

  @override
  State<police> createState() => _policeState();
}

class _policeState extends State<police> {



  @override
  Widget build(BuildContext context) {

    var w=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: theme.themebackground,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [


              Container(



                  width:w,child: Image(image: AssetImage('assets/police1.jpg'),fit: BoxFit.cover,)),
              SizedBox(height: 20,),
              Container(



                height: 500,
                width: 400,

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    )
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Police Service',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,fontFamily: "Poppins",fontStyle: FontStyle.normal),),
                    ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(padding: EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [Align(
                            alignment: Alignment.center,
                            child: Text('"Pride in service, strength in unity, the Madurai Police stand vigilant."',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic,fontFamily: "Poppins"),),
                          ),],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Online Services',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,fontFamily: "Poppins"),),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('* Lost Document Report',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal),),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('* Online Complaints Status',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal),),
                      ),SizedBox(
                        height: 15,
                      ),Align(
                        alignment: Alignment.centerLeft,
                        child: Text('* FIR Status',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal),),
                      ),SizedBox(
                        height: 15,
                      ), Align(
                        alignment: Alignment.centerLeft,
                        child: Text('* Vehicle Status',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal),),
                      ),SizedBox(
                        height: 15,
                      ),Align(
                        alignment: Alignment.centerLeft,
                        child: Text('* Register Online Complaints',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal),),
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [OutlinedButton(onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>redirectpage(s:"https://eservices.tnpolice.gov.in/CCTNSNICSDC/Index?22")));
                        },style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 2.0, color: theme.themebackground),shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        ), child: Text('TN Portal',style: TextStyle(color: theme.themebackground,fontSize: 17,

                        ),)),
                          OutlinedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>redirectpage(s:"https://eservices.tnpolice.gov.in/CCTNSNICSDC/wicket/page?37")));
                          },style: OutlinedButton.styleFrom(
                            side: BorderSide(width: 2.0, color: theme.themebackground),shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                          ), child: Text('Helpline',style: TextStyle(
                              color: theme.themebackground,fontSize: 17
                          ),)),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
