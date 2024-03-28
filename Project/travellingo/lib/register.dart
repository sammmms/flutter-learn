import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travellingo/setup.dart';
import 'package:travellingo/signin.dart';

Route _createRoute(String userEmail){
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Setup(email: userEmail),
    transitionsBuilder: (context, animation, secondaryAnimation, child){
      const begin = Offset(1.0, 0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve:curve));

      return SlideTransition(position: animation.drive(tween), child:child);
    },
    );
}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var isError = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Center(child:Image.asset("assets/Signup.png")),
            const SizedBox(height: 40,),
            const Text("EMAIL", textAlign: TextAlign.center, style: TextStyle(
              color: Color(0xFF1B1446),
              fontWeight: FontWeight.bold,
              fontFamily: "DM Sans",
              fontSize: 14,
              letterSpacing: 1
            ),),
            const SizedBox(height: 5,),
            TextField(
              controller: email,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z@.]'))
              ],
              keyboardType: TextInputType.emailAddress,
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
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.red)
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                prefixIcon: const Icon(Icons.account_circle, color:Color.fromARGB(255, 62, 132, 168),),
                filled: true,
                fillColor: const Color(0xFFF6F8FB),
                error: isError ? const Text("Email must be written, and must be in email formats.", style: TextStyle(color:Colors.redAccent),) : null
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
                if(email.text != "" && email.text.contains("@") && email.text.contains(".")){
                  Navigator.of(context).push(_createRoute(email.text));
                  isError = false;
                  }
                else{
                  setState(() {
                    isError = true;
                  });
                }},
              style: const ButtonStyle(
                minimumSize: MaterialStatePropertyAll(Size( double.infinity, 52)),
                backgroundColor: MaterialStatePropertyAll(Color(0xFFF5D161)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))))
              ),
              
              child: const Text("SIGN UP", style: TextStyle(
                color: Colors.white, 
                fontSize: 11.5,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.1),textScaler: TextScaler.linear(1.1),)
              ),
            const SizedBox(height: 40,),
            Row(
              children:[
                Expanded(child: Container(height:2, color: const Color(0xFFF6F8FB),)),
                const Padding(padding:EdgeInsets.symmetric(horizontal:20),
                child:Text("OR SIGN UP WITH", style: TextStyle(
                      fontSize: 9, 
                      letterSpacing: 1.1, 
                      fontWeight: FontWeight.bold, 
                      color: Color(0xAA1B1446)), 
                      textScaler: TextScaler.linear(1.1)
                      )),
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
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color:Colors.grey.shade200, style: BorderStyle.solid)
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset("assets/Facebook.png", width: 20)
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color:Colors.grey.shade200, style: BorderStyle.solid)
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset("assets/Google.png", width: 20)
                  ),
                ),InkWell(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color:Colors.grey.shade200, style: BorderStyle.solid)
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset("assets/Apple.png", width: 20)
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                const Text("Already have an account ?", style: TextStyle(color: Colors.black26)),
                const SizedBox(width: 10,),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const SignIn())
                    );
                  },
                  child: const Text("Sign in", style: TextStyle(color: Color(0xFFF5D161)))
                )
              ]
            )
          ]
        )
            ),
      ));
  }
}