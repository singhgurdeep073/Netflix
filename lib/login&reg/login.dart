import 'dart:convert';

import 'package:netflix/Navigationbar.dart';
import 'package:netflix/login&reg/forgetpass.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:netflix/login&reg/registation.dart';
import 'package:http/http.dart' as http;

class login extends StatefulWidget {

   login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

 class _loginState extends State<login> {
   final _formKey = GlobalKey<FormState>();
   bool passwordVisible=false;
   final email = TextEditingController();
   final Pass = TextEditingController();

 /*  @override
   void initState() {
     super.initState();
     Display();
   }
   void Display()async{
     SharedPreferences prefs = await SharedPreferences.getInstance();

     String? stringValue = prefs.getString('key');
     if (stringValue != null) {
       Navigator.push(context, MaterialPageRoute(builder: (context) {
         return bottom();
       }));
     }
   }
  void AddtoSF(String name)async{
     SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
     sharedPreferences.setString("key", name);

   }*//* @override
   void initState() {
     super.initState();
     checkLoginStatus();
   } */
   @override
    void initState2() {
     super.initState();
     _loadSavedLoginData();
   }
   void _loadSavedLoginData() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     setState(() {
       email.text = prefs.getString('username') ?? '';
       Pass.text = prefs.getString('password') ?? '';
     });
   }
   void logind(e, p) async {
      try {
        // Send GET request to the API with query parameters
        final response = await http.get(
          Uri.parse('http://www.paji.store/WebService1.asmx/LoginApi?email=$e&password=$p'),
        );
            if(response.statusCode == 200) {
              List<dynamic> jsonList = json.decode(response.body);
              for (var item in jsonList) {
                String massage = item['msg'].toString();
                if(massage=="1")
                {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.setString('username',email.text);
                    await prefs.setString('password',Pass.text);
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) => bottom()));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.redAccent,

                          content: Text('Login Success',),
                          duration: Duration(
                              seconds: 2), // Adjust the duration as per your requirement
                        ));
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.redAccent,

                        content: Text('Invalid Id or Password',),
                        duration: Duration(seconds: 3), // Adjust the duration as per your requirement
                      ));
                }
              }
            }
            else {
              print('Login failed');
            }}
      catch (e) {
        print('Error: $e');
      }
    }
    @override
      Widget build(BuildContext context) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Form(
            key: _formKey,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage("https://e0.pxfuel.com/wallpapers/653/834/desktop-wallpaper-red-border-amoled-black.jpg"),
                      fit: BoxFit.cover)
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                  Image.asset("images/MyMovie.png",height: 250,),

                    TextFormField(
                      controller: email,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        labelText: 'Gmail',
                        labelStyle: TextStyle(
                            fontSize: 13.0, color: Colors.white
                        ),
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      maxLength: 6,
                      controller: Pass,
                  style: TextStyle(color: Colors.white),
                  obscureText: passwordVisible,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    labelText: "Password",
                    prefixIcon: Icon(
                      Icons.password_rounded,
                      color: Colors.white,
                    ),
                    labelStyle: TextStyle(
                        fontSize: 13.0, color: Colors.white
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible
                          ? Icons.visibility_off_outlined
                          : Icons.visibility,color: Colors.white,),
                      onPressed: () {
                        setState(() {passwordVisible = !passwordVisible;},
                        );
                      },
                    ),
                    alignLabelWithHint: false,
                    filled: true,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 200.0),
                      child: GestureDetector(
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context){
                              return Forget();
                            }));

                          },
                          child: Text("Forget Password ",style: TextStyle(fontSize: 15,color: Colors.white),)),
                    ),
                    SizedBox(height: 16.0),
                    GestureDetector(
                      onTap:(){


                          logind(email.text,Pass.text);
                      },
                      child:   Container(

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white),
                          gradient: LinearGradient(colors: [
                            Colors.white,
                            Colors.red.shade100
                          ])

                      ),
                      height: 50,width: 250,
                      child: Center(child: Text('Login',style: TextStyle(fontSize: 20,color: Colors.black87),),),
                    ),),
                    SizedBox(height: 10,),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context){
                            return registation();
                          }));

                        },
                        child: Text("Create Account ",style: TextStyle(fontSize: 15,color: Colors.white),)),

                  ]
            ),
        ),
        ),
        )        );      }
 }




