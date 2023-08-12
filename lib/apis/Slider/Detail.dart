import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class SliderDetail extends StatefulWidget {
  final int id;
  final String name;
  final String img;
  final String price;
  final String Dis;
  const SliderDetail({Key? key, required this.id, required this.name, required this.img, required this.price, required this.Dis,}) : super(key: key);

  @override
  State<SliderDetail> createState() => _SliderDetailState();
}

class _SliderDetailState extends State<SliderDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        body: Container(
          height: 750,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage("https://e0.pxfuel.com/wallpapers/239/17/desktop-wallpaper-iphone7-blue-space-gradation-blur-black-blur-thumbnail.jpg"),fit: BoxFit.cover)
          ),
          child: Column(children: [

            Padding(
              padding:  EdgeInsets.only(left: 8.0,top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Details",style: TextStyle(color: Colors.white,fontSize: 30),),
/*
                IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Colors.white,))
*/
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        alignment: Alignment.topRight,
                        height:170.0,width:310,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(color: Colors.white70,blurRadius: 7)],
                            image: DecorationImage(image: NetworkImage(widget.img),fit: BoxFit.cover)
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            /*    color: Colors.redAccent.withOpacity(0.2),*/
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      Positioned (
                        top: 130.0,
                        left: 270.0,
                        child: FlipCard(
                          direction: FlipDirection.VERTICAL, // You can change the direction here
                          flipOnTouch: true,
                          front:Container(
                              height: 40,width: 40,
                              decoration: BoxDecoration(

                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                              child: Icon( Icons.favorite_border,color: Colors.black,size: 30,)),
                          back: Container(

                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(10))),

                              height: 40,width: 40,
                              child: Icon( Icons.favorite,color: Colors.redAccent,size: 30, )),
                          onFlip: () {
                            setState(() {

                            });
                          },
                        ),
                      ),
                    ],
                  ),


                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 15),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.name,style: TextStyle(color: Colors.white,fontSize: 25,/*shadows: [BoxShadow(color: Colors.red,blurRadius: 12)]*/),),

                  Text("Total Prize "+widget.price,style: TextStyle(color: Colors.white,),),

                ],
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(widget.Dis,style: TextStyle(color: Colors.blueGrey),),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Divider(thickness: 0.50,color: Colors.grey,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    FlipCard(
                      direction: FlipDirection.VERTICAL, // You can change the direction here
                      flipOnTouch: true,
                      front:Icon( Icons.add,color: Colors.white,size: 30,),
                      back: Icon( Icons.favorite,color: Colors.redAccent,size: 30, ),
                      onFlip: () {
                        setState(() {

                        });
                      },
                    ),
                    FlipCard(
                      direction: FlipDirection.VERTICAL, // You can change the direction here
                      flipOnTouch: true,
                      front:Icon( Icons.download_sharp,color: Colors.white,size: 30,),
                      back: Icon( Icons.favorite,color: Colors.redAccent,size: 30, ),
                      onFlip: () {
                        setState(() {

                        });
                      },
                    ),
                    FlipCard(
                      direction: FlipDirection.VERTICAL, // You can change the direction here
                      flipOnTouch: true,
                      front:Icon( Icons.share,color: Colors.white,size: 30,),
                      back: Icon( Icons.favorite,color: Colors.redAccent,size: 30, ),
                      onFlip: () {
                        setState(() {

                        });
                      },
                    ),
                  ],
                ),
                Divider(thickness: 0.50,color: Colors.grey,),
              ],),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white),
                      gradient: LinearGradient(colors: [
                        Colors.white,
                        Colors.red.shade100
                      ])

                  ),
                  height: 50,width: 100,
                  child: Center(child: Text('Watch Trailer',style: TextStyle(fontSize: 14,color: Colors.black87),),),
                ),
                Container(
                  height: 50,width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white),
                      gradient: LinearGradient(colors: [
                        Colors.white,
                        Colors.red.shade100
                      ])
                  ),

                  child: Center(child: Text("₹ "+widget.price,style: TextStyle(fontSize: 18,color: Colors.black87),),),
                ), 
                Container(
                  height: 50,width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white),
                      gradient: LinearGradient(colors: [
                        Colors.white,
                        Colors.red.shade100
                      ])
                  ),

                  child: Center(child: Text('Subscruption',style: TextStyle(fontSize: 14,color: Colors.black87),),),
                ),
              ],
            ),

          ]),
        ));
  }
}
