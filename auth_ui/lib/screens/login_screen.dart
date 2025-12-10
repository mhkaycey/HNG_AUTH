
import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:auth_ui/widgets/components/custom_input.dart';
import 'package:auth_ui/widgets/components/auth_button.dart';
import 'package:auth_ui/widgets/components/provider_button.dart';
import 'package:auth_ui/widgets/components/custom_checkbutton.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auth_ui/utils/route_generator.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
    final TextEditingController passwordController = TextEditingController();
     final TextEditingController emailController = TextEditingController();
     @override
    void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }
  var logger = Logger();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
      automaticallyImplyLeading: false,
  // backgroundColor: Colors.white,
  elevation: 0,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SvgPicture.asset(
        'assets/icons/logo.svg', 
        height: 40,        
      ),

     Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
        'First time here?',         
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      SizedBox(width:6),
      GestureDetector(
        onTap: (){
         Navigator.of( context , rootNavigator: true).pushNamed(RouteGenerator.register) ;
        },
        child: Text(
          'Sign Up?',         
          style: TextStyle(
            color: Colors.blue,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      ],
     ),
     
    ],
  ),
),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Login',
                  style:TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.grey[900],
                  ),
                ),
              ),
              SizedBox(height: 10.0,),
              Text(
                'Welcome back! Please enter your details.',
                style:TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600]
                ),
              ),
              SizedBox(height:30.0),
              CustomInput(
                controller: emailController,
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
                label: "Email Address",
              ),
              SizedBox(height: 30.0,),
              CustomInput(
                controller: passwordController,
                hintText: "Password",
                isPassword: true,
                 label: "Password",
              ),
              SizedBox(height:20.0),
              CustomCheckbox(
              label: "Remember information",
              initialValue: false,
              onChanged: (value) {
                print("Checkbox is: $value");
              },
            ),
               SizedBox(height:20.0),
              AuthButton(
              title: "Login",
              onPressed: () {
                logger.i("Login clicked");
              },
            ),
             SizedBox(height:25.0),
              Text(
                  'Forget Password?',
                  style:TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.lightBlue[600],
                  ),
                ),
              SizedBox(height:35.0),
               Row(
  children: [
    Expanded(
      child: Divider(
        color: Colors.grey,
        thickness: 1,
      ),
    ),

    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        "or",  
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.grey[700],
        ),
      ),
    ),

    Expanded(
      child: Divider(
        color: Colors.grey,
        thickness: 1,
      ),
    ),
  ],
),
              SizedBox(height:25.0),
          SvgBorderButton(
          svgAsset: "assets/icons/googleicon.svg",
          title: "Login with Google",
          onPressed: () {
          },
        ),
         SizedBox(height:25.0),
          SvgBorderButton(
          svgAsset: "assets/icons/appleicon.svg",
          title: "Login with Apple",
          onPressed: () {
          },
        ),
            ],
          ),
        ),
      ),
    );
  }
}