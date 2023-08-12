import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class Moviedetails extends StatefulWidget {
  final int id;
  final String name;
  final String img;
  final String price;
  final String Dis;
  const Moviedetails({Key? key,required this.id,required this.price,required this.img,required this.name,required this.Dis}) : super(key: key);

  @override
  State<Moviedetails> createState() => _MoviedetailsState();
}

class _MoviedetailsState extends State<Moviedetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(children: [

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
                    margin: EdgeInsets.only(bottom: 10.0,left: 20),
                    alignment: Alignment.topRight,
                    height:250.0,width:150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(color: Colors.white,blurRadius: 10)],
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
                      top: 200.0,
                      left: 120.0,
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
              Padding(
                padding: const EdgeInsets.only(top: 200,left: 20),
                child:     Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total Prize "+widget.price,style: TextStyle(color: Colors.white,),),

                  ],
                ),
              ),

            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(widget.name,style: TextStyle(color: Colors.white,fontSize: 25,/*shadows: [BoxShadow(color: Colors.red,blurRadius: 12)]*/),),
              SizedBox(height: 5,),
              Text(widget.Dis,style: TextStyle(color: Colors.grey),),
            ],
          ),
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
                FlipCard(
                  direction: FlipDirection.VERTICAL, // You can change the direction here
                  flipOnTouch: true,
                  front:Icon( Icons.download_sharp,color: Colors.white,size: 30,),
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
                FlipCard(
                  direction: FlipDirection.VERTICAL, // You can change the direction here
                  flipOnTouch: true,
                  front:Icon( Icons.share,color: Colors.white,size: 30,),
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

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white),
                  gradient: LinearGradient(colors: [
                    Colors.white,
                    Colors.red.shade100
                  ])

              ),
              height: 50,width: 100,
              child: Center(child: Text("₹ "+widget.price,style: TextStyle(fontSize: 18,color: Colors.black87),),),
            ),
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
              child: Center(child: Text('Subscruption',style: TextStyle(fontSize: 14,color: Colors.black87),),),
            ),
          ],
        ),

    ]));
  }


}
