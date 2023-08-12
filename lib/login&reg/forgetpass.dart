import 'package:flutter/material.dart';
import 'package:netflix/login&reg/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Forget extends StatefulWidget {
  const Forget({Key? key}) : super(key: key);

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  final _form = GlobalKey<FormState>();
  bool passwordVisible=false;
  final email = TextEditingController();
  final Pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _form,
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
                        labelText: "New Password",
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
                    SizedBox(height: 16.0),
                    GestureDetector(
                      onTap:(){
                       Navigator.push(context, MaterialPageRoute(builder: (context){
  return login();
}));
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
                        child: Center(child: Text('Submit',style: TextStyle(fontSize: 20,color: Colors.black87),),),
                      ),),
                    SizedBox(height: 10,),

                  ]
              ),
            ),
          ),
        )        );
  }
}
