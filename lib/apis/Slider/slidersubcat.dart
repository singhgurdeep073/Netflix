import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:netflix/apis/Slider/sliderpro.dart';

class SliderSubCat{
  final String sid;
  final String name;
  final String img;
  SliderSubCat({required this.sid,required this.name,required this.img});
  factory SliderSubCat.FromJson(Map<String,dynamic>json){
    return SliderSubCat(sid: json['sid'].toString(),name: json['subname'],img: "http://www.paji.store/upload/"+json['subimage']);

  }
}
Future<List<SliderSubCat>>fetchData(id) async{
  var url=Uri.parse("http://www.paji.store/WebService1.asmx/sliderSubCategory?id=$id");
  final responce=await http.get(url);
  if(responce.statusCode==200){

    List listresponce=json.decode(responce.body);

    return listresponce.map((data) => SliderSubCat.FromJson(data)).toList();
  }
  else{
    throw Exception('Unexpected error occured!');
  }


}

class Slidersubcat extends StatefulWidget {
  final String id;
  const Slidersubcat({Key? key,required this.id}) : super(key: key);

  @override
  State<Slidersubcat> createState() => _SlidersubcatState();
}

class _SlidersubcatState extends State<Slidersubcat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            children:[

              Padding(
                padding:  EdgeInsets.only(left: 18.0,top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Discover",style: TextStyle(color: Colors.white,fontSize: 30),),
                  ],
                ),
              ),
              Container(
                height: 750,
                child: FutureBuilder<List<SliderSubCat>>(
                    future: fetchData(widget.id),
                    builder: (context,abc){
                      if(abc.hasData){
                        return  ListView.builder(
                            itemCount: abc.data!.length,

                            itemBuilder: (BuildContext context,int len){
                              return InkWell(
                                onTap: (){
                                  Navigator.push(context,MaterialPageRoute(builder: (context){
                                    return Sliderpro(name: abc.data![len].name,subid:abc.data![len].sid,);
                                  }));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 18.0,right: 18),
                                  child: Column(
                                    children: [

                                      Container(
                                        height: 80,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                          children: [

                                            Text(abc.data![len].sid,style: TextStyle(color: Colors.white),),


                                            Text(abc.data![len].name,style: TextStyle(color: Colors.white),),
                                            Image.network(abc.data![len].img,height: 80,fit: BoxFit.cover,),

                                          ],
                                        ),
                                      ),
                                      Divider(color: Colors.white,),
                                    ],
                                  ),
                                ),
                              );

                            });
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
            ]  ),
      ),
    );
  }
}
