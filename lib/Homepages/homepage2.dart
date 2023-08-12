import 'package:flutter/material.dart';
class Images{
  final String img;
  final String name;

   Images({required this.img,required this.name});
}
class home2 extends StatefulWidget {
  final int pos;
  final String img;
  final String name;
  final String dis;
  final String text;
   home2({Key? key,required this.pos, required this.img, required this.name, required this.dis,required this.text}) : super(key: key);

  @override
  State<home2> createState() => _home2State();
}

class _home2State extends State<home2> {
  List<Images>url=[
    Images(img: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQpNyAkvB7yWU-_rDRwn2sNyaZURoZDqXzS390t1ZDRrVXNRs2O", name: "New Movie"),
    Images(img: "https://upload.wikimedia.org/wikipedia/en/0/07/The_Pale_Blue_Eye_poster.jpg", name: "New Movie"),
    Images(img: "https://upload.wikimedia.org/wikipedia/en/0/07/The_Pale_Blue_Eye_poster.jpg", name: "New Movie"),
    Images(img: "https://upload.wikimedia.org/wikipedia/en/7/7c/Jung_E.jpg", name: "New Movie"),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 20),
          height: 200,

          child: Image.network(widget.img)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,shadows: [BoxShadow(color: Colors.yellow,blurRadius: 20),],color: Colors.white),),
          ),

          Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Text(widget.dis,style: TextStyle(fontSize: 20,color: Colors.white),),
),
          Container(
            height: 120,
            child: Column(children:[
              Image.network(url[widget.pos].img,width: 100,height: 100,),
              Text(url[0].name,style: TextStyle(color: Colors.white),),


            ]),
           /* GridView.builder(
                itemCount: url.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1), itemBuilder: (context,index){
              return Column(
                children: [
                Image.network(url[index].img,width: 100,height: 100,),
                  Text(url[index].name,style: TextStyle(color: Colors.white),)

                ],
              );
            }),*/
          )

        ],),
      ),
    );
  }
}
