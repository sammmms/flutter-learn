import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:travellingo/data.dart';
import 'package:travellingo/signin.dart';

class Setup extends StatefulWidget {
  final String email;
  const Setup({super.key, required this.email});

  @override
  State<Setup> createState() => _SetupState();
}

class _SetupState extends State<Setup> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController confirmEmail = TextEditingController();
  TextEditingController currentNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  String currentCountry = "62";
  String currentBirthday = "2001-01-01";
  bool isObstructed = true;
  bool isAgreeing = true;

  var errorCode = <String>{}; //F = FirstName || L = LastName || C = ConfirmEmail || E = Email || N = Number || P = Password || B = Birthday || A = Aggreement || S = ShortPassword
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SET UP YOUR ACCOUNT", style: TextStyle(fontSize: 13.5, letterSpacing: 1.1, fontWeight: FontWeight.bold), textScaler: TextScaler.linear(1.1),),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Color(0xFFF5D161)
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF1B1446),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("FIRST NAME", style: TextStyle(
                fontSize: 10, 
                letterSpacing: 1.1, 
                fontWeight: FontWeight.bold, 
                color: Color(0xFF1B1446)), 
                textScaler: TextScaler.linear(1.1)
                ),
              const SizedBox(height: 10,),
              TextField(
                controller: firstName,
                onChanged: (value){
                  setState(() {
                    if(value == ""){
                      errorCode.add("F");
                    }else{
                      errorCode.remove("F");
                    }
                  });
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
                ],
                decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.transparent)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.transparent)
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.redAccent)
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.redAccent)
                      ),
                      error: errorCode.contains("F") ? const Text("First name must be filled.", style:TextStyle(color: Colors.redAccent)) : null,
                      filled: true,
                      fillColor: const Color(0xFFF6F8FB),
                    ),
                style: const TextStyle(color:const Color(0xFF1B1446), letterSpacing: 1.1)
                ),
              const SizedBox(height: 20,),
              const Text("LAST NAME", style: TextStyle(
                fontSize: 10, 
                letterSpacing: 1.1, 
                fontWeight: FontWeight.bold, 
                color: Color(0xFF1B1446)), 
                textScaler: TextScaler.linear(1.1)
                ),
              const SizedBox(height: 10,),
              TextField(
                controller: lastName,
                onChanged: (value){
                  setState(() {
                    if(value == ""){
                      errorCode.add("L");
                    }else{
                      errorCode.remove("L");
                    }
                  });
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
                ],
                decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.transparent)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.transparent)
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.redAccent)
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.redAccent)
                      ),
                      error: errorCode.contains("L") ? const Text("Last name must be filled.", style:TextStyle(color: Colors.redAccent)) : null,
                      filled: true,
                      fillColor: const Color(0xFFF6F8FB),
                    ),
                style: const TextStyle(color:const Color(0xFF1B1446), letterSpacing: 1.1)
                ),
              const SizedBox(height: 20,),
              const Text("EMAIL", style: TextStyle(
                fontSize: 10, 
                letterSpacing: 1.1, 
                fontWeight: FontWeight.bold, 
                color: Color(0xFF1B1446)), 
                textScaler: TextScaler.linear(1.1)
                ),
              const SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.transparent)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.transparent)
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.redAccent)
                      ),
                      filled: true,
                      error: errorCode.contains("C") ? const Text("Email and Confirm Email doesn't match.", style:TextStyle(color: Colors.redAccent)) : null,
                      enabled:false,
                      hintText: widget.email,
                      fillColor: const Color(0xFFF6F8FB),
                    ),
                style: TextStyle(color:const Color(0xFF1B1446), letterSpacing: 1.1)
                ),
              const SizedBox(height: 20,),
              const Text("CONFIRM EMAIL", style: TextStyle(
                fontSize: 10, 
                letterSpacing: 1.1, 
                fontWeight: FontWeight.bold, 
                color: Color(0xFF1B1446)), 
                textScaler: TextScaler.linear(1.1)
                ),
              const SizedBox(height: 10,),
              TextField(
                controller:confirmEmail,
                keyboardType: TextInputType.emailAddress,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z@.]'))
                ],
                onChanged: (value){
                  setState(() {
                    if(value == ""){
                      errorCode.add("E");
                      errorCode.remove("C");
                      return;
                    }else{
                      errorCode.remove("E");
                    }
                    if(value != widget.email){
                      errorCode.add("C");
                    }else{
                      errorCode.remove("C");
                    }
                  });
                },
                decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.transparent)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.transparent)
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.redAccent)
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.redAccent)
                      ),
                      error: errorCode.contains("C") ? const Text("Email and confirm email doesn't match.", style:TextStyle(color: Colors.redAccent)) : errorCode.contains("E") ? const Text("Confirm email must be filled.", style:TextStyle(color: Colors.redAccent)) : null,
                      filled: true,
                      fillColor: const Color(0xFFF6F8FB),
                    ),
                style: TextStyle(color:const Color(0xFF1B1446), letterSpacing: 1.1)
                ),
              const SizedBox(height: 20,),
              const Text("PHONE NUMBER", style: TextStyle(
                fontSize: 10, 
                letterSpacing: 1.1, 
                fontWeight: FontWeight.bold, 
                color: Color(0xFF1B1446)), 
                textScaler: TextScaler.linear(1.1)
                ),
              const SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor: Color.fromRGBO(246, 248, 251, 1)
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFF6F8FB)
                      ),
                      child: DropdownButton(
                        value: currentCountry,
                        iconEnabledColor: const Color(0xFF0768FD),
                        padding: EdgeInsets.fromLTRB(15, 7, 5, 5),
                        borderRadius: BorderRadius.circular(20),
                        underline: Container(color:Colors.transparent),
                        items: listCountry.keys.map<DropdownMenuItem<String>>((items){
                          return DropdownMenuItem(
                            value: listCountry[items].toString(),
                            child: Row(children: [
                              Text(listCountry[items].toString()),
                              SizedBox(width: 10,),
                              Image.asset("assets/${items}.png")
                            ],)
                          );
                        }).toList(), 
                        onChanged: (value){
                          setState((){
                            currentCountry = value.toString();
                          });
                        }),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child:TextField(
                      controller: currentNumber,
                      inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(11),
                        ],
                      onChanged: (value){
                        setState(() {
                          if(value == ""){
                            errorCode.add("N");
                          }else{
                            errorCode.remove("N");
                          }
                        });
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.transparent)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.transparent)
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.redAccent)
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.redAccent)
                        ),
                        error: errorCode.contains("N") ? const Text("Phone number must be filled.", style:TextStyle(color: Colors.redAccent)) :  null,
                        filled: true,
                        fillColor: const Color(0xFFF6F8FB),
                        prefix: Text("${currentCountry} - ", style: TextStyle(color: Colors.black),)
                      ),
                    )),
                ]
              ),
              const SizedBox(height: 20,),
              const Text("BIRTHDAY", style: TextStyle(
                fontSize: 10, 
                letterSpacing: 1.1, 
                fontWeight: FontWeight.bold, 
                color: Color(0xFF1B1446)), 
                textScaler: TextScaler.linear(1.1)
                ),
              const SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFF6F8FB)
                ),
                child:Row(
                  children:[
                    Expanded(
                      child: TextField(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(RegExp('[0-9/]')),
                                        LengthLimitingTextInputFormatter(10)
                                      ],
                                      decoration: InputDecoration(
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.transparent)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.transparent)
                        ),
                        filled: true,
                        fillColor: const Color(0xFFF6F8FB),
                        hintText: currentBirthday,
                        enabled: false
                      ),
                      style: TextStyle(color:const Color(0xFF1B1446), letterSpacing: 1.1, fontWeight: FontWeight.bold)
                                      ),
                    ),
                InkWell(
                        onTap:(){
                          showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime.now()).then((selectedDate){setState(() {
                            if(selectedDate?.day != null){
                              currentBirthday = selectedDate.toString().split(' ')[0];
                            }
                          });});
                        },
                        child:const Padding(
                          padding:EdgeInsets.all(15), 
                          child:Icon(Icons.calendar_month_outlined, color: Color(0xFFF5D161)),)
                      ),
                  ]
                ),
              ),
              const SizedBox(height: 20,),
              const Text("ACCOUNT PASSWORD", style: TextStyle(
                fontSize: 10, 
                letterSpacing: 1.1, 
                fontWeight: FontWeight.bold, 
                color: Color(0xFF1B1446)), 
                textScaler: TextScaler.linear(1.1)
                ),
              const SizedBox(height: 10,),
              TextField(
                controller:password,
                onChanged: (value){
                  setState(() {
                    if(value == ""){
                      errorCode.add("P");
                    }
                    else{
                      errorCode.remove("P");
                    }
                    if(value.length < 8){
                      errorCode.remove("P");
                      errorCode.add("S");
                    }
                    else{
                      errorCode.remove("S");
                    }
                  });
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.transparent)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.transparent)
                  ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.redAccent)
                    ),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.redAccent)
                    ),
                  error: errorCode.contains("P") ? const Text("Password shouldn't be empty.", style:TextStyle(color: Colors.redAccent)) :  errorCode.contains("S") ? const Text("Password should contain at least 8 letters.", style:TextStyle(color: Colors.redAccent))  : null,
                  filled: true,
                  fillColor: const Color(0xFFF6F8FB),
                  suffixIcon: InkWell(
                    onTap: (){
                      setState(() {
                        isObstructed = !isObstructed;
                      });
                    },
                    overlayColor: MaterialStatePropertyAll(Colors.transparent),
                    child: isObstructed ? Icon(Icons.visibility, color: Color(0xFFF5D161)) : Icon(Icons.visibility_off, color: Color(0xFFF5D161))
                    )
                ),
              obscureText: isObstructed,
              style: TextStyle(color:const Color(0xFF1B1446), letterSpacing: 1.1)
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  Checkbox(
                    value: isAgreeing, 
                    onChanged: (value){setState(() {
                      isAgreeing = !isAgreeing;
                      if(isAgreeing){
                        errorCode.remove("A");
                      }else{
                        errorCode.add("A");
                      }
                    });},
                    shape: const CircleBorder(),
                    fillColor: MaterialStatePropertyAll(Colors.transparent),
                    checkColor: Color(0xFFF5D161),
                    side: MaterialStateBorderSide.resolveWith((states) => const BorderSide(width: 2.0, color: Color.fromARGB(255, 245, 209, 97)))
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      const Row(
                        children: [
                          Text("I agree to Travellingo's ", style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold,color: Color(0xFF1B1446)), textScaler: TextScaler.linear(1.1),),
                          Text("Terms of Service", style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold,color: Color(0xFFF5D161)), textScaler: TextScaler.linear(1.1),)
                        ],
                      ),
                      errorCode.contains("A") ? const Text("You must agree to our terms and condition to proceed.", style:TextStyle(color: Colors.redAccent, fontSize: 10)) : const SizedBox(height: 0,),
                    ],)
                    
                ]
                ),
              const SizedBox(height: 40,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 48,
                child: Expanded(
                  child: OutlinedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Color(0xFFF5D161)),
                      side: MaterialStatePropertyAll(BorderSide(color:Colors.transparent)),
                      foregroundColor: MaterialStatePropertyAll(Colors.white)
                    ),
                    onPressed: (){
                      setState(() {
                        if(firstName.text == ""){errorCode.add("F");}
                        if(lastName.text == ""){errorCode.add("L");}
                        if(confirmEmail.text == ""){errorCode.add("E");}
                        if(currentNumber.text == ""){errorCode.add("N");}
                        if(password.text == ""){print(password.text);errorCode.add("P");}
                      });
                      if(errorCode.isEmpty){
                        if(!(firstName.text == "" || lastName.text == "" || confirmEmail.text == "" || currentNumber.text == "" || password.text == ""))
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context)=>SignIn())
                        );
                      }
                    }, 
                    child: const Text("CONTINUE", style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1.1), textScaler: TextScaler.linear(1.1))),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
