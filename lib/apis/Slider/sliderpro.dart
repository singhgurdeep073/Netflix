import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Detail.dart';


class SliderPro{
  final int id;
  final String proname;
  final String img;
  final String price;
  final String Dis;
  SliderPro({required this.id,required this.proname,required this.img,required this.price,required this.Dis});
  factory SliderPro.FromJson(Map<String,dynamic>json){
    return SliderPro(id: json['proid'],proname: json['name'],price: json["Price"],Dis: json['Dis'],img: "http://www.paji.store/upload/"+json['images']);

  }
}
Future<List<SliderPro>> fetchData(sid) async{
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
class Sliderpro extends StatefulWidget {
  final String subid;
  final String name;
   Sliderpro({Key? key,required this.subid,required this.name}) : super(key: key);

  @override
  State<Sliderpro> createState() => _SliderproState();
}


class _SliderproState extends State<Sliderpro> {
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
                    Text(widget.name,style: TextStyle(color: Colors.white,fontSize: 30),),
                  ],
                ),
              ),
              Container(
                height: 750,
                child: FutureBuilder<List<SliderPro>>(
                    future: fetchData(widget.subid),
                    builder: (context,abc){
                      if(abc.hasData){
                        return  ListView.builder(
                            itemCount: abc.data!.length,

                            itemBuilder: (BuildContext context,int len){
                              return InkWell(
                                child: Padding(
                                  padding:  EdgeInsets.only(left: 18.0,right: 18),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 80,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(abc.data![len].proname,style: TextStyle(color: Colors.white),),

                                            Image.network(abc.data![len].img,height: 80,fit: BoxFit.cover,),


                                          ],),
                                      ),
                                      Divider(color: Colors.white,),
                                    ],
                                  ),
                                ),
                                onTap: (){
                                  Navigator.push(context,MaterialPageRoute(builder: (context){
                                    return SliderDetail(id:abc.data![len].id,name: abc.data![len].proname,img:abc.data![len].img,price: abc.data![len].price,Dis:abc.data![len].Dis ,);
                                  }));

                                },
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
