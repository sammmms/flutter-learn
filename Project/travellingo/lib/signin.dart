import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:travellingo/register.dart";

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  bool _isObscure = true;
  bool _isTicked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,  
            children: [
              const Image(image: AssetImage('assets/Signin.png'), width: 200,),
              const SizedBox(height: 40,),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("EMAIL", style: TextStyle(
                      fontSize: 10, 
                      letterSpacing: 1.1, 
                      fontWeight: FontWeight.bold, 
                      color: Color(0xFF1B1446)), 
                      textScaler: TextScaler.linear(1.1)
                      ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      width: double.infinity,
                      child: TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z@.0-9]'))
                        ],
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                          color: Color(0xFF1B1446),
                          fontSize: 14,
                          letterSpacing: 1.1,
                          fontWeight: FontWeight.bold
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 245, 248, 251),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(color: Color.fromARGB(255, 245, 248, 251))),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(color: Color.fromARGB(255, 245, 248, 251))),
                          prefixIcon: const Icon(Icons.account_circle, color: Color.fromARGB(255, 62, 132, 168),),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    const Text("PASSWORD", style: TextStyle(
                      fontSize: 10, 
                      letterSpacing: 1.1, 
                      fontWeight: FontWeight.bold, 
                      color: Color(0xFF1B1446)), 
                      textScaler: TextScaler.linear(1.1)
                      ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      child: TextField(
                      style: const TextStyle(
                          color: Color(0xFF1B1446),
                          fontSize: 14,
                          letterSpacing: 1.1,
                          fontWeight: FontWeight.bold
                        ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 245, 248, 251),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(color: Color.fromARGB(255, 245, 248, 251))),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(color: Color.fromARGB(255, 245, 248, 251))),
                        prefixIcon: const Icon(Icons.lock, color: Color.fromARGB(255, 62, 132, 168),),
                        suffixIcon: InkWell(
                          borderRadius: BorderRadius.circular(100),
                          child: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off, color: const Color.fromARGB(255, 245, 209, 97),),
                            onTap: () {
                            setState(() {
                          _isObscure = !_isObscure;
                        });
                      }),
                      ),
                      
                      obscureText: _isObscure,
                    ),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      child: Row(
                        children: [
                          Transform.scale(
                            scale: 1.2,
                            child: Checkbox(
                              splashRadius: 10,
                              value: _isTicked, 
                              shape: const CircleBorder(), 
                              checkColor: const Color.fromARGB(255, 245, 209, 97), 
                              fillColor: const MaterialStatePropertyAll(Colors.white), 
                              side: MaterialStateBorderSide.resolveWith((states) => const BorderSide(width: 2.0, color: Color.fromARGB(255, 245, 209, 97))),
                              onChanged: (value) {
                              setState(() {
                                _isTicked = !_isTicked;
                              });
                            },),
                          ),
                          InkWell(
                            onTap: (){
                              setState(
                                (){
                                  _isTicked = !_isTicked;
                                }
                              );
                            },
                            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                            child: const Text("Remember me", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 245, 209, 97)), textScaler: TextScaler.linear(1.1),))
                        ],
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 20,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: OutlinedButton(
                      onPressed: (){},   
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white, 
                        backgroundColor: const Color.fromARGB(255, 245, 209, 97), 
                        side: const BorderSide(color: Colors.transparent),
                        minimumSize: const Size.fromHeight(52),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                        ),
                      child: const Text("SIGN IN", style: TextStyle(
                        color: Colors.white, 
                        fontSize: 11.5,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1),textScaler: TextScaler.linear(1.1),)
                      ),
                    ),
                    
                    const SizedBox(width: 10,),
                    OutlinedButton(
                      onPressed: (){}, 
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white, 
                        backgroundColor: Colors.white, 
                        minimumSize: const Size(40, 52), 
                        side: BorderSide(color: Colors.grey.shade300, width: 1), 
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
                      ),
                      child: Image.asset("assets/Faceid.png")
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Container(height:2, color: const Color(0xFFF6F8FB),)),
                const Padding(
                  padding:EdgeInsets.all(10),
                  child:Text("OR SIGN IN WITH", style: TextStyle(
                      fontSize: 9, 
                      letterSpacing: 1.1, 
                      fontWeight: FontWeight.bold, 
                      color: Color(0xAA1B1446)), 
                      textScaler: TextScaler.linear(1.1)
                      )),
                Expanded(child: Container(height:2, color: const Color(0xFFF6F8FB),)),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: (){}, 
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white, 
                        backgroundColor: Colors.white, 
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20), 
                        side: BorderSide(color: Colors.grey.shade200, width: 1), 
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                      ),
                      child: const Image(image: AssetImage("assets/Facebook.png"), width: 20,), 
                      ),
                    const SizedBox(width: 30,),
                    OutlinedButton(
                      onPressed: (){},  
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white, 
                        backgroundColor: Colors.white, 
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20), 
                        side: BorderSide(color: Colors.grey.shade200, width: 1), 
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),),
                      child: const Image(image: AssetImage("assets/Google.png"), width: 20,),),
                    const SizedBox(width: 30,),
                    OutlinedButton(
                      onPressed: (){},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white, 
                        backgroundColor: Colors.white, 
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20), 
                        side: BorderSide(color: Colors.grey.shade200, width: 1), 
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                        ),
                      child: const Image(image: AssetImage("assets/Apple.png"), width: 20,), ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  const Text("Don't have an account yet ?"),
                  const SizedBox(width: 10,),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const Register())
                      );
                    },
                    child: const Text("Sign up", style: TextStyle(color: const Color.fromARGB(255, 245, 209, 97)),)
                  )
                ]
              )
            ],
          ),
          ),
      ),
    );
  }
}