import 'package:flutter/material.dart';
import 'package:travellingo/setup.dart';
import 'package:travellingo/signin.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Center(child:Image.asset("Signup.png")),
          const SizedBox(height: 40,),
          const Text("EMAIL", textAlign: TextAlign.center, style: TextStyle(
            color: Color(0xFF1B1446),
            fontWeight: FontWeight.bold,
            fontFamily: "DM Sans",
            fontSize: 10,
            letterSpacing: 1
          ),),
          const SizedBox(height: 5,),
          TextField(
            keyboardType: TextInputType.emailAddress,
            controller: email,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.transparent)
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.transparent)
              ),
              prefixIcon: const Icon(Icons.account_circle, color:Color.fromARGB(255, 62, 132, 168),),
              filled: true,
              fillColor: const Color(0xFFF6F8FB),
            ),
            style: const TextStyle(
              color: Color(0xFF1B1446),
              fontSize: 14,
              letterSpacing: 1.1,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 15,),
          ElevatedButton(
            onPressed:(){
              if(email.text != ""){
                Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Setup(email: email.text))
              );
              };
            },
            style: const ButtonStyle(
              minimumSize: MaterialStatePropertyAll(Size( double.infinity, 52)),
              backgroundColor: MaterialStatePropertyAll(Color(0xFFF5D161)),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))))
            ),
            
            child: const Text("Sign Up", style: TextStyle(color: Colors.white, fontFamily: "DM Sans", fontSize: 18),)
            ),
          const SizedBox(height: 40,),
          Row(
            children:[
              Expanded(child: Container(height:2, color: const Color(0xFFF6F8FB),)),
              const Text("OR SIGNIN WITH", style: TextStyle(
                    fontSize: 10, 
                    letterSpacing: 1.1, 
                    fontWeight: FontWeight.bold, 
                    color: Color(0xFF1B1446)), 
                    textScaler: TextScaler.linear(1.1)
                    ),
              Expanded(child: Container(height:2, color: const Color(0xFFF6F8FB),)),
              ]),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color:Colors.grey.shade200, style: BorderStyle.solid)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset("Facebook.png", width: 40)
                ),
              ),
              InkWell(
                onTap: (){},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color:Colors.grey.shade200, style: BorderStyle.solid)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset("Google.png", width: 40)
                ),
              ),InkWell(
                onTap: (){},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color:Colors.grey.shade200, style: BorderStyle.solid)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset("Apple.png", width: 40)
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              const Text("Already have an account ?", style: TextStyle(color: Colors.black26)),
              const SizedBox(width: 20,),
              InkWell(
                onTap: (){
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const SignIn())
                  );
                },
                child: const Text("Login", style: TextStyle(color: Color(0xFFF5D161)))
              )
            ]
          )
        ]
      )
    ));
  }
}