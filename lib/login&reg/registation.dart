import 'package:flutter/material.dart';
import 'package:netflix/Navigationbar.dart';
import 'package:netflix/login&reg/login.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Homepages/homepage.dart';
class registation extends StatefulWidget {
  const registation({Key? key}) : super(key: key);

  @override
  State<registation> createState() => _registationState();
}

class _registationState extends State<registation> {

  final formGlobalKey = GlobalKey <FormState>();

  final name = TextEditingController();
  final phone = TextEditingController();
  final _email = TextEditingController();
  final pass = TextEditingController();
  final conpass = TextEditingController();
  final add = TextEditingController();
  bool isVerifying = false;


  Future<void> register(nam, phone, email, pas, conpas, address) async {
    if (name.text.length <=0 && _email.text.length <=0 &&
        pass.text.length <=0 && conpass.text.length <=0 &&
        add.text.length <=0) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(behavior: SnackBarBehavior.floating,


            backgroundColor: Colors.redAccent,
            content: Text(' Registation Failed\n Please Fill Your Detail Carefully. ',),
            duration: Duration(
                seconds: 3), // Adjust the duration as per your requirement
          ));
    }
    else {
      try {
        // Send GET request to the API with query parameters
        final response = await http.get(
          Uri.parse(
              'http://www.paji.store/WebService1.asmx/Registation?&Name=$nam&Phone=$phone&Email=$email&Password=$pas&Conformpass=$conpas&Address=$address'),
        );


        if (response.statusCode == 200) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return login();
          }));
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(behavior: SnackBarBehavior.floating,


                backgroundColor: Colors.redAccent,
                content: Text('Register Successfully',),
                duration: Duration(
                    seconds: 3), // Adjust the duration as per your requirement
              ));
        }
        else {
          // Registration failed, handle the error
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text('Invalid Id or Password',),
                duration: Duration(
                    seconds: 3), // Adjust the duration as per your requirement
              ));
        }
      } catch (e) {
        // Error occurred during the API call
        print('Error: $e');
      }

      // Simulate verification process
      /* Future.delayed(Duration(seconds: 2), () {
        setState(() {
          isVerifying = false;
        });*/

      // Navigate to the next page
      /* Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => login()),
        );
      });*/
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(
        key: formGlobalKey,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
          child:
          Container(
            height: 750,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(
                    "https://e0.pxfuel.com/wallpapers/653/834/desktop-wallpaper-red-border-amoled-black.jpg"),
                    fit: BoxFit.cover)
            ),
            child: Padding(
              padding: EdgeInsets.all(6.0),
              child: Column(
                children: [
                  Image.asset("images/MyMovie.png",fit: BoxFit.cover, height: 150,),
                  TextFormField(
                    controller: name,
                    style: TextStyle(color: Colors.white),
                    // Add your text form field properties
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
                      labelText: 'Name',

                      labelStyle: TextStyle(
                          fontSize: 13.0, color: Colors.white
                      ),
                      prefixIcon: Icon(
                        Icons.account_circle,
                        color: Colors.white,
                      ),


                    ),
                  ),
                  SizedBox(height: 18,),
                  TextFormField(
                    controller: _email,
                    style: TextStyle(color: Colors.white),
                    // Add your text form field properties
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
                  SizedBox(height: 18,),
                  TextFormField(
                    maxLength: 6,
                    cursorColor: Colors.redAccent,
                    controller: pass,
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                    // Add your text form field properties
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
                      labelText: 'Password',

                      labelStyle: TextStyle(
                          fontSize: 13.0, color: Colors.white
                      ),
                      prefixIcon: Icon(
                        Icons.password_rounded,
                        color: Colors.white,
                      ),


                    ),
                  ),
                  TextFormField(
                    maxLength: 6,
                    controller: conpass,
                    style: TextStyle(color: Colors.white),

                    obscureText: true,
                    // Add your text form field properties
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
                      labelText: 'Conform Password',

                      labelStyle: TextStyle(
                          fontSize: 13.0, color: Colors.white
                      ),
                      prefixIcon: Icon(
                        Icons.verified,
                        color: Colors.white,
                      ),


                    ),
                  ),
                  TextFormField(
                    maxLength: 10,
                    controller: phone,
                    style: TextStyle(color: Colors.white),
                    // Add your text form field properties
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
                      labelText: 'Phone Number',

                      labelStyle: TextStyle(
                          fontSize: 13.0, color: Colors.white
                      ),
                      prefixIcon: Icon(
                        Icons.phone_iphone,
                        color: Colors.white,
                      ),


                    ),
                  ),
                  TextFormField(

                    controller: add,
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
                      labelText: 'Address',

                      labelStyle: TextStyle(
                          fontSize: 13.0, color: Colors.white
                      ),
                      prefixIcon: Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),


                    ),
                  ),
                  /*       GestureDetector(

                    onTap: isVerifying ? null : _submitForm,
                    child: isVerifying
                        ? CircularProgressIndicator(color: Colors.red,)
                        : GestureDetector(
                          child: Container(

                      decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white),
                          gradient: LinearGradient(colors: [
                            Colors.white,
                            Colors.red.shade100
                          ])

                      ),
                      height: 50,width: 250,
                      child: Center(child: Text('L o g i n',style: TextStyle(fontSize: 20,color: Colors.black87),)),
                    ),
                        ),
                  ),*/

                  SizedBox(height: 15,),
                  GestureDetector(
                    onTap: () {

                      register(name.text, phone.text, _email.text, pass.text,
                          conpass.text, add.text);

                      /*  if(formGlobalKey!=null){
                        register(name.text, phone.text, _email.text,pass.text, conpass.text, add.text);

                      }
                      else {
                        formGlobalKey.currentState?.save();
                        _email.toString();
                        pass.toString();
                        conpass.toString();
                        phone.toString();
                       */
                      /* if (formGlobalKey.currentState!.validate()) {
                          formGlobalKey.currentState?.save();
                          _email.toString();
                          pass.toString();
                          conpass.toString();
                          phone.toString();
                        }*/ /*
                      }*/

                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white),
                          gradient: LinearGradient(colors: [
                            Colors.white,
                            Colors.red.shade100
                          ])

                      ),
                      height: 50, width: 250,
                      child: Center(child: Text('REGISTATION',
                        style: TextStyle(fontSize: 20, color: Colors.black87),)),
                    ),),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }




}
