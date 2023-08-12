import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:netflix/Homepages/discover.dart';
import 'package:netflix/Homepages/homepage.dart';

class bottom extends StatefulWidget {
  const bottom({Key? key}) : super(key: key);

  @override
  State<bottom> createState() => _bottomState();
}

class _bottomState extends State<bottom> {
  PageController _pageController=PageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageView(

          controller: _pageController,
          children: <Widget>[
            Demo(),
            NewPage()

          ],
          onPageChanged: (int index) {
            setState(() {

              _pageController.jumpToPage(index);
            });
          }
      ),


      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.easeOutQuint,
        items: <Widget>[
          Icon(Icons.home_filled, size: 25, color: Colors.white,shadows: [BoxShadow(color: Colors.black,blurRadius: 10,)],),
          Icon(Icons.category, size: 25, color: Colors.white,shadows: [BoxShadow(color: Colors.black,blurRadius: 10,)],),
          Icon(Icons.download_sharp, size: 25, color: Colors.white,shadows: [BoxShadow(color: Colors.black,blurRadius: 10,)],),
          Icon(Icons.person, size: 25 , color: Colors.white,shadows: [BoxShadow(color: Colors.black,blurRadius: 10,)],)
        ],
        color: Colors.red,

        backgroundColor: Colors.black,
        height: 70.0,
        onTap: (int index) {
          setState(() {
            _pageController.jumpToPage(index);
          });
        },

      ),
    );
  }
}
