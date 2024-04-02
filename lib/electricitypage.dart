import 'package:flutter/material.dart';
import 'package:nammamadurai/redirect.dart';
import 'reusable/reusable.dart';

class electricitypage extends StatefulWidget {
  const electricitypage({super.key});

  @override
  State<electricitypage> createState() => _electricitypageState();
}

class _electricitypageState extends State<electricitypage> {
  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.themebackground,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [    Container(



              width:w,child: Image(image: AssetImage('assets/electricity1.jpg'),fit: BoxFit.cover,)),
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
                  children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Electricity bill payment',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,fontFamily: "Poppins",fontStyle: FontStyle.normal),),
                  ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(padding: EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [Align(
                          alignment: Alignment.center,
                          child: Text('"Electricity is the lifeblood of modern society, and it is the responsibility of the government to ensure its reliable and affordable supply to all citizens."',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic,fontFamily: "Poppins"),),
                        ),],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Pay your Electricity bills',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w200,fontFamily: "Poppins"),),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('* Payments',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,fontStyle: FontStyle.normal),),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('* Complaints',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,fontStyle: FontStyle.normal),),
                    ),SizedBox(
                      height: 15,
                    ),Align(
                      alignment: Alignment.centerLeft,
                      child: Text('* Know your Service number',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,fontStyle: FontStyle.normal),),
                    ),SizedBox(
                      height: 15,
                    ),Align(
                      alignment: Alignment.centerLeft,
                      child: Text('* Bill calculations',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,fontStyle: FontStyle.normal),),
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [OutlinedButton(onPressed: (){

                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>redirectpage(s:"https://www.tnebnet.org/awp/tariffMaster?execution=e3s1")));

                      },style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 2.0, color: theme.themebackground),shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      ), child: Text('Bill Calculator',style: TextStyle(color: theme.themebackground,fontSize: 17,

                      ),)),
                        OutlinedButton(onPressed: (){

                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>redirectpage(s:"https://www.tnebnet.org/awp/login?locale=en")));

                        },style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 2.0, color: theme.themebackground),shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        ), child: Text('Bill Payment',style: TextStyle(
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
    );
  }
}
