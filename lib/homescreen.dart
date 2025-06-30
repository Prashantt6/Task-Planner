import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/Prescheduledtaskscreen.dart';
import 'package:to_do_list/Previoustaskscreen.dart';
import 'package:to_do_list/Todaytaskscreen.dart';

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
      backgroundColor:Color(0xFFADD8E6),

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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.grey
                                    ),
                                    child: CircleAvatar(
                                      radius:10,
                                      backgroundColor: Colors.red,
                                      backgroundImage: AssetImage('assets/logo/reminder2.jpg'),
                                    ),
                                  ),
                                ),
                                Text("Today's Task",style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "fonthead"
                                ),)

                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 300,
                                height: 285,
                                decoration: BoxDecoration(
                                    color: Color(0xFFE6E6FA),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 8.0,left: 120),
                                          child: ElevatedButton.icon(onPressed: (){
                                            Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => todaytaskscreen()));
                                          }, icon: Icon(Icons.arrow_forward),style:ElevatedButton.styleFrom(
                                            backgroundColor:Color(0xFFE6E6FA),
                                            foregroundColor: Colors.black,
                                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                                          ),label: Text('More'),),
                                        )
                                      ],
                                    )
                                  ],
                                ),

                              ),
                            )
                          ],
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: Colors.grey
                                    ),
                                    child: CircleAvatar(
                                      radius:10,
                                      backgroundColor: Colors.black,
                                      backgroundImage: AssetImage('assets/logo/images2.png'),
                                    ),
                                  ),
                                ),

                                Flexible(
                                  child: Text("Previous Incomplete Task",style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "fonthead"
                                  ),
                                  softWrap: true,
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 300,
                                height: 285,
                                decoration: BoxDecoration(
                                  // color: Colors.red
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 8.0,left: 100),
                                          child: ElevatedButton.icon(onPressed: (){
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context) => previoustaskscreen()));
                                          }, icon: Icon(Icons.arrow_forward),style:ElevatedButton.styleFrom(
                                            backgroundColor:Color(0xFFE6E6FA),
                                            foregroundColor: Colors.black,
                                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                                          ),label: Text('More'),),
                                        )
                                      ],
                                    )
                                  ],
                                ),

                              ),
                            )
                          ],
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
                         padding: const EdgeInsets.only(top: 10),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Row(
                               children: [
                                 Container(
                                   width: 50,
                                   height: 50,
                                   decoration: BoxDecoration(
                                     color: Colors.grey,
                                     borderRadius: BorderRadius.circular(50)
                                   ),
                                   child: CircleAvatar(
                                     backgroundImage: AssetImage('assets/logo/clock.jpg'),
                                   ),
                                 ),
                                 Flexible(
                                   child: Text('Pre Schedulded Tasks',style: TextStyle(
                                     fontSize: 15,
                                     fontWeight: FontWeight.bold,
                                     fontFamily: 'fonthead'
                                   ),
                                     softWrap: true,
                                   ),
                                 ),

                               ],
                             ),
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Container(
                                 width: 300,
                                 height:222 ,
                                 decoration: BoxDecoration(
                                   // color: Colors.red
                                 ),
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.end,
                                   children: [
                                     Row(
                                       children: [
                                         Padding(
                                           padding: const EdgeInsets.only(top: 8.0,left: 120),
                                           child: ElevatedButton.icon(onPressed: (){
                                             Navigator.push(context,
                                                 MaterialPageRoute(builder: (context) => presceduldedtaskscreen()));
                                           }, icon: Icon(Icons.arrow_forward),style:ElevatedButton.styleFrom(
                                             backgroundColor:Color(0xFFE6E6FA),
                                             foregroundColor: Colors.black,
                                             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                                           ),label: Text('More'),),
                                         )
                                       ],
                                     )
                                   ],
                                 ),
                               ),
                             )
                           ],
                         ),
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
                             color: Color(0xFFADD8E6)

                         ),
                           child: Stack(
                             children: [
                               Positioned(
                                    top : 240,
                                   left: 80,
                                   child: Text("New Task",style: TextStyle(
                                     fontSize: 25,
                                     fontWeight: FontWeight.bold,
                                     fontFamily: 'fonthead'
                                   ),)),
                               Positioned(
                                   bottom: 60,
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
