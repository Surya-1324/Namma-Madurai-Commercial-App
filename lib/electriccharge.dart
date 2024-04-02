import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'main.dart';
import 'reusable/reusable.dart';

class echarge extends StatefulWidget {
  const echarge({Key? key}) : super(key: key);

  @override
  State<echarge> createState() => _echargeState();
}

class _echargeState extends State<echarge> {
  late GoogleMapController mapcontroller;
  @override
  void dispose(){

mapcontroller.dispose();
super.dispose();



  }
  @override

  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
  gettourismcard(tourismname,imagepath,tourismaddress,link){



    return Container(
        height: 555,
        width: w,
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(20),
        ),
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(padding: EdgeInsets.all(10),child: Column(
            children: [
              Container(

                  height: 450,
                  width: 390,
                  child:ClipRect(

                    child: GoogleMap(
                        markers: {
                          const Marker(
                            markerId: MarkerId('Sydney'),
                            position: LatLng(9.945861397835984, 78.14160257613972),
                          )
                        },initialCameraPosition: CameraPosition(
                      target: LatLng(9.9252, 78.1198),
                      zoom: 5,

                    ),


                      onMapCreated: (GoogleMapController controller){
                     mapcontroller=controller;
                      },

                    ),
                  )
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Align(
                      alignment: Alignment.centerLeft,
                      child: Text(tourismname,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
                    ),SizedBox(
                      height: 10,
                    ),Align(
                      alignment: Alignment.topLeft,
                      child: Text(tourismaddress,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300),),
                    ),],
                  ),

                 OutlinedButton(onPressed: (){},style: OutlinedButton.styleFrom(
                   side: BorderSide(width: 2.0, color: theme.themebackground),shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(30)
                 ),
                 ), child: Text('Book Slot',style: TextStyle(
                     color: theme.themebackground,fontSize: 17
                 ),))
                ],
              )
            ],
          ),),
        )
    );
  }
    return SafeArea(child: Scaffold(appBar: AppBar(
      title: Text("E-Charging Ports"),
      backgroundColor: theme.themebackground,
    ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(15),child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            gettourismcard('Zeon Charging Station','','Chinna Chokikulam, Madurai',''),SizedBox(
              height: 20,
            ),
            gettourismcard('MG Tata Charging Station','','Uchapatti,Thirumangalam, Madurai','')
,SizedBox(
              height: 20,
            ),
            gettourismcard('Kaveri Auto Garage','','Paravai Bit 1 Village, Madurai','')
,SizedBox(
              height: 20,
            ),
            gettourismcard('PPS Tata Motor CS','','Nilaiyur First Bit, Madurai','')
,SizedBox(
              height: 20,
            ),
            gettourismcard('Taj Gateway charging station','','Pasumalai, Madurai','')

          ],
        ),),
      ),
    ));
  }
}
