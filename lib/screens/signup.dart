import 'package:flutter/material.dart';
import 'package:the_news_app/screens/home_page.dart';
import 'package:the_news_app/screens/login.dart';

import '../firebase_methods/firebase_methods.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  
  TextEditingController econtroller = TextEditingController();
  TextEditingController pcontroller = TextEditingController();
  String error = "";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign-Up",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          const Text("E-mail",style: TextStyle(fontSize: 18),),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 350,
            child: TextField(
              controller: econtroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your email",
                prefixIcon: Icon(Icons.mail),
                prefixIconColor: Colors.black
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text("Password", style: TextStyle(fontSize: 18),),
          const SizedBox(
            height: 20,
          ),
           SizedBox(
            width: 350,
            child: TextField(
              controller: pcontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your password',
                prefixIcon: Icon(Icons.password)
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding:const EdgeInsets.all(6),
            child: Text(error, style: const TextStyle(color: Colors.red),)),
            isLoading==true? const Center(child: CircularProgressIndicator(),):
          ElevatedButton(
            onPressed: () async{
              setState(() {
                isLoading = true;
              });
              final response  = await FirebaseStoreMethods().signup(econtroller.text, pcontroller.text);
              response.fold((left) => {
                setState(() {
                  error = left.message;
                })
              }, (right) => print(right.user!.email));
              setState(() {
                isLoading = false;
              });
              if(error.isEmpty){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context){
                  return const HomePage();
                }));
              }
            },
            child: Text(
              "Sign-Up",
            ),
            style: ButtonStyle(elevation: MaterialStateProperty.all(0),),
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account?", style: TextStyle(fontSize: 15),),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (BuildContext context) {
                      return const Login();
                    }));
                  },
                  child: const Text("Log-in", style: TextStyle(fontSize: 15,),))
            ],
          ),
        ],
      ),
    );
  }
}
