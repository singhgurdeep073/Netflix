import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:netflix/apis/Category/product.dart';
import 'package:netflix/apis/Slider/slidersubcat.dart';

class SliderCat{
  final String sliderid;
  final String slidername;
  final String sliderimg;
  SliderCat({required this.sliderid,required this.slidername,required this.sliderimg});
  factory SliderCat.FromJson(Map<String,dynamic>json){
    return SliderCat(sliderid: json['id'].toString(),slidername: json['Name'],sliderimg: "http://www.paji.store/upload/"+json['Img']);

  }
}
class Slidercat extends StatefulWidget {

  const Slidercat({Key? key,}) : super(key: key);

  @override
  State<Slidercat> createState() => _SlidercatState();
}
Future<List<SliderCat>>fetchData(id) async{
  var url=Uri.parse("http://www.paji.store/WebService1.asmx/slidercat?"+id);
  final responce=await http.get(url);
  if(responce.statusCode==200){

    List listresponce=json.decode(responce.body);

    return listresponce.map((data) => SliderCat.FromJson(data)).toList();
  }
  else{
    throw Exception('Unexpected error occured!');
  }


}
class _SlidercatState extends State<Slidercat> {
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
                child: FutureBuilder<List<SliderCat>>(
                    future: fetchData(""+1.toString()),
                    builder: (context,abc){
                      if(abc.hasData){
                        return  ListView.builder(
                            itemCount: abc.data!.length,

                            itemBuilder: (BuildContext context,int len){
                              return InkWell(
                                onTap: (){
                                  Navigator.push(context,MaterialPageRoute(builder: (context){
                                    return Slidersubcat(id:abc.data![len].sliderid );
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

                                            Text(abc.data![len].sliderid,style: TextStyle(color: Colors.white),),


                                            Text(abc.data![len].slidername,style: TextStyle(color: Colors.white),),
                                            Image.network(abc.data![len].sliderimg,height: 80,fit: BoxFit.cover,),

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
