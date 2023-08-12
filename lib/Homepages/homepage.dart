import 'package:carousel_slider/carousel_slider.dart';
import 'package:netflix/Navigationbar.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';
import 'package:netflix/apis/Category/subcat.dart';
import 'package:netflix/login&reg/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Homepages/discover.dart';
import 'package:netflix/Homepages/homepage2.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import '../apis/Countryapi/api1.dart';
import '../apis/Category/category.dart';
import '../apis/Slider/Detail.dart';
import '../apis/Slider/slidercat.dart';
import '../apis/Slider/sliderpro.dart';
import '../apis/Slider/slidersubcat.dart';
import '../login&reg/registation.dart';
import '../main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class NetFlix{
  final String img;
  final String name;
  final String dis;
  final String text;
  NetFlix( {required this.name,required this.img,required this.dis,required this.text});

}
class Cat{
  final String text;
  Cat( {required this.text});

}
class slider{
  final String img;
  slider({ required this.img});
}

class Demo extends StatefulWidget {

  const Demo({Key? key,}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}


class _DemoState extends State<Demo> {
  Future<List<SliderPro>> fetchDatapro(sid) async{
    var url=Uri.parse("http://www.paji.store/WebService1.asmx/SliderProduct?id=$sid");
    final responce=await http.get(url);
    if(responce.statusCode==200){
      List listresponce=json.decode(responce.body);
      return listresponce.map((data) => SliderPro.FromJson(data)).toList();
    }
    else{
      throw Exception('Unexpected error occured!');
    }


  }
  Future<List<Catid>> fetchData() async{
    var url=Uri.parse("http://www.paji.store/WebService1.asmx/Category?");
    final responce=await http.get(url);
    if(responce.statusCode==200){
      List listresponce=json.decode(responce.body);
      return listresponce.map((data) => Catid.FromJson(data)).toList();
    }
    else{
      throw Exception('Unexpected error occured!');
    }


  }
  Future<void> clearSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('username');
    prefs.remove('password');
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => login()));
  }
  List<NetFlix>img=[
    NetFlix(name: "The Guilty", img: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQpNyAkvB7yWU-_rDRwn2sNyaZURoZDqXzS390t1ZDRrVXNRs2O",dis: "A troubled police detective demoted to 911 operator duty scrambles to save a distressed caller during a harrowing day of revelations -- and reckonings."
 " \nInitial release: 11 September 2021"
 " \nDirector: Antoine Fuqua"
 "Cinematography: Maz Makhani"
  "Costume design: Daniel Orlandi"
 "Distributed by: Netflix"
  "Editor: Jason Ballantine",text: "All"),
    NetFlix(name: "The Pale Blue Eye", img: "https://upload.wikimedia.org/wikipedia/en/0/07/The_Pale_Blue_Eye_poster.jpg",dis: "The Pale Blue Eye is a 2022 American mystery thriller film written and directed by Scott Cooper,[2] adapted from the 2006 novel of the same name by Louis Bayard.[3] The film features an ensemble cast that includes Christian Bale, Harry Melling, Gillian Anderson, Lucy Boynton, Charlotte Gainsbourg, Toby Jones, Harry Lawtey, Simon McBurney, Timothy Spall, and Robert Duvall. Its plot follows veteran detective Augustus Landor in 1830 West Point, New York, as he investigates a series of murders at the United States Military Academy with the aid of Edgar Allan Poe, a young military cadet.",text: ""
       ),
    NetFlix(
        name: "Jung_E", img: "https://upload.wikimedia.org/wikipedia/en/7/7c/Jung_E.jpg",dis: "Jung_E (Korean: 정이), stylised as JUNG_E, is a 2023 South Korean science fiction film written and directed by Yeon Sang-ho, starring Kang Soo-yeon, Kim Hyun-joo and Ryu Kyung-soo.[4] The film features the final film appearance of Kang Soo-yeon who died ahead of its release.[5] It premiered on January 20, 2023 on Netflix.[6]",text: "" ),
    NetFlix(
        name: "True Spirit", img: "https://upload.wikimedia.org/wikipedia/en/3/3b/True_Spirit_film_poster.jpg",dis: "True Spirit is a 2023 Australian biographical drama film directed by Sarah Spillane and written by Spillane, Cathy Randall, and Rebecca Banner.[1] The film is based on the 2010 memoir of the same name by Jessica Watson, played by Teagan Croft. She is an Australian sailor who was awarded the Order of Australia Medal after attempting a solo global circumnavigation at the age of 16.[2][3] The film was made available for streaming on Netflix on 3 February 2023.[4]",text: ""   ),

  ];
  List<Cat>text=[

    Cat(text: "All"),
    Cat(text: "Kids"),
    Cat(text: "Movie"),
    Cat(text: "Series"),
    Cat(text: "T.V"),
    Cat(text: "Others"),


  ];
  List<slider>slide=[
    slider(img: "https://i.ytimg.com/vi/2fuowcxdrYc/maxresdefault.jpg"),
    slider(img: 'https://i.ytimg.com/vi/ZU9ZtlkSnnE/maxresdefault.jpg'),
    slider(img: "https://i.ytimg.com/vi/nuSMGtZhsAc/maxresdefault.jpg")

  ];

  Future<void> setLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);
  }

  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Drawer(
        width: 200,

        shape: BeveledRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(95)),
            side: BorderSide(strokeAlign: Checkbox.width,
            color: Colors.grey,style:BorderStyle.solid)),
    backgroundColor: Colors.grey.shade400,
        child:  ListView(
          children: <Widget>[
            Container(height: 170,width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage("https://help.nflxext.com/0af6ce3e-b27a-4722-a5f0-e32af4df3045_what_is_netflix_5_en.png"),fit: BoxFit.cover)
            ),
            child: Column(
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 120.0),
                  child: CircleAvatar(
                  backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                    radius: 30,),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Gurdeep",style: TextStyle(color: Colors.white)),
                          Text("gurdeep1234@gmail.com",style: TextStyle(color: Colors.white),)
                        ],
                      ),
                    ),

                  ],
                ),
              ],
            ),
            ),

            new ListTile(

              title: new Text(
                'Profile & Security',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              onTap: () {

                Navigator.pop(context);
              },
              leading: new Icon(
                Icons.person,
                size: 26.0,
                color: Colors.black,
              ),
            ),
            new ListTile(
              title: new Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              onTap: () {

                Navigator.pop(context);
              },
              leading: new Icon(
                Icons.notifications,
                size: 26.0,
                color: Colors.black,
              ),
            ),
            new ListTile(
              title: new Text(
                'Favorites',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              onTap: () {

                Navigator.pop(context);
              },
              leading: new Icon(
                Icons.favorite,
                size: 26.0,
                color: Colors.black,
              ),
            ),
            new Divider(
              color: Colors.black38,
            ),
            new ListTile(
              title: new Text(
                'About WelakaOne',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              onTap: () {

              },
              leading: new Icon(
                Icons.info_outline,
                size: 26.0,
                color: Colors.black,
              ),
            ),
            new Divider(
              color: Colors.black38,
            ),
            new ListTile(

              title: new Text(
                'Close Menu',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              onTap: () {

                Navigator.pop(context);
              },
              leading: new Icon(
                Icons.close,
                size: 26.0,
                color: Colors.black,
              ),
            ),
      Padding(
        padding: const EdgeInsets.only(),
        child: Container(
          color: Colors.black87,
          child: ListTile(
            onTap: () {
              clearSession();
            },
            title:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              new Text(
                'Log Out',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              new Icon(
                Icons.logout,
                size: 26.0,
                color: Colors.white,
              ),

            ],),
          ),),)],),
      ),
      backgroundColor: Colors.black,
      body:
          CustomScrollView(
             scrollDirection: Axis.vertical,
             slivers:[
               SliverAppBar(
                 actions: [
                   IconButton(onPressed: (){}, icon:
                   Icon(Icons.new_releases_rounded,color: Colors.white,),
                   ),
                   IconButton(
                     onPressed: (){}, icon:  Icon(Icons.notifications,shadows: [BoxShadow(color: Colors.red.shade200,blurRadius: 6,offset: Offset(2,2))],color: Colors.white,),),
                   IconButton(
                     onPressed: (){
/*
                     Navigator.push(context, MaterialPageRoute(builder: (context){
                       return MyHomePage();
                     }));
*/
                   }, icon:Icon(Icons.search,color: Colors.white,shadows: [BoxShadow(color: Colors.red.shade200,blurRadius: 6,offset: Offset(2,2))]),
                   ),
                 ],iconTheme: IconThemeData(color: Colors.black,size: 27),
                 expandedHeight: 170,
                 backgroundColor: Colors.red[500],


                 floating: false,
                 pinned: true,
                 flexibleSpace: FlexibleSpaceBar(
                   background:Container(
decoration: BoxDecoration(
  image: DecorationImage(fit: BoxFit.cover,
  image: NetworkImage("https://i.pinimg.com/originals/a4/59/e5/a459e5a81b288ebecb680f7d08c633db.gif"),
    colorFilter: new ColorFilter.mode(Colors.redAccent.withOpacity(1.0), BlendMode.softLight),
  )
),
/*
                  child: Image.network("https://i.pinimg.com/originals/a4/59/e5/a459e5a81b288ebecb680f7d08c633db.gif",fit: BoxFit.cover,),
*/

                   ),
/*
                   title: Text("My Movies",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,shadows: [BoxShadow(color: Colors.red.shade100,blurRadius: 13)]),),
*/
                 ),
               ),

               SliverToBoxAdapter(
                 child: Column(
                   children: [
                     Padding(
                       padding:  EdgeInsets.only(right: 250.0,top: 5),
                       child: Text("Category",style: TextStyle(color: Colors.white,wordSpacing: 3,fontSize: 17),),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top: 8.0,left: 10),
                       child: Container(
                         height: 150,
                         width: double.infinity,
                         child: FutureBuilder<List<Catid>>(
                             future: fetchData(),
                             builder: (context,abc){
                               if(abc.hasData){
                                 return  ListView.builder(
                                     itemCount: abc.data!.length,

                                     scrollDirection: Axis.horizontal,
                                     itemBuilder: (BuildContext context,int len){
                                       return InkWell(
                                         onTap: (){
                                           Navigator.push(context,MaterialPageRoute(builder: (context){
                                             return Subcat(id:abc.data![len].id.toString()  );
                                           }));

                                         },
                                         child: Column(children: [

                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.network(abc.data![len].img,height: 100,),
                                          ),
                                           Center(child:Text(abc.data![len].name,style: TextStyle(color: Colors.white),))

                                         ],),
                                       );

                                     });
                               }
                               else if(abc.hasError){
                                 return Text(abc.error.toString());

                               }
                               return const CircularProgressIndicator(
                                 color: Colors.black87,
                               );
                             }

                         ),
                       ),
                     ),
                   ],
                 ),
               ),
               SliverToBoxAdapter(
                 child: Column(
                   children: [
                     Padding(
                       padding:  EdgeInsets.only(right: 200.0),
                       child: Text("New Avaliable",style: TextStyle(color: Colors.white,wordSpacing: 3,fontSize: 17),),
                     ),
                     Container(
                       height: 200,
                       width: 350,

                       child: FutureBuilder<List<SliderPro>>(
                           future: fetchDatapro(""+1.toString()),
                           builder: (context,abc){
                             if(abc.hasData){
                               return
                                 CarouselSlider.builder(
                                   itemCount: abc.data!.length,
                                   itemBuilder: (BuildContext context, int index, int realIndex) {
                                     return InkWell(
                                         onTap: (){
                                           Navigator.push(context, MaterialPageRoute(builder:(context){
                                             return SliderDetail(id:abc.data![index].id,img: abc.data![index].img,Dis: abc.data![index].Dis,price: abc.data![index].price,name: abc.data![index].proname,);
                                           }));
                                         },
                                         child: Padding(
                                           padding: const EdgeInsets.only(right:3,left: 3),
                                           child: Image.network(abc.data![index].img, fit: BoxFit.cover),
                                         ));
                                   },
                                   options: CarouselOptions(
                                     height: 150,
                                     aspectRatio: 9 / 9,
                                     viewportFraction: .8,
                                     initialPage: 1,
                                     enableInfiniteScroll: true,
                                     autoPlay: true,
                                   ),
                                 );


                             }
                             else if(abc.hasError){
                               return Text(abc.error.toString());

                             }
                             return const CircularProgressIndicator(
                               color: Colors.black,backgroundColor: Colors.black87,
                             );
                           }

                       ),
                     ),


                     //Slider Container properties

                   ],
                 ),
               ),
               SliverToBoxAdapter(
                 child: Container(
                   margin: EdgeInsets.only(left: 10),
                   height: 52,
                   child: GridView.builder(
                       itemCount: text.length,
                       scrollDirection: Axis.horizontal,
                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1), itemBuilder:(context,index){
                     return Center(child: InkWell(
                         onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context){
                             return NewPage();
                           }));
                         },
                         child: Text(text[index].text,style: TextStyle(fontSize: 16,color: Colors.white),)));
                   }),
                 ),
               ),
               SliverToBoxAdapter(
                 child:
                 Padding(
                   padding: const EdgeInsets.only(top: 8.0,left: 10),
                   child: Container(
                     height: 150,
                     width: double.infinity,
                     child: FutureBuilder<List<Catid>>(
                         future: fetchData(),
                         builder: (context,abc){
                           if(abc.hasData){
                             return  ListView.builder(
                                 itemCount: abc.data!.length,

                                 scrollDirection: Axis.horizontal,
                                 itemBuilder: (BuildContext context,int len){
                                   return InkWell(
                                     onTap: (){
                                       Navigator.push(context,MaterialPageRoute(builder: (context){
                                         return Subcat(id:abc.data![len].id.toString()  );
                                       }));

                                     },
                                     child: Column(children: [

                                       Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: Image.network(abc.data![len].img,height: 100,),
                                       ),
                                       Center(child:Text(abc.data![len].name,style: TextStyle(color: Colors.white),))

                                     ],),
                                   );

                                 });
                           }
                           else if(abc.hasError){
                             return Text(abc.error.toString());

                           }
                           return const CircularProgressIndicator(
                             color: Colors.black87,
                           );
                         }

                     ),
                   ),
                 ),
                 /* Column(children: [
                   */
                 /*
                   SizedBox(height: 10,)
                 ],),*/
               ),
               SliverToBoxAdapter(
                 child: Column(
                   children: [

                     Padding(
                       padding:  EdgeInsets.only(right: 150.0),
                       child: Text("Top Treanding Movies",style: TextStyle(color: Colors.white,wordSpacing: 3,fontSize: 17),),
                     ),
                     Container(height: 130,
                       child:
                       GridView.builder(
                           scrollDirection: Axis.horizontal,
                           itemCount: img.length,
                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                             crossAxisCount: 1,
                             mainAxisSpacing: 10.0, // Spacing between rows
                             crossAxisSpacing: 10.0, // Number of columns
                             childAspectRatio: 1.0,
                           ), itemBuilder:(context,index){
                         return Column(
                           children: [
                             Card(
                               color: Colors.black,
                               child: InkWell(
                                 onTap: (){
                                   Navigator.push(context,MaterialPageRoute(builder: (context){
                                     return home2(pos:index,img: img[index].img,name: img[index].name,dis: img[index].dis,text: img[index].text,);
                                   }));
                                   /* Navigator.pushNamed(context, '/home2');*/
                                 },
                                 child: Column(children:[

                                   Container(
                                       height: 100,
                                       child: Image.network(img[index].img)),
                                   Text(img[index].name,style: TextStyle(color: Colors.white),),

                                 ]),),),],);}),),],),),
               SliverToBoxAdapter(
                 child: Column(
                   children: [

                     Padding(
                       padding:  EdgeInsets.only(right: 150.0),
                       child: Text("Top Treanding Series",style: TextStyle(color: Colors.white,wordSpacing: 3,fontSize: 17),),
                     ),
                     Container(height: 130,
                       child:
                       GridView.builder(
                           scrollDirection: Axis.horizontal,
                           itemCount: img.length,
                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                             crossAxisCount: 1,
                             mainAxisSpacing: 10.0, // Spacing between rows
                             crossAxisSpacing: 10.0, // Number of columns
                             childAspectRatio: 1.0,
                           ), itemBuilder:(context,index){
                         return Column(
                           children: [
                             Card(
                               color: Colors.black,
                               child: InkWell(
                                 onTap: (){
                                   Navigator.push(context,MaterialPageRoute(builder: (context){
                                     return home2(pos:index,img: img[index].img,name: img[index].name,dis: img[index].dis,text: img[index].text,);
                                   }));
                                   /* Navigator.pushNamed(context, '/home2');*/
                                 },
                                 child: Column(children:[

                                   Container(
                                       height: 100,
                                       child: Image.network(img[index].img)),
                                   Text(img[index].name,style: TextStyle(color: Colors.white),),

                                 ]),),),],);}),),
                   ],
                 ),
               ),




           ]),

      );

  }
}
