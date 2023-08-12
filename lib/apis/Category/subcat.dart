import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:netflix/apis/Category/product.dart';
class SubCat{
  final String sid;
  final String name;
  final String img;
  SubCat({required this.sid,required this.name,required this.img});
  factory SubCat.FromJson(Map<String,dynamic>json){
    return SubCat(sid: json['sid'].toString(),name: json['subname'],img: "http://www.paji.store/upload/"+json['subimage']);

  }
}
class Subcat extends StatefulWidget {
  final String id;
  const Subcat({Key? key,required this.id}) : super(key: key);

  @override
  State<Subcat> createState() => _SubcatState();
}
  Future<List<SubCat>>fetchData(id) async{
  var url=Uri.parse("http://www.paji.store/WebService1.asmx/SubCategory?id="+id);
  final responce=await http.get(url);
  if(responce.statusCode==200){

    List listresponce=json.decode(responce.body);

    return listresponce.map((data) => SubCat.FromJson(data)).toList();
  }
  else{
    throw Exception('Unexpected error occured!');
  }


}
class _SubcatState extends State<Subcat> {
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
              child: FutureBuilder<List<SubCat>>(
                future: fetchData(widget.id),
                builder: (context,abc){
                  if(abc.hasData){
                    return  ListView.builder(
                        itemCount: abc.data!.length,

                        itemBuilder: (BuildContext context,int len){
                          return InkWell(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context){
                                return Product( subid: abc.data![len].sid,name: abc.data![len].name,img:abc.data![len].img ,);
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
