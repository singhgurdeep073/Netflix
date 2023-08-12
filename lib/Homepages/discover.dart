import 'package:flutter/material.dart';
import 'package:netflix/Homepages/homepage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../apis/Category/category.dart';
import '../apis/Category/subcat.dart';
class Discover{
  final String name;
  final  String images;
  Discover(this.name, this.images, );
}
class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  Future<List<Catid>> fetchData() async{
    var url=Uri.parse("http://www.paji.store/WebService1.asmx/Category?");
    final responce=await http.get(url);
    if(responce.statusCode==200){
      List listresponce=json.decode(responce.body);
      return listresponce.map((data) => Catid.FromJson(data)).toList();
    }
    else{
      throw Exception('Unexpected error occured!');
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

    body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SizedBox(height: 30,),
          Padding(
            padding:  EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Discover",style: TextStyle(color: Colors.white,fontSize: 30),),
                IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Colors.white,))
              ],
            ),
          ),



          Padding(
            padding: const EdgeInsets.only(top: 8.0,left: 10),
            child: Container(
              height: 550,
              width: double.infinity,
              child: FutureBuilder<List<Catid>>(
                  future: fetchData(),
                  builder: (context,abc){
                    if(abc.hasData){
                      return
                      GridView.builder(

                          itemCount: abc.data!.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 10,crossAxisSpacing: 10,mainAxisExtent: 132), itemBuilder: (context,index){
                        return InkWell(
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context){
                              return Subcat(id:abc.data![index].id.toString()  );
                            }));

                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(15)
                            ),

                            child: Column(children: [
SizedBox(height: 17,),
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(abc.data![index].img,),
                              ),
                            /*  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(abc.data![index].img,height: 100,),
                              ),*/
                              Center(child:Text(abc.data![index].name,style: TextStyle(color: Colors.white),))

                            ],),
                          ),
                        );
                      });

                    }
                    else if(abc.hasError){
                      return Text(abc.error.toString());

                    }
                    return const CircularProgressIndicator(
                      color: Colors.black87,
                    );
                  }

              ),
            ),
          ),


        ],
      ),
    ),
    );
  }
}
