import 'package:flutter/material.dart';
import 'reusable/reusable.dart';

class tourismpage extends StatefulWidget {
  const tourismpage({super.key});

  @override
  State<tourismpage> createState() => _tourismpageState();
}

class _tourismpageState extends State<tourismpage> {

  gettourismcard(tourismname,imagepath,tourismaddress,link){



    return Container(
        height: 270,
        width: 300,
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

                  height: 180,
                  width: 300,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15)
                    ),child: Image(image: AssetImage(imagepath),fit: BoxFit.fill,
                  ),)
              ),
              SizedBox(height: 15,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(tourismname,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
              ),SizedBox(
                height: 6,
              ),Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(tourismaddress,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300),),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.location_on),color: theme.themebackground,iconSize: 25,padding: EdgeInsets.zero,constraints: BoxConstraints(),)

                ],
              )
            ],
          ),),
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: theme.themebackground,

          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 23),
              child: Column(
                children: [

                  Container(
                    height: 160,
                    width: 390,
                    child: Image.asset('assets/mdu6.jpg'),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Container(
                      child: Padding(padding: EdgeInsets.only(top: 20,left: 20,right: 20),child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Tourism',style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.bold,fontSize: 23,),),
                          ),SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text('"Madurai - Where histoey whispers through',style: TextStyle(fontSize: 15,fontStyle: FontStyle.italic),),
                              ),Align(
                                alignment: Alignment.center,
                                child: Text('its magnificent temples , heritage and vibrant',style: TextStyle(fontSize: 15,fontStyle: FontStyle.italic),),
                              ),Align(
                                alignment: Alignment.center,
                                child: Text('streets"',style: TextStyle(fontSize: 15,fontStyle: FontStyle.italic),),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Align(
                              alignment: Alignment.topLeft,
                              child: Text('Temples',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,fontFamily: "Poppins"),),
                            ),TextButton(onPressed: (){}, child: Text('View All',style: TextStyle(color: theme.themebackground),))],
                          ),
                          Divider(
                            height: 3,color: Colors.black,
                          ),SizedBox(
                            height: 12,
                          ),
                          Container(
                            height: 280,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                gettourismcard(' Sri Meenakshi Sundareswarar Temple','assets/meen.jpg',' Southern bank of madurai, Madurai',""),
                                SizedBox(
                                  width: 10,
                                ),gettourismcard(' ThirupparanKundram Murugan Temple','assets/thiru.jpg',' Thiruparankundram, Madurai',""),
                                SizedBox(
                                  width: 10,
                                ),gettourismcard(' Azhagar Kovil','assets/alagar.jpg',' Alagar Kovil Main Rd, Madurai',""),
                                SizedBox(
                                  width: 10,
                                ),
                                gettourismcard(' Teppakulam Maariamman Kovil','assets/thepam.jpg',' Meenakshi Nagar, Madurai',""),
                                SizedBox(
                                  width: 10,
                                ),gettourismcard(' Pazhamudhircholai Murugan Temple','assets/palam.jpg',' Alagar Hills R.F, Madurai',""),
                                SizedBox(
                                  width: 10,
                                ),gettourismcard(' Shri Koodal Azhagar Temple','assets/koodal.jpg',' Near Periyar Bus Stand, Madurai',""),
                                SizedBox(
                                  width: 10,
                                ),gettourismcard(' Thiruvathavur Sivan Temple','assets/thiruv.jpg',' Thiruvathavur, Madurai',""),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Align(
                              alignment: Alignment.topLeft,
                              child: Text('Others',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,fontFamily: "Poppins"),),
                            ),TextButton(onPressed: (){}, child: Text('View All',style: TextStyle(color: theme.themebackground),))],
                          ),
                          Divider(
                            height: 3,color: Colors.black,
                          ),SizedBox(
                            height: 12,
                          ),Container(
                            height: 280,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                gettourismcard(' Thirumalai Nayak Palace','assets/thirumalai.jpg',' Panthadi 1st St, Mahal Area, Madurai',""),
                                SizedBox(
                                  width: 10,
                                ),gettourismcard(' Gandhi Memorial Museum','assets/gandhi.jpg',' Collector Office Rd, Madurai',""),
                                SizedBox(
                                  width: 10,
                                ),gettourismcard(' Keeladi Museum','assets/keel.jpg',' Excavation Site, Keeladi, Madurai',""),
                                SizedBox(
                                  width: 10,
                                ),
                                gettourismcard(' Yanaimalai','assets/otk.jpg',' Y.Othakadai, Madurai',""),
                                SizedBox(
                                  width: 10,
                                ),gettourismcard(' Aayiram Kaal Mandapam','assets/kaal.jpg',' Near Meenakshi Temple, Madurai',""),
                                SizedBox(
                                  width: 10,
                                ),gettourismcard(' Samanar Hills','assets/saman.jpg',' Near Keelakuyilkudi, Madurai',""),
                                SizedBox(
                                  width: 10,
                                ),gettourismcard(' Kutladampatti Falls','assets/falls.jpg',' Near Vadipatti, Madurai',""),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),SizedBox(
                            height: 20,
                          ),
                        ],
                      ),)
                  )

                ],
              ),
            ),
          )
      ),
    );
  }
}
