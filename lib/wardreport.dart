





import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'dart:io';
import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nammamadurai/reusable/reusable.dart';
class wardreport extends StatefulWidget {
  const wardreport({super.key});

  @override
  State<wardreport> createState() => _wardreportState();
}
var select =true;




class _wardreportState extends State<wardreport> {

  TextEditingController description=TextEditingController();
String imgurl="";
  final picker = ImagePicker();
  late List<Placemark> placemarks;
  var address;

  var mylongitude;
  var mylatitude;
  FirebaseDatabase database=FirebaseDatabase.instance;

 
  @override
  Widget build(BuildContext context) {

    var w=MediaQuery.of(context).size.width;

    var h=MediaQuery.of(context).size.height;



    uploadimage() async {
      XFile? img=await picker.pickImage(source: ImageSource.camera);
      String imageName = DateTime.now().millisecondsSinceEpoch.toString();
      FirebaseStorage storage=FirebaseStorage.instance;
      Reference ref=storage.ref().child(imageName);
      UploadTask uploadTask=ref.putFile(File(img!.path));
      TaskSnapshot taskSnapshot=await uploadTask;
      imgurl = "https://firebasestorage.googleapis.com/v0/b/nammamadurai-22c18.appspot.com/o/${imageName}?alt=media&token=42b6ccde-c6c9-4380-9761-de9db5760fd4";

print(imgurl);
    }




    getmylocation() async {

      await Geolocator.checkPermission();
      await Geolocator.requestPermission();


      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      mylatitude = position.latitude.toDouble();
      mylongitude = position.longitude.toDouble();


      placemarks = await placemarkFromCoordinates(mylatitude, mylongitude);

      address=placemarks[0].name.toString()+" "+placemarks[0].street.toString()+" "+placemarks[0].locality.toString()+" "+placemarks[0].administrativeArea.toString()+" "+placemarks[0].postalCode.toString();


    }
    saveinfirestore(){


getmylocation().then((value) {

  String timestamp = DateTime.now().millisecondsSinceEpoch.toString();


  Map<String,String> content={
'uid':userinfo.getuid(),
    'name':userinfo.getuser(),
    'lat':mylatitude.toString(),
    'long':mylongitude.toString(),
    'add':address,
    'timestamp':DateTime.now().toString(),
    'url':imgurl,
    'description':description.text.toString(),
    'status':'false'
  };

  DatabaseReference ref=database.ref('grievance');
  ref.push().set(content).then((value) {

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Uploaded Successfully')));
  });
  return value;
});


      }










    getcontent(){

      return select==true?Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(children: [
Align( alignment:Alignment.centerLeft,child: Padding(
  padding: const EdgeInsets.all(10.0),
  child:   Text("Enter Your Grievance",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
)),
            SizedBox(width: 250,child: OutlinedButton(


              style:OutlinedButton.styleFrom(
                side: BorderSide(
                  width: 1.0,
                  color: theme.themebackground,
                  style: BorderStyle.solid,
                ),
              )
             ,
              onPressed: () async {



uploadimage();

              },
              child: Row(mainAxisAlignment:MainAxisAlignment.center,children: [Icon(Icons.image,color:theme.themebackground,),SizedBox(width: 10,),Text("Upload",style: TextStyle(color: theme.themebackground),)],),
            ),),




            SizedBox(height: 10,),
           Padding(
             padding: const EdgeInsets.all(10.0),
             child: SizedBox(
               width: 400,
               child: TextField(
                 controller: description,
                 cursorColor: theme.themebackground,
                 maxLines: 5, // <-- SEE HERE
                 minLines: 1,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: HexColor('#DADADA'),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(5))
                        ),


          contentPadding: EdgeInsets.symmetric(vertical: 40,horizontal: 20),

                        hintText: "  Enter Your Grievance",

                        hintStyle: TextStyle(color: Colors.grey)


                    ),




                  ),
             ),
           ),


            SizedBox(width: 250,child: ElevatedButton(

              style: ElevatedButton.styleFrom(backgroundColor: theme.themebackground),
              onPressed: () async {

if(description.text.toString().isNotEmpty){
saveinfirestore();


}else{

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Text Field is Empty")));

}


              },
              child: Row(mainAxisAlignment:MainAxisAlignment.center,children: [Icon(Icons.edit,color: Colors.white,),Text("Add Grievance",style: TextStyle(color: Colors.white),)],),
            ),)

          ],),
        ),
      ):Expanded(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(

            height: h,
            child: FirebaseAnimatedList(
              query:database.ref().child('grievance') ,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {


                Map rowvalue=snapshot.value as Map;
                rowvalue['key']=snapshot.key;


                return Card(
                  elevation: 10,
                  child:   Container(
                    padding: EdgeInsets.all(10),

                    child: Column(children: [
                      Image( image: NetworkImage(rowvalue['url']),),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child:   Column(

                          crossAxisAlignment: CrossAxisAlignment.start,

                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [Text('Name : ${rowvalue['name']}'),

                            Text('Lat : ${rowvalue['lat']}'),

                            Text('Long : ${rowvalue['long']}'),

                            Text('Address : ${rowvalue['add']}'),

                            Text('Description : ${rowvalue['description']}'),

                          ],),
                      ),


                      Icon(Icons.check_circle,color: rowvalue['status']=='true'?Colors.green:Colors.amber,)

                    ],),),
                );
              },
            ),
          ),
        ),
      );
    }

    return SafeArea(child: Scaffold(

      appBar: AppBar(backgroundColor:theme.themebackground,title: const Text("Grievance"),),

      body: Column(children: [

      Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10)

          ),



          height: 40,
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              SizedBox(
                width: (w-40)/2,
                child: TextButton(onPressed: (){

                  setState(() {
                    select=true;
                  });






                },style: TextButton.styleFrom(

                    backgroundColor:select==true?theme.themebackground:Colors.transparent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))

                ), child: Text("Add Grievance",style: TextStyle(color: select==true?Colors.white:Colors.black,fontSize: 15),)),
              ),
              SizedBox(
                width: (w-40)/2,child:    TextButton(onPressed: (){
                setState(() {
                  select=false;
                });
              },style: TextButton.styleFrom(

                  backgroundColor:select==false?theme.themebackground:Colors.transparent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))

              ), child: Text("My Grievance",style: TextStyle(color: select==false?Colors.white:Colors.black,fontSize: 15),)),)

            ],),


        ),
      ),
     getcontent(),











    ],),));
  }



 }
