import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:netflix/apis/Category/subcat.dart';

class Catid{
  final int id;
  final String name;
  final String img;
  Catid({required this.id,required this.name,required this.img});
  factory Catid.FromJson(Map<String,dynamic>json){
    return Catid(id: json['id'],name: json['Name'],img: "http://www.paji.store/upload/"+json['Img']);

  }
}
class Cat extends StatefulWidget {
  const Cat({Key? key}) : super(key: key);

  @override
  State<Cat> createState() => _CatState();
}

Future<List<Catid>> fetchData(id) async{
  var url=Uri.parse("http://www.paji.store/WebService1.asmx/Category?"+id);
  final responce=await http.get(url);
  if(responce.statusCode==200){
    List listresponce=json.decode(responce.body);
    return listresponce.map((data) => Catid.FromJson(data)).toList();
  }
  else{
    throw Exception('Unexpected error occured!');
  }


}


class _CatState extends State<Cat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Category"),),
      body: Container(
        height: 110,
        width: double.infinity,
        child: FutureBuilder<List<Catid>>(
            future: fetchData(""+1.toString()),
            builder: (context,abc){
              if(abc.hasData){
                return  ListView.builder(
                    itemCount: abc.data!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context,int len){
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context){
                            return Subcat(id:abc.data![len].id.toString());
                          }));

                        },
                        child: Column(children: [
                        CircleAvatar(
                          radius: 50,
                           backgroundImage: NetworkImage(abc.data![len].img,),
                            ),
                          Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
  children: [
    Center(child:Text(abc.data![len].name)),
    Text(abc.data![len].id.toString())
  ],
),
                        )

                        ],),
                      );

                    });
              }
              else if(abc.hasError){
                return Text(abc.error.toString());

              }
              return const LinearProgressIndicator(
                color: Colors.black87,
              );
            }

        ),
      ),
    );
  }
}
