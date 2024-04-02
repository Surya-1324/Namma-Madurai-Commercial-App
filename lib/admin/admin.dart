import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nammamadurai/reusable/reusable.dart';
class adminpage extends StatefulWidget {
  const adminpage({super.key});

  @override
  State<adminpage> createState() => _adminpageState();
}

class _adminpageState extends State<adminpage> {
TextEditingController notification=TextEditingController();


saveinfirestore(){




    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();




    DatabaseReference ref=FirebaseDatabase.instance.ref('notification');
    ref.push().set({'notification':notification.text.toString()}).then((value) {

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Uploaded Successfully')));
    });



}
int index=0;
  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    FirebaseDatabase database=FirebaseDatabase.instance;
    return Scaffold(appBar: AppBar(

      backgroundColor: theme.themebackground,
      title: Text("Dashboard"),
    ),
    body:index==0?Column(children: [
Text("Grievance",style: TextStyle(color: Colors.white),),
    Expanded(
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


                  SizedBox(width: 200 ,child: ElevatedButton(onPressed: () {

                 FirebaseDatabase database=FirebaseDatabase.instance;
                 database.ref().child('grievance').root.child('').update({'status':'true'});

                  },style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),

                    backgroundColor: theme.themebackground,

                  ),

                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(FontAwesomeIcons.edit,color: Colors.white),SizedBox(width: 10,),Text("Change",style: TextStyle(color: Colors.white),)],),)),

                ],),),
            );
          },
        ),
      ),
    ),
    )

    ],) :Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(children: [

        Text("Send Notification",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),

      Padding(
      padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: 400,
          child: TextField(
            controller:notification,
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

                hintText: "  Notification",

                hintStyle: TextStyle(color: Colors.grey)


            ),




          ),
        ),
      ),


      SizedBox(width: 250,child: ElevatedButton(

      style: ElevatedButton.styleFrom(backgroundColor: theme.themebackground),
      onPressed: () async {

saveinfirestore();

      },
      child: Row(mainAxisAlignment:MainAxisAlignment.center,children: [Icon(Icons.send,color: Colors.white,),Text("send",style: TextStyle(color: Colors.white),)],),
      ),)

      ,]),
    ),


    bottomNavigationBar: BottomNavigationBar(
      currentIndex: index,
      onTap: ( i){

        setState(() {
          index=i;
        });
      },

        selectedItemColor:theme.themebackground ,

        type: BottomNavigationBarType.fixed,

        items:
        [


          BottomNavigationBarItem(icon: Icon(Icons.home_outlined,),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications,),label: "Notification"),
        ]
    )

    );
  }
}
