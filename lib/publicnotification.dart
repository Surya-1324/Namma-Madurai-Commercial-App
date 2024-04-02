import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:nammamadurai/reusable/reusable.dart';


class publicnotification extends StatefulWidget {
  const publicnotification({super.key});

  @override
  State<publicnotification> createState() => _publicnotificationState();
}

class _publicnotificationState extends State<publicnotification> {
  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    FirebaseDatabase database=FirebaseDatabase.instance;
    return Scaffold(

      appBar: AppBar(title: Text('Notification'),backgroundColor: theme.themebackground,),

      body: Column(children: [

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(

              height: h,
              child: FirebaseAnimatedList(

                query:database.ref('notification') ,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  Map rowvalue = snapshot.value as Map;
                  rowvalue['key'] = snapshot.key;
                  return Card(
                      elevation: 10,
                      child: Container(
                          padding: EdgeInsets.all(20), child: Column(children: [


                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Notification", style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),)),
                        SizedBox(height: 10,),

                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(rowvalue['notification']))


                      ])
                      ));
                } )
            ),
          ),
        )
      ],),
    );
  }
}
