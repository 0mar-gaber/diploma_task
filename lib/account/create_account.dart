import 'package:diploma_task/account/log_in_screen.dart';
import 'package:diploma_task/constant.dart';
import 'package:diploma_task/shared/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/home_screen.dart';
import '../reusable_combatant/dialog.dart';
import '../reusable_combatant/text_field.dart';

class CreateAccount extends StatefulWidget {
  static const String route = "create account";
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKay = GlobalKey();
  bool visible = true ;
  @override
  Widget build(BuildContext context) {
    ScreensProvider provider = Provider.of<ScreensProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: ListView(
        children:[Container(
          margin: EdgeInsets.all(width*0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    provider.themeMode==ThemeMode.light
                        ?"assets/images/logo_svg.svg"
                        :"assets/images/logo_dark_svg.svg"
                    ,
                    width: width*0.25,),
                  InkWell(
                    onTap: () async {
                      final SharedPreferences prefs = await SharedPreferences.getInstance();

                      if(provider.themeMode==ThemeMode.light){
                        provider.changeAppTheme(ThemeMode.dark);
                        prefs.setBool("is dark", true);

                      }else{
                        provider.changeAppTheme(ThemeMode.light);
                        prefs.setBool("is dark", false);

                      }


                    },
                    child: SvgPicture.asset(
                      provider.themeMode==ThemeMode.light
                          ?"assets/icons/icon_moon.svg"
                          :"assets/icons/icon_sun.svg"
                      ,
                      width: width * 0.04,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height*0.1,),
              Text("Create an account",
                style: TextStyle(
                  fontSize: width*0.05,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.error
                ),),
              Text("Connect with your friends today!",
                style: TextStyle(
                    fontSize: width*0.029,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.errorContainer
                ),),
              SizedBox(height: height*0.05,),

              Form(
                key: formKay,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email Address",style: TextStyle(
                        fontSize: width*0.035,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.inversePrimary
                    ),),
                    SizedBox(height: height*0.009,),
                    EditText(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      lapel: "Please Enter Your Email",
                      obscureText: false,
                      validate: (value) {
                        if(!RegExp(Constant.regExp).hasMatch(value!)){
                          return "Enter valid email" ;
                        }
                        if (value.isEmpty) {
                          return 'Email shouldn\'t be empty ';
                        }
                        return null ;
                      },
                      formKay: formKay,

                    ),
                    SizedBox(height: height*0.05,),
                    Text("Password",style: TextStyle(
                        fontSize: width*0.04,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.inversePrimary
                    ),),
                    SizedBox(height: height*0.009,),
                    EditText(
                      iconButton: !visible?IconButton(onPressed: (){
                        setState(() {
                          visible = true ;

                        });
                      }, icon: const Icon(Icons.visibility),color: Theme.of(context).colorScheme.onBackground):IconButton(onPressed: (){
                        setState(() {
                          visible = false ;
                        });
                      }, icon: const Icon(Icons.visibility_off),color: Theme.of(context).colorScheme.onBackground
                      ),
                      controller: passwordController,
                      keyboardType: TextInputType.emailAddress,
                      lapel: "Please Enter Your Password",
                      obscureText: visible,
                      validate: (value) {
                        if (value!.length<8) {
                          return 'Password shouldn\'t be less than 8 characters  ';
                        }
                        return null ;
                      },
                      formKay: formKay,

                    ),


                  ],
                ),
              ),
              SizedBox(height: height*0.07,),

              ElevatedButton(
                  onPressed: () {
                    createAccount();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.onError,

                    fixedSize: Size(width, height*0.06),
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),

                  ),
                  child: Text("Sign Up",style: TextStyle(
                      color: Theme.of(context).colorScheme.onErrorContainer,
                      fontSize: width*0.04,
                      fontWeight: FontWeight.w400
                  ),)
              ),

              SizedBox(height: height*0.07,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account ? ",style: TextStyle(
                      fontSize: width*0.03,
                      color: Theme.of(context).colorScheme.onInverseSurface
                  ),),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, LogInScreen.route);
                      },
                      child: Text("Login",style: TextStyle(fontSize: width*0.03,color: const Color.fromRGBO(0, 65, 130, 1.0)),)),
                ],
              ),


            ],
          ),
        ),
      ]),
    );
  }

  createAccount() async {

    if(formKay.currentState!.validate()){
      DialogUti.showLoadingDialog(context);
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email:emailController.text ,
          password: passwordController.text,
        );
        DialogUti.closeDialog(context);
        Navigator.pushNamedAndRemoveUntil(context, HomeScreen.route , (route) => false,);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          DialogUti.closeDialog(context);
          DialogUti.showMessageDialog(context: context,message: "Password is too weak");

        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          DialogUti.closeDialog(context);
          DialogUti.showMessageDialog(context: context,message: "Email is already used");
        }
      } catch (e) {
        print(e);
      }
    }  }
}
