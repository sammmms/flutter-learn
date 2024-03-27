import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:travellingo/data.dart';

class Setup extends StatefulWidget {
  final String email;
  const Setup({super.key, required this.email});

  @override
  State<Setup> createState() => _SetupState();
}

class _SetupState extends State<Setup> {
  String currentCountry = "62";
  String currentBirthday = "2001-01-01";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Set Up Your Account", style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Color(0xFFF5D161)
        ),
        backgroundColor: Colors.white,
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
                        padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
                        borderRadius: BorderRadius.circular(20),
                        underline: Container(color:Colors.transparent),
                        items: listCountry.keys.map<DropdownMenuItem<String>>((items){
                          return DropdownMenuItem(
                            value: listCountry[items].toString(),
                            child: Row(children: [
                              Text(listCountry[items].toString()),
                              SizedBox(width: 10,),
                              Image.asset("${items}.png")
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
                      inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(11),
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
                )
              )
            ],
          ),
        ),
      )
    );
  }
}
