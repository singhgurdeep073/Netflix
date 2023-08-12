
import 'package:flutter/material.dart';
import 'package:netflix/Navigationbar.dart';
import 'package:netflix/Homepages/homepage.dart';
import 'package:netflix/login&reg/login.dart';
import 'package:netflix/login&reg/loginwith.dart';
import 'package:netflix/login&reg/registation.dart';
import 'package:netflix/spleshscreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class pageview extends StatefulWidget {
  const pageview({Key? key}) : super(key: key);

  @override
  State<pageview> createState() => _pageviewState();
}
bool onlatepage = false;
PageController _cont= PageController();
class _pageviewState extends State<pageview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
          children:[
            PageView(
              controller: _cont,
              onPageChanged: (index){
                setState(() {
                  onlatepage=(index==2);
                });
              },
              children: [
               registation(),
                signinbutton(),
                Splesh_screen(),
              ],
            ),
            Container(
                alignment: Alignment(0,0.95,),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: (){
                          _cont.jumpToPage(1);

                        },
                        child: Text("Skip",style: TextStyle(color: Colors.white,fontSize: 20),)
                    ),

                    SmoothPageIndicator(controller: _cont, count: 3),
                    onlatepage?
                    GestureDetector(
                      onTap:(){
                        Navigator.push(context,MaterialPageRoute(builder: (context){
                          return bottom();
                        }));
                      },
                      child: Text("Done",style: TextStyle(color: Colors.white,fontSize: 20),),
                    ):
                    GestureDetector(
                      onTap:(){
                        _cont.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                      },
                      child: Text("Next",style: TextStyle(color: Colors.white,fontSize: 20),),
                    )


                  ],
                ))
          ] ),
    );
  }
}
