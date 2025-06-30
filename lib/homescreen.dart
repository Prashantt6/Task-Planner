import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
    home: homescreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class CurrentDateWidget extends StatelessWidget {
  String _getDayWithSuffix(int day) {
    if (day >= 11 && day <= 13) {
      return '${day}th';
    }
    switch (day % 10) {
      case 1:
        return '${day}st';
      case 2:
        return '${day}nd';
      case 3:
        return '${day}rd';
      default:
        return '${day}th';
    }
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final dayWithSuffix = _getDayWithSuffix(now.day);
    final month = DateFormat('MMMM').format(now);

    return Text(
      ' $dayWithSuffix $month',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontFamily: 'fonthead',
      ),
    );
  }
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent  ,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [

              // GREY HEADER CONTAINER
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  color: Color(0xFFE6E6FA),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 60,
                      left: 20,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/logo/avatar1.png'),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      right: 20,
                      child: Row(
                        children: [
                          Text(
                            "Hey Prashant",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontFamily: 'heycomic',
                            ),
                          ),
                          const Spacer(),
                          CurrentDateWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),


              Container(
                width: double.infinity,
                height: 360,
                child: Row(

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        height: 400,
                        width: 220,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFE6E6FA)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40,top: 10),
                          child: RichText(text: TextSpan(
                            text: "Todays Task",
                            style: TextStyle(
                              fontFamily: 'fonthead',
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.black
                            )
                          )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:10),
                      child: Container(
                          height: 400,
                          width: 200,
                          decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xFFE6E6FA)
                          ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10,top: 5),
                          child: RichText(text: TextSpan(
                              text: "Previous Incompleted Task",
                              style: TextStyle(
                                  fontFamily: 'fonthead',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.black
                              )
                          )),
                        ),
                      ),
                    )

                  ],
                ),
              ),

              SizedBox(height: 10),


              Container(
               child: Row(
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left: 10),
                     child: Container(
                       height: 300,
                       width: 220,
                       decoration:BoxDecoration(
                           borderRadius: BorderRadius.circular(20),
                           color: Color(0xFFE6E6FA)
                       ),
                       child: Padding(
                         padding: const EdgeInsets.only(left: 20,top: 10),
                         child: RichText(text: TextSpan(
                             text: "Prescheduled Task",
                             style: TextStyle(
                                 fontFamily: 'fonthead',
                                 fontWeight: FontWeight.w600,
                                 fontSize: 20,
                                 color: Colors.black
                             )
                         )),
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 10),

                       child: Column(
                         children: [
                         Container(

                         width: 200,
                         height: 300,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             color: Colors.lightBlueAccent
                         ),
                           child: Stack(
                             children: [
                               Positioned(
                                    top : 150,
                                   left: 80,
                                   child: Text("New Task",style: TextStyle(
                                     fontSize: 25,
                                     fontWeight: FontWeight.w800,
                                     fontFamily: 'fonthead'
                                   ),)),
                               Positioned(
                                   bottom: 20,
                                   left: 90,


                                   child: Container(
                                     width: 100,
                                     height: 100,
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(200),
                                       color: Color(0xFFE6E6FA)
                                     ),
                                     child: IconButton(onPressed: (){}, icon: TextButton.icon(onPressed: (){}, label: Text("+",style: TextStyle(
                                       fontSize: 50,
                                       fontWeight: FontWeight.w600,
                                       color: Colors.black

                                     ),)),
                                   ))
                               )
                             ],

                           ),

                       ),

                        ],

                     ),
                   )

                 ],

               ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
