import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:netflix/login&reg/registation.dart';


class signinbutton extends StatefulWidget {
  const signinbutton({Key? key}) : super(key: key);

  @override
  State<signinbutton> createState() => _signinbuttonState();
}

class _signinbuttonState extends State<signinbutton> {
  @override
  Widget build(BuildContext context) {
return Scaffold(
  body: Container(
    height: double.infinity,
    decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage("https://e0.pxfuel.com/wallpapers/653/834/desktop-wallpaper-red-border-amoled-black.jpg"),fit: BoxFit.cover)
    ),
    child: Column(

      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Image.network("https://cdn.cookielaw.org/logos/dd6b162f-1a32-456a-9cfe-897231c7763c/4345ea78-053c-46d2-b11e-09adaef973dc/Netflix_Logo_PMS.png"),


        SizedBox(height: 10,),
      SignInButton(

        Buttons.Google,padding: EdgeInsets.only(left: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all( Radius.circular(10))),
        text: "Sign up with Google",

        onPressed: () {},
      ),
      SizedBox(height: 5,),
      Center(
        child: SignInButton(
          padding: EdgeInsets.only(left: 10),
          Buttons.FacebookNew,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all( Radius.circular(10))),
          text: "Sign up with Google",

          onPressed: () {},
        ),
      ),

        SizedBox(height: 10,),
        Text("Don't have an account",style: TextStyle(color: Colors.grey,fontSize: 17),),

        SizedBox(height: 10,),
        GestureDetector(
            onTap: (){

              Navigator.push(context,MaterialPageRoute(builder: (context){
                return registation();
              }));

            },
            child: Text("Create Account ",style: TextStyle(fontSize: 15,color: Colors.white),)),
    ],),
  ),
);
  }
}
