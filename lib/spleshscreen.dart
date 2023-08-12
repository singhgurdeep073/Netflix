
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netflix/Homepages/homepage.dart';
import 'package:netflix/login&reg/login.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:lottie/lottie.dart';

import 'Navigationbar.dart';




class Splesh_screen extends StatefulWidget {
  const Splesh_screen({Key? key}) : super(key: key);

  @override
  State<Splesh_screen> createState() => _Splesh_screenState();
}

class _Splesh_screenState extends State<Splesh_screen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 9),
            ()=>Navigator.push(context,MaterialPageRoute(builder: (context){
              return login();
            }))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


        body:  Center(
          child: Container(height: 750,width: double.infinity,
            decoration: BoxDecoration(
             /* gradient: LinearGradient(colors: [
                Color(0xffF7D6D6),
                Color(0xffACC9A9)
              ])*/
              image: DecorationImage(image: NetworkImage("https://e0.pxfuel.com/wallpapers/653/834/desktop-wallpaper-red-border-amoled-black.jpg"),fit: BoxFit.cover)
           ),
            child: Padding(
              padding:  EdgeInsets.only(top: 108.0),
              child: Column(children:[

                Image.asset("images/MyMovie.png",height: 250,),
                Image.network("https://media.tenor.com/oqJo9GcbfjYAAAAi/welcome-images-server.gif",height: 100,width: 250,fit: BoxFit.cover,),
              ]),
            ),
          ),
        )
    );  }
}
