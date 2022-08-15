import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel/Data/network.dart';
import 'package:marvel/Firebase/CreateUser.dart';
import 'package:marvel/Screens/HomScreen.dart';
import 'package:marvel/utilits/TextField.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    TextEditingController _Email = TextEditingController();
    TextEditingController _Password = TextEditingController();
    bool _loginClick= true;
    bool _signUpClick = true;
    bool _txtEmail = true;
    bool _txtpassword=true;
    bool _isloadingLogin=false;



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 10,right: 10),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Flexible(child: Container(),flex: 2,),
              //Marvel logo
             Hero(
               tag: "logo",
               child: AnimatedContainer(
                 curve: Curves.bounceIn,
                   duration: Duration( seconds: 2),
                 child:SvgPicture.asset("assets/marvel.svg",fit: BoxFit.cover,width:200,),
               ),
             ),
              //Email
              SizedBox(height: 50),
              TextfieldforAPP(
                  textController: _Email,
                  hintText: "Email",
                  isObsured: false),
              SizedBox(height: 10),
              //Password
              TextfieldforAPP(
                  textController: _Password,
                  hintText: "Password",
                  isObsured: true),
              SizedBox(height: 5,),
              //Forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("forgot your password?",
                    style: GoogleFonts.aBeeZee(
                        textStyle:
                        TextStyle(
                            fontSize: 12),
                            fontWeight: FontWeight.w300 ,
                            color: Colors.grey

                    ),
                  ),
                ],
              ),

              //Login Button and signUp Button
              SizedBox(height: 10,),
              //Login Button
              Row(
                children: [
                  //Login Button
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        ApiData().getData();
                          Users(Email: _Email.text,Password: _Password.text).CreateUser();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

                        setState(() {
                          _loginClick=!_loginClick;
                        });
                      },
                      child: Container(
                        height: 50,
                        child: Center(child:_loginClick?
                        Text("Login",style: TextStyle(fontSize: 15, color: Colors.white),):
                            CircularProgressIndicator(color: Colors.red,),
                        ),
                        decoration: BoxDecoration(
                          color:_loginClick? Color.fromRGBO(0,73, 0, 2):Color.fromRGBO(0,0, 200, 2)
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              //Sign Up button
              SizedBox(height: 15,),
              Row(
                children: [
                  Expanded(
                      child:InkWell(
                        onTap: (){

                        },
                        child: Container(
                          height: 50,
                          child: Center(child:_signUpClick? Text("Sign Up "):
                            CircularProgressIndicator(color: Colors.red,)
                          ),


                        ),
                      )
                  ),
                ],
              ),
              SizedBox(height:20 ,),

              Flexible(child: Container(),flex: 1,),

            ],
          ),
        ),
      ),
    );
  }
}


