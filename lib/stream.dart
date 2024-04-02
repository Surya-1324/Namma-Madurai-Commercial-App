import 'package:flutter/material.dart';
import 'package:nammamadurai/redirect.dart';
import 'electricity.dart';
import 'main.dart';
import 'reusable/reusable.dart';
import 'package:hexcolor/hexcolor.dart';

class stream extends StatefulWidget {
  const stream({Key? key}) : super(key: key);

  @override
  State<stream> createState() => _streamState();
}

class _streamState extends State<stream> {


  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    gettourismcard(tourismname,imagepath,tourismaddress,link){



      return Container(
          height: 490,
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

                    height: 250,
                    width: 390,
                    child: ClipRRect(
                      child: Image(image: AssetImage(imagepath),fit: BoxFit.fill,
                    ),)
                ),
                SizedBox(height: 15,),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [



                          Align(
                          alignment: Alignment.centerLeft,
                          child: SingleChildScrollView(child: Text(tourismname,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),)),
                        ),SizedBox(
                          height: 10,
                        ),SingleChildScrollView(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: SingleChildScrollView(child: Text(tourismaddress,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300),)),
                          ),
                        ),SizedBox(
                            height: 10,
                          ),Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            OutlinedButton(onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>redirectpage(s:"link")));
                              },style: OutlinedButton.styleFrom(
                              side: BorderSide(width: 2.0, color: theme.themebackground),shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)
                            ),
                            ), child: Text('View more',style: TextStyle(
                                color: theme.themebackground,fontSize: 15
                            ),)),
                          ],
                        )],

                      ),
                    ),



              ],
            ),),
          )
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Streams'),
          backgroundColor: theme.themebackground,
        ),
        body: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              gettourismcard('விதிமீறல்கள் உள்ளதா?','assets/news1.jpg','மதுரை மாவட்ட போக்குவரத்து இணை ஆணையர் உத்தரவின் மதுரையில் பள்ளி மாணவர்களை அழைத்து வரும் ஆட்டோக்கள் மீதான சிறப்பு வாகன தணிக்கை நடந்தது','https://www.dailythanthi.com/News/State/are-there-any-violations-inspection-of-autos-of-school-students-1027810'),SizedBox(
                height: 20,
              ),
              gettourismcard('அம்மன் கோவில்களில் சிறப்பு வழிபாடு','assets/news2.jpg','ஆடி கடைசி வெள்ளியான இன்று அம்மன் கோவில்களில் சிறப்பு வழிபாடு நடந்தது,திரளான பக்தர்கள் சாமி தரிசனம் செய்தனர்','https://www.maalaimalar.com/news/district/madurai-news-special-worship-in-goddess-temples-648422'),SizedBox(
                height: 20,
              ),
              gettourismcard('ஓய்வூதியர் சங்கத்தினர் ஆர்ப்பாட்டம்','assets/news4.png','மதுரை மாவட்டம் வாடிப்பட்டி வட்டக் கிளை தமிழ்நாடு அரசு அனைத்து துறை ஓய்வூதியர் சங்கம் சார்பாக தாலுகா அலுவலகம் முன்பு ஆர்ப்பாட்டம் நடந்தது','https://www.maalaimalar.com/news/district/madurai-news-protest-by-pensioners-association-648393?infinitescroll=1'),SizedBox(
                height: 20,
              ),
              gettourismcard('முத்திரையிடப்படாத எடையளவைகள் பறிமுதல்','assets/news5.png','சிவகங்கை மாவட்ட தொழிலாளர் உதவி ஆணையர் முத்து தெரிவித்தார்.','https://media.maalaimalar.com/h-upload/2023/08/11/1930622-svglabourph-01.webp'),SizedBox(
                height: 20,
              ),
            ],
          ),),
        ),

    ));
  }
}
