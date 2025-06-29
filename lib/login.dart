import 'package:flutter/material.dart';
import 'package:to_do_list/homescreen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

     appBar: AppBar(

       title: Text(" Task Planner"),
        centerTitle: true,
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         colors: [Color(0xFF00F5D4), // Aqua
      //           Color(0xFFF15BB5),],
      //         begin: Alignment.bottomLeft,
      //         end: Alignment.topRight,
      //       )
      //     ),
      //   ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white,
              Colors.deepPurple,
              Colors.white
             ],
            begin: Alignment.bottomLeft,
            end: Alignment.centerRight,
          )
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(

                    labelText: 'Username',
                    hintText: "Enter the username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),

                    )
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      // return "Please enter the username"
                    }
                    return null;
                  },
                ),

                SizedBox(height: 20),

                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter the password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Password required';
                    }
                    return AutofillHints.username;
                  },
                ),
                SizedBox(height: 20,),

                ElevatedButton(onPressed: () {
                  if (_formKey.currentState!.validate()) {

                          Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => const homescreen(


                          ),)



                    );
                  }
                },

                  child: Text('Login',

                   )
                ),
               ],
            ),
        ),
        ),
      ),
    );
  }
}
